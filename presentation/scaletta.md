

# Titolo
Buongiorno, sono Giacomo Fantoni e la mia tesi verte sull'analisi di dati trascrittomici di RNA-seq da frazioni polisomiale e totale da una linea cellulare epiteliale tumorale.

# 1
In questo progetto si tenta di definire una nuova categoria di SNP detti transSNP.
Gli SNP sono cambi di un singolo nucleotide nel genoma presenti in almeno 1% della popolazione.
I transSNP sono SNP che vanno a modificare il potenziale traduzionale degli mRNA che li contengono.
Sono pertanto localizzati nelle regioni regolatorie non tradotte o 3' e 5' UTR.

# 2
Per individuare i transSNP si devono considerare eventi di espressione allele-specifica.
Si intende per espressione allele specifica un evento per cui un allele del gene viene espresso in maggiore quantita' rispetto all'altro.
I transSNP presenteranno una variazione di espressione allele-specifica tra la frazione polisomiale e quella totale del trascrittoma, ovvero tra la parte presente nel citoplasma e quella che viene attivamente tradotta.

# 3
In quanto si vuole studiare anche la relazione tra i trasnSNP e tumorigenesi e progressione del cancro si e scelto come modello la linea cellulare HCT116, un carcinoma colon rettale umano.
Oltre alla condizione di controllo e' stata analizzata anche in presenza di Nutlin, una piccola molecola che attiva il pathway di p53, un importante proteina soppressore dei tumori nei mammiferi e con il knockdown di DHX30 e PCBP2, proteine coinvolte nei pathway di controllo traduzionale attivati da p53.
Per dare forza statistica allo studio sono state sequenziate le frazioni polisomiale e totale di quattro replicati biologici per condizione.

# 4
I dati di sequenziamento devono ora essere elaborati in modo da poter mettere alla luce gli eventi di espressione allele-specifica.
Il primo passo e' l'allineamento, svolto da due tool, trimmomatic e star.
Il primo si occupa di eliminare le sequenze adattatrici che hanno permesso il sequenziamento, mentre il secondo svolge effettivamente l'allineamento contro un genoma di riferimento.
Questo viene svolto in modo da determinare i loci genici che hanno originato le letture.
L'allineamento produce dei file di allineamento che sono ordinati, indicizzati e compressi dai samtools.

# 5
I dati di allineamento possono essere ulteriormente raffinati in un processo a tre fasi, come stabilito nelle ''best practices'' di gatk.
Il primo passo e' la deduplicazione, che si occupa di rimuovere dai file di allineamento le sequenze duplicate.

# 6
Dopo la deduplicazione avviene il riallineamento, in modo da correggere eventuali errori di star e ottenere dei file di allineamento piu' accurati.

# 7
La recalibrazione corregge i valori di confidence dei dati di allineamento attraverso il machine learning: tipicamente infatti il sequenziatore tende a fare una sovrastima della sua confidenza di aver letto la base corretta in un dato momento.
Si ottengono in questo modo dei file di allineamento da cui possono essere estratti gli eventi di espressione allele-specifica.

# 8
Dopo aver ottenuto i file di allineamento si deve determinare la posizione genica degli SNP che possono originare l'espressione allele-specifica.
Questo avviene analizzando dati WES o whole exome sequencing.
Ci si concentra unicamente sull'esoma in quanto lo studio analizza dati di RNA-seq.
In questo modo si riesce a ridurre il carico computazionale a valle dell'analisi senza perdere alcun dato utile ad essa.
Per ottenere questi dati si intersecano  i file vcf contenenti una lista di SNP con un file gtf contenente la loro posizione nel genoma.

# 9
Avendo ora una lista di SNP e i file di allineamento si possono computare i dati di pileup grazie ad aseq.

# 10
Il pileup output di aseq contiene per ogni SNP indicato nella lista la base canonica e quella alternativa e la conta delle basi lette dai file di allineamento.
La misura di accuratezza del record utilizzata e' il coverage, che indica il numero di volte che nella posizione genomica data e' stata letta o la base canonica o quella alternativa.
Il dato fondamentale ritornato da aseq e' la frazione allelica.
Questa e' il rapporto tra il numero di letture della base alternativa e il numero di letture totali.
Volendo inoltre considerare unicamente gli SNP eterozigoti sono stati posti dei vincoli sul valore di frazione allelica: sono considerati unicamente gli SNP con un valore di essa compreso tra 0.2 e 0.8.
Inoltre per aumentare la correttezza dell'analisi sono stati considerati gli SNP con un valore di coverage maggiore o uguale a 10.
Come aspettato gli SNP sono distribuiti per frazione allelica in una normale centrata in 0.5.
Questo valore infatti indica SNP che sono espressi allo stesso livello.
Le due code della normale invece potrebbero rappresentare SNP in cui sono avvenuti eventi di espressione allele-specifica.
Questo filtro ha ridotto drasticamente il numero di SNP da considerare: si e' passati da circa 40 milioni dati in input ad aseq a circa 13000.
Questa lista e' stata ulteriormente filtrata per SNP in cui sono presenti dati di frazione allelica per almeno 3 dei 4 replicati biologici, arrivando a un totale di 851 SNP.


# 11
Per ognuno di questi e' stato svolto un t-test non corretto per test multipli e considerati come risultato solo quelli con un p-value nominale inferiore a 0.05.
Si sono pertanto ottenuti 161 SNP tra le varie condizioni, 68 dei quali nelle due UTR.

# 12
I 68 SNP considerati nelle due UTR sono stati caratterizzati e la lista dei geni che li contengono confrontata rispetto a una lista di geni noti in letteratura come coinvolti nel cancro.
In questo modo sono stati trovati TBC1D9B e SF3B1 con stato genico normale e in presenza di Nutlin, e KIF5B in assenza di Nutlin ma con knockdown di DHX30.
TBC1D9B e' coinvolto nella regolazione della formazione del trafficking degli autofagosomi.
SF3B1 invede codifica una subunita' del fattore di splicing ed e' associato con sottotipi di sindromi mielodisplaische.
KIF5B infine codifica una proteina motrice dei microtubuli, e' coinvolto nella separazione dei nuclei e dei centrosomi durante la fase G2.

# 13
L'identificazione di questi tre geni e' una buona conclusione per questo progetto.
Sviluppi futuri includono una validazione di questi risultati in laboratorio.
Un possibile modo di validazione potrebbe essere un analisi dei livelli di espressione in vivo attraverso fluorescenza.
Un ulteriore sviluppo include analisi di linkage in modo da determinare l'indipendenza o meno di questi SNP.
