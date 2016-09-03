#Author: Polonio Davide <poloniodavide@gmail.com>
#License: GPLv3

OUTPUT_NAME= Tesi
LIST_NAME= listOfSections.tex
PATH_OF_CONTENTS= res/sections
MAIN_FILE= main

SHELL := /bin/bash #Need bash not shell

all: compile

compile: clean
	set -e; \
	function glossary () { \
	  makeindex -s $(MAIN_FILE).ist -t $(MAIN_FILE).glg -o $(MAIN_FILE).gls \
	$(MAIN_FILE).glo; \
	  makeindex -s $(MAIN_FILE).ist -t $(MAIN_FILE).alg -o $(MAIN_FILE).acr \
	$(MAIN_FILE).acn; \
  }; \
	function generatePdf () { \
	  pdflatex $(MAIN_FILE); \
	  biber $(MAIN_FILE); \
	  glossary; \
  }; \
	if [[ -a "res/$(LIST_NAME)" ]]; then echo "Removing res/$(LIST_NAME)"; \
		rm res/$(LIST_NAME); fi; \
	for i in $(sort $(wildcard $(PATH_OF_CONTENTS)/*.tex)); do \
		echo "Adding $$i into $(LIST_NAME)"; \
		echo "\input{$$i}" >> res/$(LIST_NAME); \
	done; \
	for j in {1..2}; do \
	  generatePdf; \
  done; \
	for k in {1..2}; do \
	  pdflatex $(MAIN_FILE); \
  done; \
	mv $(MAIN_FILE).pdf $(OUTPUT_NAME).pdf;

clean:
	git clean -Xfd
	if [[ -a "$(OUTPUT_NAME)" ]]; then rm -rv $(OUTPUT_NAME)/; fi;
