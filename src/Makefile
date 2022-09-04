MAKEFLAGS += --silent
SHELL:= /bin/bash#
R=$(shell git rev-parse --show-toplevel)

WEB=$(HOME)/gits/baittery/baittery.github.io

help : Makefile
	echo ""; printf "usage: make [OPTIONS]\n\n"
	@gawk 'BEGIN {FS="[ \t]*:.*##[ \t]*"}  \
	  NF==2 { printf \
           "  \033[36m%-25s\033[0m %s\n","make " $$1,$$2}'  $< \
	| grep -v awk

loc:
	gawk '!/^(--|[ \t]*$$)/{n++} END {print n" lines"}' *.lua

ready:  ##  commit to main
	git add *;git commit -am save;git push;git status

LUAS = $(wildcard [a-z]*.lua)

docs : pdfs htmls ## all docs
pdfs : ../docs/xai.pdf ../docs/lib.pdf ../docs/xaigo.pdf 
htmls: ../docs/xai.html ../docs/lib.html ../docs/xaigo.html

%.md : %.jl  ## make pdf
	echo "\`\`\`julia" > $@
	cat $<  >> $@
	echo "\`\`\`" >> $@

../docs/%.pdf : %.md  ## make pdf
	@mkdir -p $R/docs
	@echo "pdf-ing $@ ... "
	pandoc --pdf-engine=pdflatex \
				 -V mainfont=lmodern   \
		     -V documentclass=extarticle \
				 -V fontsize=8pt  \
		     -V geometry=margin=.5in -o $@ $<
	@open $@
