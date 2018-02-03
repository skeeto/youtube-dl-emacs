.POSIX:
EMACS = emacs

youtube-dl.elc: youtube-dl.el

clean:
	rm -f youtube-dl.elc

.SUFFIXES: .el .elc
.el.elc:
	$(EMACS) -batch -Q -f batch-byte-compile $<
