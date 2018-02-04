.POSIX:
EMACS = emacs

youtube-dl.elc: youtube-dl.el

simulate: youtube-dl.elc
	$(EMACS) -Q -L . -l tests/youtube-dl-simulate.el

clean:
	rm -f youtube-dl.elc simulation.db simulation.db.tmp

.SUFFIXES: .el .elc
.el.elc:
	$(EMACS) -batch -Q -f batch-byte-compile $<
