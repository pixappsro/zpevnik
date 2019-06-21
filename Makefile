

minivlcice:
	# TODO kompilace not !!!
	cd score;for noty in *.ly ; do \
      lilypond -dbackend=eps $$noty ; \
    done
	xelatex zpevnik_minivlcice.tex
	LC_ALL=cs_CZ.UTF-8 texlua songidx.lua minivlciceidx.sxd minivlciceidx.sbx
	xelatex zpevnik_minivlcice.tex
	pdflatex zpevnik_minivlcice_2x1.tex