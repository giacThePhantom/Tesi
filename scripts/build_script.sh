echo "Building"

PROJECTHOME="$HOME/Documents/Universita/Elaborato_finale/"
NAME="cognome_nome_laurea_aa.tex"

cd $PROJECTHOME
pwd

pdflatex -output-directory=./build $NAME
