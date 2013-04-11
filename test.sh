#!/bin/sh

files=source/*.rst     

echo "======  pep8  ======"
pep8 --show-source --ignore=E225,E111,E231,E701 ${files}

echo "===== spellcheck with ispell =====" 

for f in ${files}; do ispell check $f; done

