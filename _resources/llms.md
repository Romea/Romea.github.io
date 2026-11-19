---
title: "LLMs: tips and good practice"
description: Practical workflows, reusable instructions and scientific responsibility when using language models.
author: m_ounally
resource_category: llms
order: 2
icon: far fa-comments
last_modified_at: 2026-11-19
---

Use a model for a task you can check: explaining a passage, reviewing a
paragraph or checking an implementation. Keep the paper, code or data beside
you while you work.

## Before using a tool

Choose a task for which you can check the answer. Keep unpublished manuscripts,
internal projects, personal data and confidential material within the tools
and arrangements approved for that work. Ask your supervisor when the status
of a document or service is unclear.

INRAE's [responsible-use guidance](https://science-ouverte.inrae.fr/sites/default/files/2025-11/FICHE%20IA%20notice%20n%E2%94%AC%E2%96%911%20191125.pdf)
sets out practical precautions for using generative AI. Check the current
institutional guidance and the rules of the intended journal or conference.

## Reading papers

Keep the original paper open. Give the model a focused question and the
relevant material, when sharing it is permitted. Ask it to identify the
assumptions, evidence and limitations, with references to specific sections
or equations. Read those passages yourself before using the answer.

A useful starting instruction is:

> Use the supplied paper to identify its research question, assumptions,
> method and experimental evidence. For each point, give the relevant section
> or equation. Separate the authors' claims from your own interpretation.
> Mark anything that the paper does not establish.

Check every reference against the original publication or a trusted archive.
Keep your bibliography in a reference manager. A plausible title or a working
link alone does not establish that a paper supports a claim.

## Writing and code

For a draft, specify the intended reader and the point of the paragraph.
Check that an edit preserves the scientific meaning, scope and attribution.
The authors should be able to explain and defend every statement they keep.

For code, describe the expected behaviour, assumptions, inputs and units.
Read the proposed changes and check them with independent examples or tests.
Review software affecting a physical robot before it is used in an experiment.

## Scientific responsibility

Keep a clear distinction between a suggestion, a hypothesis and an established
result. Do not present generated data, references or explanations as something
you measured or demonstrated. Check derivations, assumptions and code yourself,
and keep enough detail for a colleague to reproduce the work.

Discuss substantial assistance with your coauthors. Preserve credit for the
people and sources behind the work, and keep a record of uses that affect the
method, analysis or manuscript. Scientific judgement and responsibility remain
with the researchers.

For a submitted paper, follow the venue's disclosure requirements. IEEE's
[AI-generated content policy](https://journals.ieeeauthorcenter.ieee.org/become-an-ieee-journal-author/publishing-ethics/guidelines-and-policies/submission-and-peer-review-policies/)
distinguishes generated content from editing assistance. Check the current
policy for your publication rather than assuming that one rule applies everywhere.

## Reusable instructions and skills

For a recurring task, keep a short instruction file describing the inputs,
the expected result, the sources to use and the checks to perform. This can
form the basis of a reusable skill for paper reading, code review or editing.
Give it a narrow purpose and revise it when it repeatedly misses something.

For example, a paper-reading workflow can ask for the research question,
assumptions, closest comparisons and evidence, with a source location for each
point. Try it on a paper you know well before relying on it for new material.
The reading instruction above is a starting point for that exercise.

## Further reading

- Liu et al., [Lost in the Middle: How Language Models Use Long Contexts](https://aclanthology.org/2024.tacl-1.9/), TACL 2024.
  Explores how the position of information in a long input affects retrieval.
- Lewis et al., [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401), NeurIPS 2020.
  Introduces a method combining retrieved documents with language generation.
