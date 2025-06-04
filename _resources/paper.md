---
title: "Tips for writing a robotic conference paper"
header:
  teaser: assets/images/resources/paper_300x200.png
---

![intro figure](/assets/images/resources/paper.png)

This post presents a few guidelines on how to write a paper for a robotic conference, mostly intended for ICRA and IROS.
First, check the required number of pages for the paper and use the correct template from the conference website. 

## Who should be an author in my paper?

Authors should be decided early in the writing process to avoid conflicts afterwards.

An author is expected to provide substantial help with the paper: this can range from help in the theory, experiments, figure generation and writing. 

- If someone did not contribute significantly but still helped you, they should be thanked in the **Acknowledgments** section. 
- Once an author has been added to the paper, **never** remove them. Doing so will only create issues and dissatisfaction.

## General tips
- In the latex document, break a line after each sentence. It helps a lot for reviewing and late edition (e.g., commenting a sentence).
- Keep a local version of the latex document. Overleaf and other online editors always have a small chance of being down right before the submission.
- Keep the size of the pdf below 6M: compress figures, and in very specific cases, rasterize your figures.
- Be aware that writing a paper takes time, and getting reviews from your supervisors is not instantaneous. Ideally, a first full version of the paper should be sent 1 month prior to the deadline.
- Do not underestimate the time needed to convert good results (e.g., my robot performs a novel task) into a paper - it is a matter of months and not weeks.

 

# Paper structure

## Abstract

- **State Facts**: Clearly state the facts without under-selling or over-selling your work. Ensure it is proofread thoroughly. If possible, this part should not be written by the first author but a more senior researcher.
- **Marketing**: The abstract is the "marketing" part of your paper. It should be engaging and clearly convey the significance of your work.

## Introduction
The introduction gives the context and motivation of the research.

- **General to Specific**: Start with general information and narrow down to specific details.
The introduction should answer these five questions:
1. What is the problem?
2. Why is it interesting and important?
3. Why is it hard (the trivial, brute force method would not work)? 
4. Why has it not been solved before / how is our paper different?
5. What is our solution?

- **Contributions**: After explaining the context and problem, write a bullet list of 2~3 items to clearly state the contributions of the paper.
Conclude the introduction with an outline of the paper, if space permits. This section is optional and is often the first to be omitted when the paper exceeds the maximum page limit. 
- **Figure**: Include a figure to illustrate the problem.
- **Outline**:  Conclude the introduction with an outline of the paper, if space permits. This section is optional and is often the first to be omitted when the paper exceeds the maximum page limit. 

## Related Work
This section present the overall state of the research around the problem you exposed in the introduction. By the end of the section, the reader should have a good understanding of what is already done and what are the novely in this paper.

- **Extensive List**: Provide an extensive list of related papers, typically 20-30 citations.
- **Red Thread**: Keep a "red thread" throughout the section; it should not just be a list of papers.
- **Structure**: Each paragraph should convey a specific idea.
- **Comparison**: Keep the closest papers for the end of the section and spend more time on them. The reader will expect a comparison with the most recent and relevant work in the Experiments section.

## Theory
In the theory, present your method as clearly as possible. At this point we know students can do maths and complex things: try to make it as accessible and easy to understand as possible. Ultimately, a research paper is about disseminating the science to the world, not showing the world you did complex things!

- **Storytelling**: Tell a story of the results, not how you arrived there.
- **Figures**: Use 1-2 figures for notations or explanations.
- **Notations**: Only introduce the notations you need as they induce a higher workload for the reader.
- **Reproducibility**: Provide all the information so that someone else could re-code your method.
- **Mathematics**: Include equations in the flow of the text. Explicitly state all assumptions, but avoid direct mathematical developments unless they are crucial and you have space. All equations should be labeled so that another paper can refer to them if needed.

## Experiments
The experiments are here to back up your claims about the contributions and novelty.

- **Clarity**: Be clear and avoid vague statements like "we think," "maybe," or "for various reasons."
- **Quantitative Results**: Include at least one 'curve' with quantitative results.
- **Labels**: Describe the figure labels clearly.
- **Presentation**: Take the time to present how you obtained the data, pinpoint what to look at, and analyze and conclude the results. Remember, the reader may be lazy, so maintain a high information ratio.

## Conclusion
This part should factually summarize the paper. Researchers often only scans the abstract and conclusion.

- **Summary**: Provide a brief summary of your contributions, experiments and limitations of the method.
- **Future Work**: Discuss potential future work and research directions.

## Acknowledgments

- **Grants**: Triple-check with your PhD director what to include in the acknowledgments.
- **Other**: You can also thank people that helped in the paper but are not authors.

## References

- **Completeness**: Ensure all references are complete with authors, year, pages, number, etc.
- **Formatting**: Remove URLs and DOIs from the citations.
