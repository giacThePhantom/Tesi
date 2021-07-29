echo "Building"

PROJECTHOME="$HOME/Universita/Elaborato_Finale/"
NAME="fantoni_giacomo_informatica_21"

cd $PROJECTHOME
pwd

pdflatex -halt-on-error -output-directory=./build "$NAME.tex"
[ $? == 0 ] || exit 1
bibtex "./build/$NAME.aux"
[ $? == 0 ] || exit 1
pdflatex -output-directory=./build "$NAME.tex" 2>/dev/null >/dev/null
pdflatex -output-directory=./build "$NAME.tex" 2>/dev/null >/dev/null
