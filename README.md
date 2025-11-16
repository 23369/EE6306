# EE6306 Exam Archive

This repository hosts the EE6306 exam PDFs (2022–2025), their OCR/text transcriptions, and a curriculum-ordered study digest that summarizes every topic, formula, and recurring question pattern.

## Repository layout
- `EE6306 YYYY-YYYY Semester X.pdf` – original exam papers.
- `processed/EE6306 YYYY-YYYY Semester X.txt` – OCR + `pdftotext` outputs that make the PDFs searchable.
- `SUMMARY.md` – detailed knowledge-map organized by textbook ordering (MOS → Test). Each row lists the problem type, focus, and LaTeX formulas to revisit.

## Reproducing the OCR pipeline
1. Install tools: `apt-get update && apt-get install -y ocrmypdf poppler-utils`.
2. Run `ocrmypdf <input.pdf> <output.pdf>` for each exam that lacks a text layer.
3. Convert to plaintext via `pdftotext <output.pdf> processed/<name>.txt`.
4. Update `SUMMARY.md` after reviewing the transcripts.

## Using the study summary
- Start with the “总览” table in `SUMMARY.md` to see question frequencies.
- Drill into sections 1–8 to match textbook chapters; each question explicitly states the formulas it needs (e.g., \(V_T=V_{T0}+\gamma(\sqrt{2\phi_F+V_{SB}}-\sqrt{2\phi_F})\)).
- Use the embedded citations (e.g., `processed/...txt`) to jump back to the full text of the exam problems.

## Pull request tips
If you expand the archive or add new analyses, please:
1. Regenerate the processed text files with the commands above.
2. Extend `SUMMARY.md` with the same table structure.
3. Commit the changes with a descriptive message (e.g., `git commit -am "Add 2025 Sem2 summary"`).
4. Open a PR that states the newly covered exams and any tooling changes so reviewers can trace the workflow.


## Current GitHub / PR status
This workspace runs entirely inside the provided container; it has **no** connection to your GitHub remote, so nothing has been pushed upstream yet. To publish these changes you will need to:

1. Add your GitHub repository as a remote (e.g., `git remote add origin git@github.com:<user>/<repo>.git`).
2. Push the `work` branch (or whichever branch you choose) with `git push origin work`.
3. Open a pull request on GitHub describing the latest commits (the summary above is a good starting point).

Until you perform those steps in your own environment, there is no live GitHub PR associated with this study archive.
