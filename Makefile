

proposal.pdf: proposal.tex proposal.bib
	latex proposal
	bibtex proposal
	latex proposal
	latex proposal
	@dvips proposal.dvi > /dev/null
	@ps2pdf proposal.ps > /dev/null

clean:
	rm -f proposal.aux proposal.bbl proposal.blg proposal.log proposal.ps proposal.dvi proposal.pdf
