# Spaceport America Cup Document Template
This repository provides a class file and templates for Project Technical
Reports and Extended Abstracts to the Spaceport America Cup. The document class
is subclassed into `report` and `eabstract` to match the slighly different
formatting required for each. 

## Directory structure
The class file, report, and extended abstract are in the repository root.

`lib` is short for "libraries" and contains supplemental classes or source
files, such as the bibliography style, bibliography, and tech report section
descriptions.

`ref` is short for "references" and contains several rules documents and a
presentation given at the 2022 SAC by Mike Bertin on best practices for writing
technical reports to the SAC.

`fig` is short for "figures" and may be used to hold the report's graphics.  The
name and use of this directory is purely up to the user, but the examples (if
not modified) will not compile if this directory and its files are not present.

## Technical Report Template
The tech report uses `\documentclass[report]{sac}`. The major sections and parts
of required appendicies are present. The report's compilation is controlled by
three flags: `\wip`, `\figures`, and `\dwg`.

`\wiptrue` compiles all of the "work-in-progress" markers: the section
descriptions taken from the (at time of writing, 2023) Rules and Requirements,
italicized and in small font, formatting examples (throughout the text and in
the first appendix), and a DRAFT watermark. 

`\figurestrue` compiles the report with figures and tables. This is intended to
be commented out briefly, to check that the report body satisfies the 25-page
text-only limit.

`\dwgtrue` compiles the report with drawings. This is intended to be used only
at the very end, as mechanical drawings substantially increase compilation time
and file size. If used in conjunction with `\putdrawings{<path>}`, the flag will
add the specified PDF, preserving page sizes.

## Extended Abstract Template
Barebones template for Extended Abstracts.
