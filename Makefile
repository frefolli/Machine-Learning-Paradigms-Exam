SLIDES=slides

@all: ${SLIDES}.pdf

${SLIDES}.pdf: ${SLIDES}.tex ./figures/*.png quotes.bib
	pdflatex ${SLIDES}.tex
	bibtex ${SLIDES}
	pdflatex ${SLIDES}.tex

clean:
	rm -rf *.idx ${SLIDES}.pdf ${SLIDES}.pdf *-blx.bib *.aux *.log *.run.xml *.toc *.ilg *.ind *.bbl  *.blg *.out *.nav *.snm *.vrb
