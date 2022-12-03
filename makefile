ifndef $(target)
        target = example
endif

all:
	latexmk -pdf -halt-on-error example.tex
	cp example.pdf $(target).pdf
	make clean
clean:
	latexmk -c
