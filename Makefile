build: ocamlfind jbuilder

jbuilder:
	jbuilder build example.o

ocamlfind:
	ocamlfind ocamldep -package ppx_deriving.make,ppx_compare example.ml

.PHONY: build jbuilder ocamlfind
