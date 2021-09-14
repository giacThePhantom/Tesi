* Motivazioni del progetto, ovvero il fatto che con il NGS ci sia una nuova capacita' di conoscere informazioni a livello della singola base.
* Non e' ancora stato esplorato come gli SNP siano capaci di causare cambi nel traduttoma.
* Definizione di transSNP, come questi possano causare eventi di sbilanciamento allelico nel traduttoma.
* Come identificare i transSNP.
* Linea cellulare e campioni.
* Pipeline di analisi, allineamento, deduplicazione, riallineamento e ricalibrazione, analisi dati WES, aseq.
* Analisi dei risultati, da tutti quelli di aseq come sono stati stretti con cellminer, t-test SNP con p-vale nominale inferiore a 0.05.
* Descrizione dei tre geni.

La mia tesi verte su analisi di dati trascrittomici di RNA-seq da frazioni polisomiale e totale da una linea cellulare epiteliale tumorale.
Questo progetto nasce in quanto con l'avvento del next-generation sequencing sono diventate disponibili una grande mole di informazioni a livello della singola base di genoma e trascrittoma.
Si tenta di esplorare un'area ancora non approfondita, ovvero il ruolo dell'espressione allele-specifica nella tumorigenesi e nella progressione del cancro.
Definizione di espressione allele-specifica.
Si intende per SNP una modifica di un singolo nucleotide nel genoma presente in almeno l'$1\%$ della popolazione.
Si tenta pertanto di individuare tra tutti gli SNP quelli capaci di modificare il potenziale di traduzione del mRNA che li contiene.
Per identificare eventi di cambio di potenziale di traduzione si rende necessario frazionare il trascrittoma che si vuole sequenziare.
Questo viene svolto attrvaerso profilamento polisomiale.
Descrizione profilamento polisomiale.
Volendo in particolare studiare i transSNP nel contesto del cancro i dati di sequenziamento vengono ottenuti dalla lina cellulare HCT116, un carcinoma colon-rettale umano caratterizzato a fondo dall'iniziativa del National Cancer Institute statunitense.
Questa linea cellulare \`e wild-type per p53, il soppressore dei tumori meglio caratterizzato nei mammiferi.
La linea cellulare viene studiata in una condizione di controllo con DMSO ed esposta a Nutlin, una molecola in grado di causare un arresto del ciclo cellulare in HCT116 andando ad inibire l'inibitore di p53 MDM2.
Inoltre oltre alla linea parentale vengono analizzati anche due cloni derivativi in cui \`e stato effettuato il knockdown di DHX30 e PCBP2 rispettivamente.
Nutlin e il knockdown dei due geni causano un cambiamento nel traduttoma nella cellula ma non nel suo trascrittoma e potrebbero essere rilevanti nel contesto dei transSNP andando a modificare loro pattern di espressione.
Infine per ognuna delle 6 condizione vengono sequenziati 4 replicati biologici, ottenendo cos\`i 48 file di sequenziamento utilizzabili come input nella pipeline di analisi.
Il primo passo nell'analisi consiste nell'allineamento dei dati di sequenziamento contro un genoma di riferimento.
Questo passaggio viene svolto dai tool trimmomatic e star.
Il primo si occupa di rimuovere la sequenza adattatrice aggiunta in modo da rendere possibile il sequenziamento, mentre il secondo compie effettivamente l'allineamento control il genoma.
L'output di star viene successivamente compresso, ordinato e indicizzato.
I dati di allineamento sono raffinati seguendo le best practices di gatk in un processo in tre parti.
Il primo e' la deduplicazione, seguita dal riallineamento e la ricalibrazione.
