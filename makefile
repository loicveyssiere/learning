# ==============================================================================
# 	ROOT MAKEFILE FOR LEARNING PROJECT
# ==============================================================================

# ------------------------------------------------------------------------------
# 	VARIABLES: only make changes in this section
# ------------------------------------------------------------------------------
LATEX_RESULT_DIR=notes
LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf -synctex=1
CONTINUOUS=#-pvc

# ------------------------------------------------------------------------------
# 	VARIABLE CONSTRUCTION
# ------------------------------------------------------------------------------
MAINS=$(wildcard latex/*/main.tex)
SECTIONS=$(MAINS:latex/%/main.tex=%)

# ------------------------------------------------------------------------------
# 	RULES
# ------------------------------------------------------------------------------
all: notes

notes: $(SECTIONS:%=notes/%.pdf)

$(LATEX_RESULT_DIR)/%.pdf: latex/%/main.tex
	@echo "===================================================================="
	@echo "Working on" $(basename $@) "directory"
	@echo "Working on" $< "directory"
	#@mkdir -p $(basename $@)
    #latexmk -outdir=test $<
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) -pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" -outdir=$(LATEX_RESULT_DIR)/tmp_$* -jobname=$* $<
	@mv $(LATEX_RESULT_DIR)/tmp_$*/$*.pdf $(LATEX_RESULT_DIR)/$*.pdf 
	@echo "Output file" $@ "created successfully!"
	@echo "===================================================================="

clean:
	@rm -rf notes/tmp_*

deep-clean: clean
	@rm -rf notes/*.pdf

audit:
	@echo "The system is ok"

.PHONY: notes clean deep-clean audit all