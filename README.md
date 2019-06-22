# Learning

TODO

## Description

## Latex

Use makefile commands to generate the documents `make`. `make clean` to
remove temporary files. `make deep-clean` all the generated documents included
PDF files outputs.

With VSCode, the makefile can be used with the plugin LaTeX Workshop. In the
case the customization is the following:

```json
"latex-workshop.latex.external.build.command": {
    "command": "make",
    "args": ["notes"]
}
```
