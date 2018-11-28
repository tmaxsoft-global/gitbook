#!/bin/bash

basename=`basename $PWD`

if [[ -z "$1" ]]; then
  echo "Missing arguments"
  echo "Usage: "
  echo "  bash ./build {format}"
  echo "Available formats: "
  echo "  docx, pdf, epub, mobi, html"
  exit 1
fi

[ ! -d _build ] && mkdir _build

case ${1} in
  "docx")
    cd _src;

    pandoc --verbose --smart --mathjax --reference-docx=reference.docx --output=../_build/$basename.docx\
        ../README.md \
        ../SUMMARY.md \
        chapter1/chapter1.md \
        chapter2/chapter2.md 
    ;;

  *)
    gitbook ${1} ./ _build/$basename.${1}
    ;;
esac
