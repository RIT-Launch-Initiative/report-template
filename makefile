ifndef $(target)
        target = example
endif

all:
	latexmk -pdf -halt-on-error example.tex
	cp example.pdf $(target).pdf
clean:
	rm -f *.aux
	rm -f *.dvi
	rm -f *.fdb_latexmk
	rm -f *.fls
	rm -f *.log
	rm -f *.toc
