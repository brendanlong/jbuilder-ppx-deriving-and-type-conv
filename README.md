How do we make `ppx_deriving` and `ppx_type_conv` play well together with
`jbuilder`?

Problem:

 - `ppx_compare` and various other ppx rewriters depend on `ppx_type_conv`
 - Adding ppx_type_conv to pps in jbuilder seems to break ppx_deriving,
   for example, `ppx_deriving.make` and `ppx_deriving_yojson`.

## Running the example:

```
jbuilder build example.o
```

Outputs:

```
$ jbuilder build example.o
         ppx example.pp.ml (exit 1)
(cd _build/default && ./.ppx/ppx_deriving+ppx_compare/ppx.exe --dump-ast --cookie 'library-name="example"' -o example.pp.ml --impl example.ml)
File "example.ml", line 1, characters 28-41:
Error: ppx_type_conv: 'make' is not a supported type type-conv generator
```

But doing the same compile with `ocamlfind` works:

```
ocamlfind ocamldep -package ppx_deriving.make,ppx_compare example.ml
```
