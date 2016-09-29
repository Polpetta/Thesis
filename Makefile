#Author: Polonio Davide <poloniodavide@gmail.com>
#License: GPLv3

all:
	latexmk -silent -pdflatex='pdflatex -interaction=nonstopmode' -pdf -jobname='Presentazione'
clean:
	latexmk -C
