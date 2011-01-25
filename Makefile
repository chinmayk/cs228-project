
default: all

model.eps: model.dot
	dot -Tps -o model.eps model.dot

proposal.pdf: proposal.tex main.bib model.eps
	@latex proposal
	@bibtex proposal
	@latex proposal
	@latex proposal
	@dvips proposal.dvi > /dev/null
	@ps2pdf proposal.ps > /dev/null

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
