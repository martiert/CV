all: CV.pdf

%.pdf: %.tex
	latexmk -output-directory=out -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

.PHONY: clean depclean

clean:
	rm -rf out
