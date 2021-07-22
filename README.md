#Analysis of RNA-seq transciptomic data from total and polysomal mRNA fractions from an epithelial cancer cell line
Latex source code for my bachelor thesis

## Repo structure
* bibliography: file biblio.bib, bibliography entries for bibtex.
* build: final pdf and structure.
* chapters: contains a subfolder containing the tex file for every chapter, including the summary and the attachments containing the tex source file and an optional folder for images and tables.
* prefixes: source files for the title page and acknowledgements, subfolder containing the university logo.
* scripts: couple of scripts for building the pdf and uploading it to google drive.
* fantoni_giacomo_informatica_21.tex: main tex source file containing the pdf structure.

## Document structure
* Summary: brief description of the project (max 3 pages)
* Chapter 1: Introduction, biological processes of interest.
* WIP Chapter 2: Cell line and conditions, what and why we used them.
* Chapter 3: Data used and pipeline.
* Chapter 4: Data Analysis.
* Attachments: TO DO

## Building
To build the pdf execute:
`scripts/build_script.sh`

## Todos
* For every chapter: choose a bibliography, start from there and write it.

## Issues

## Scripts
### Dependencies
* build_script.sh: latex environment <https://www.latex-project.org/get/#tex-distributions>
* Saving to drive: package gdrive, available at <https://github.com/prasmussen/gdrive>
