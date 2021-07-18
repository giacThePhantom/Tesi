echo "Building"

PROJECTHOME="$HOME/Documents/Universita/Elaborato_finale/"
NAME="cognome_nome_laurea_aa"

cd $PROJECTHOME
pwd

pdflatex -halt-on-error -output-directory=./build "$NAME.tex"
[ $? == 0 ] || exit 1
bibtex "./build/$NAME.aux"
[ $? == 0 ] || exit 1
pdflatex -output-directory=./build "$NAME.tex" 2>/dev/null >/dev/null
pdflatex -output-directory=./build "$NAME.tex" 2>/dev/null >/dev/null
