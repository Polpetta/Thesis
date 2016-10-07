#Author: Polonio Davide <poloniodavide@gmail.com>
#License: GPLv3

all:
	latexmk -pdflatex='pdflatex -interaction=nonstopmode' -pdf -jobname='Presentazione'
clean:
	latexmk -C -jobname='Presentazione'
