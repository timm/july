MAKEFLAGS += --silent
SHELL:= /bin/bash#
R=$(shell git rev-parse --show-toplevel)

g1=col/col.jl col/sample.jl
g2=lib/2string.jl lib/2thing.jl lib/lists.jl lib/settings.jl

help : Makefile
	echo ""; printf "usage: make [OPTIONS]\n\n"
	@gawk 'BEGIN {FS="[ \t]*:.*##[ \t]*"}  \
	  NF==2 { printf \
           "  \033[36m%-25s\033[0m %s\n","make " $$1,$$2}'  $< \
	| grep -v awk

define h2
		echo "\\textbf{$(1)}"     >> $(3)
		echo "\`\`\`julia" >> $(3)
		cat $(2)           >> $(3)
		echo "\`\`\`"      >> $(3)
endef

docs:
	echo "---"                             >   _july.md
	echo "title: JULY"                     >>  _july.md
	echo "author: [$(USER)]"               >>  _july.md
	echo "date: '$(shell date +%m/%d/%y)'" >>  _july.md
	echo "fontsize: 5pt"                   >>  _july.md
	echo "keywords: [Markdown, Example]"   >>  _july.md
	echo "..."                             >>  _july.md
	echo ""                                >>  _july.md
	echo ""                                >>  _july.md
	$(call h2, july.jl, july.jl, _july.md)
	$(foreach f, $(g1), $(call h2, $f, $f, _july.md) ; )
	$(foreach f, $(g2), $(call h2, $f, $f, _july.md) ; )
	@$(MAKE) ../docs/_july.pdf

ready:  ##  commit to main
	git add *;git commit -am save;git push;git status

%.md : %.jl  ## make pdf
	echo "---"                             >  $@
	echo "title: '$<'"                     >> $@
	echo "author: [$(USER)]"               >> $@
	echo "date: '$(shell date +%m/%d/%y)'" >> $@
	echo "fontsize: 5pt"                   >> $@
	echo "paper: usletter"                 >> $@
	echo "keywords: [Markdown, Example]"   >> $@
	echo "..."                             >> $@
	echo ""                                >> $@
	echo ""                                >> $@
	echo "\`\`\`julia"                     >> $@
	cat $<                                 >> $@
	echo "\`\`\`"                          >> $@

../docs/%.pdf : %.md  ## make pdf
	@mkdir -p $R/docs
	@echo "pdf-ing $@ ... "
	pandoc "$<"  -o "$@" --from markdown --template "../etc/eis.tex" --listings

	@open $@
