# Main document
MAIN = wut_thesis
PDF  = $(MAIN).pdf

# LaTeX engine
LATEX  = xelatex
BIBTEX = bibtex

# Flags
LATEX_FLAGS  = -shell-escape -interaction=nonstopmode -file-line-error
# TEX_OPTIONS  = $(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# Directories and dependencies
CHAPTERS = $(wildcard chapters/*.tex)
PREFACE  = $(wildcard thesis-preface/*.tex)
SRC      = $(wildcard src/*.tex)
BIB      = bibliography/references.bib
ALGOS    = algorithms/alg-template.tex
TEXFILES = $(MAIN).tex thesis-title.tex thesis-preface.tex thesis-main.tex thesis-appendix.tex \
           $(CHAPTERS) $(PREFACE) $(SRC) $(ALGOS)

# Rules
all: $(PDF)

$(PDF): $(TEXFILES) $(BIB)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

.PHONY: clean
clean:
	rm -f *.aux *.log *.bbl *.blg *.out *.toc *.lof *.lot *.fls *.fdb_latexmk \
	      $(MAIN).synctex.gz $(PDF)

.PHONY: cleanall
cleanall: clean
	rm -f $(PDF)

