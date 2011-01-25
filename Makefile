
default: all

model.eps: model.dot
	dot -Tpdf -o model.pdf model.dot

proposal.pdf: proposal.tex main.bib model.eps
	@pdflatex proposal
	@bibtex proposal
	@pdflatex proposal
	@pdflatex proposal

old.pdf: old.tex main.bib fig/exReview.pdf fig/results.pdf
	@pdflatex old
	@bibtex old
	@pdflatex old
	@pdflatex old

clean:
	rm -f model.eps
	rm -f *.aux *.bbl *.log
	rm -f *.aux *.blg *.log
	rm -f proposal.ps proposal.dvi proposal.pdf
	rm -f old.ps old.dvi old.pdf

all: proposal.pdf model.eps
