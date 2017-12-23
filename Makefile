.phony: pdf

pdf: CV.tex
	pdflatex CV.tex

dvi: CV.tex
	latex CV.tex

clean:
	rm *.aux *.dvi *.log

fullclean: clean
	rm *.pdf
