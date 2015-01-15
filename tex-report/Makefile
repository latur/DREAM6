# Generic make file for LaTeX: requires GNU make

PDFLATEX = pdflatex --file-line-error-style --shell-escape
TEXFILE  = index.tex

.PHONY: clean pdf

pdf: 
	$(PDFLATEX) $(TEXFILE)
	$(PDFLATEX) $(TEXFILE)

clean:
	@rm -f \
	$(TEXFILE:.tex=.aux) \
	$(TEXFILE:.tex=.log) \
	$(TEXFILE:.tex=.out) \
	$(TEXFILE:.tex=.pdf) \
	$(TEXFILE:.tex=.toc)
	
