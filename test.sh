#!/bin/sh

files=source/*.rst     

echo "======  pep8  ======"
#pep8 --show-errors=E501 --ignore=E225,E111,E231,E701,W604 ${files}
pep8 --select=E501 ${files}

echo "===== spellcheck with ispell =====" 

for f in ${files}; do ispell check $f; done

