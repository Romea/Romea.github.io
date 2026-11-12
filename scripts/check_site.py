"""Check generated pages, local links and search metadata after a Jekyll build."""

import json
import sys
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urljoin, urlsplit
from xml.etree import ElementTree


class Page(HTMLParser):
    def __init__(self, text):
        super().__init__()
        self.links = []
        self.canonical = None
        self.ids = set()
        self.schemas = []
        self.metadata = {}
        self.in_schema = False
        self.feed(text)

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == "meta":
            name = attrs.get("name", attrs.get("property"))
            self.metadata.setdefault(name, []).append(attrs.get("content", ""))
        if "id" in attrs:
            self.ids.add(attrs["id"])
        if tag == "a" and "href" in attrs:
            self.links.append(attrs["href"])
        if tag in ("img", "script") and "src" in attrs:
            self.links.append(attrs["src"])
        if tag == "link":
            self.links.append(attrs.get("href", ""))
            if attrs.get("rel") == "canonical":
                self.canonical = attrs["href"]
        if tag == "script" and attrs.get("type") == "application/ld+json":
            self.in_schema = True

    def handle_endtag(self, tag):
        if tag == "script":
            self.in_schema = False

    def handle_data(self, data):
        if self.in_schema:
            self.schemas.append(json.loads(data))


def check(root):
    base = "https://rleaf.mathnum.inrae.fr"
    errors = []
    pages = {}
    for path in root.rglob("*.html"):
        text = path.read_text()
        if "<html" not in text:
            continue
        pages[path] = Page(text)
        if "<title>" not in text or not pages[path].canonical:
            errors.append(f"Missing title or canonical: {path}")
        if any(word in text for word in ("blabla about you", "John Doe", "link-to-whatever-social-network")):
            errors.append(f"Published placeholder: {path}")
        canonical = urlsplit(pages[path].canonical or "")
        if canonical.scheme != "https" or canonical.netloc != urlsplit(base).netloc or "//" in canonical.path:
            errors.append(f"Invalid canonical: {path}")
        metadata = pages[path].metadata
        if not any(metadata.get("description", [])):
            errors.append(f"Missing page description: {path}")
        if "citation_title" in metadata:
            for field in ("citation_title", "citation_author", "citation_publication_date"):
                if not all(metadata.get(field, [""])):
                    errors.append(f"Missing {field}: {path}")
            for pdf in metadata.get("citation_pdf_url", []):
                target = root / urlsplit(pdf).path.lstrip("/")
                if not target.is_file() or urlsplit(pdf).path.rsplit("/", 1)[0] != canonical.path.rstrip("/"):
                    errors.append(f"Citation PDF must exist alongside its article: {path}")

    for path, page in pages.items():
        page_url = base + "/" + path.relative_to(root).as_posix()
        for link in page.links:
            url = urlsplit(urljoin(page_url, link))
            if url.scheme not in ("http", "https") or url.netloc != urlsplit(base).netloc:
                continue
            target = root / unquote(url.path).lstrip("/")
            if target.is_dir():
                target /= "index.html"
            if not target.is_file():
                errors.append(f"Broken link in {path}: {link}")
            elif url.fragment and target in pages and unquote(url.fragment) not in pages[target].ids:
                errors.append(f"Missing anchor in {path}: {link}")

    people = (root / "people/index.html").read_text()
    if 'class="person-card"' not in people:
        errors.append("The current members grid is empty")
    sitemap = (root / "sitemap.xml").read_text()
    for node in ElementTree.fromstring(sitemap).iter():
        if node.tag.endswith("}loc") and "//" in urlsplit(node.text).path:
            errors.append(f"Invalid sitemap URL: {node.text}")
    search = (root / "assets/js/lunr/lunr-store.js").read_text()
    if "John Doe" in sitemap + search or "/people/jdoe/" in sitemap + search:
        errors.append("Template profile appears in sitemap or search")
    if "Mohamed Ounally" not in search:
        errors.append("Mohamed's profile is missing from search")
    if f"Sitemap: {base}/sitemap.xml" not in (root / "robots.txt").read_text():
        errors.append("robots.txt must point to the canonical sitemap")
    if "{{" in (root / "llms.txt").read_text():
        errors.append("llms.txt contains unrendered template tags")
    bibliography = (root / "publications.bib").read_text()
    if not bibliography.startswith("@") or "<html" in bibliography:
        errors.append("publications.bib must contain raw BibTeX")
    if errors:
        raise SystemExit("\n".join(errors))
    print(f"Checked {len(pages)} HTML pages, local links, JSON-LD, sitemap and search.")


if __name__ == "__main__":
    check(Path(sys.argv[1] if len(sys.argv) > 1 else "_site"))
