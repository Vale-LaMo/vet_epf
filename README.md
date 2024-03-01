# vet_epf
## Ecologia applicata alla Pianificazione Faunistica

Esercitazione 1) primo script in R.   
Argomenti: ripassiamo come si caricano i dati, le misure di tendenza centrale e di dispersione, grafici di base; uso delle funzioni base in dplyr.  
File usati: **OurFirsrRScript.R** (e relativi dataset nella cartella `data`).  
Slide di riferimento (su Moodle): **01_R_intro.pdf**, *What is R? Fundamentals of data exploration and visualization*.   

Esercitazione 2) analisi della matrice di transizione
Argomenti: a partire dalla matrice di transizione, proiettiamo una popolazione di ungulati facendo riferimento al modello di crescita geometrico; analisi di sensitività ed elasticità; simulazione di scenari di gestione variando le transizioni
File usati: **01_exponential_growth.R**
Slide di riferimento (su Moodle): **03_Parametri_demografici_ungulati.pdf**

Esercitazione 3) matrice di transizione densità dipendente
Argomenti: proiezione di una popolazione di ungulati con inserimento della capacità portante; esercitazione su Notebook
File usati: **02_density_dep_dynamics.R**
Slides di riferimento (su Moodle): **04_densita_dipendenza.pdf**, **05_analisi_demografica_applicata.pdf**

Esercitazione 4) t-test e intervalli di confidenza
Argomenti: esempio di analisi applicata a dati di life history della capra delle nevi - esempio di test di ipotesi e confronto degli intervalli di confidenza per valutare la longevità in due gruppi di animali (riprodotti vs. non riprodotti)
File usati: **03_LinearRegression.Rmd**
Slide di riferimento (su Moodle): **06_analisi_statistiche.pdf**

Esercitazione 5) analisi di regressione semplice
Argomenti: esempio di analisi di regressione applicata a dati di life history della capra delle nevi - effetto della densità alla nascita su longevità
File usati: **03_LinearRegression.Rmd**
Slide di riferimento (su Moodle): **06_analisi_statistiche.pdf**

Esercitazione 6) assunti dell'analisi di regressione semplice e regressione multipla
Argomenti: esempio di plot per verificare il rispetto degli assunti e test di shapiro wilk per la normalità; aggiunta di una nuova variabile esplicativa dicotomica e inserimento di un termine di interazione - la longevità della capra delle nevi viene analizzata in dipendenza della densità dell'anno di nascita, in interazione con la riproduzione/non-riproduzione
File usati: **04_SLRassumption.Rmd**, **05_NewVariables.Rmd**
Slide di riferimento (su Moodle): **07_assunti.pdf**

Esercitazione 7) modello poissoniano e model selection sulla base Argomenti: esempio di modello poissoniano che mette in relazione al longevità degli animali con la densità nell'anno della nascita, la qualità degli animali, e l'avvenuta (o meno) riproduzione - si ripetono le strutture dei modelli proposte nella Tabella 1 di Panagakis et al. (2017) e si fa un esempio di model selection sulla base dell'AIC
File usati: **06_PoissonModel.Rmd*
Slide di riferimento (su Moodle): **08_GLM.pdf**

Nuovo dataset:
far fare esercitazione in autonomia su modello binomiale: whether the probability of dying before reproduction was influenced by female quality and density at birth using a GLM with a binomial distribution and a logit link.



metodi per seconda parte del corso:
- distance sampling (modelli DSM)
- CMR
- occupancy models


Approfondimenti su censimenti, indici di abbondanza e stime di densità di popolazioni di animali selvatici, in particolare distinguendo tra il "processo ecologico" e il "processo di osservazione" dei fenomeni naturali.
Definizione di "precisione" e "accuratezza" in ambito statistico.
Cenni sui metodi di campionamento delle specie: distance sampling, cattura marcatura, N-mixture model etc.
Definizione e uso degli "indicatori ecologici" nella gestione della fauna selvatica.


