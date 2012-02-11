	\thispagestyle{empty}
\changepage{}{}{}{-1.5cm}{}{2cm}{}{}{}
![Il Piccolo Libro su MongoDB, di Karl Seguin](title.png)\ 

\clearpage
\changepage{}{}{}{1.5cm}{}{-2cm}{}{}{}

## Note sul Libro ##

### Licenza ###
I contenuti del Piccolo Libro su MongoDB sono protetti da licenza Attribuzione - Non Commerciale 3.0. **Non dovresti aver pagato per questo libro**

Sei libero di copiare, distribuire, modificare o mostrare il libro. Tuttavia ti chiedo di attribuire sempre l'opera all'autore, Karl Seguin, e di non usarla per scopi commerciali.

Puoi consultare il testo integrale della licenza a questo indirizzo:

<http://creativecommons.org/licenses/by-nc/3.0/legalcode>

### Informazioni sull'Autore ###
Karl Seguin è uno sviluppatore competente in diversi campi e tecnologie. E' esperto programmatore .NET e Ruby. Collabora saltuariamente a progetti OSS, è uno scrittore tecnico e occasionalmente uno speaker. Per quanto riguarda MongoDB, è stato tra i principali autori della libreria C# per MongoDB NoRM, ha scritto il tutorial interattivo [moongly](http://mongly.com) nonché [Mongo Web Admin](https://github.com/karlseguin/Mongo-Web-Admin). Il suo servizio per sviluppatori di casual game, [mogade](http://mogade.com/) gira sotto MongoDB.

Il suo blog si trova su <http://openmymind.net>, e twitta come [@karlseguin](http://twitter.com/karlseguin)

### Ringraziamenti ###
Un grazie speciale a [Perry Neal](http://twitter.com/perryneal) per avermi prestato occhi, mente e passione. Mi hai dato un aiuto prezioso. Grazie.

### Ultima Versione ###
L'ultima versione del sorgente di questo libro è disponibile qui:

<http://github.com/karlseguin/the-little-mongodb-book>.

### Traduzione italiana ###
La traduzione italiana di questo libro è curata da [Nicola Iarocci](http://nicolaiarocci.com).

\clearpage

## Introduzione ##
 > Non è colpa mia se i capitolo sono brevi, MongoDB è davvero semplice da imparare.

Si dice spesso che la tecnologia avanza a velocità impressionante. E' vero che la lista delle nuove tecnologie e tecniche è in continua crescita. Tuttavia da tempo sono convinto che le tecnologie fondamentali per i programmatori evolvano a un ritmo più lento. Una persona potrebbe trascorrere anni senza imparare granché restando competente. Impressiona piuttosto la velocità con cui tecnologie consolidate vengono sostituite da altre. Da un giorno all'altro tecnologie ormai affermate si ritrovano minacciate da un repentino spostamento dell'attenzione del programmatore.

Il fenomeno è evidente nel progresso che le tecnologie NoSQL stanno compiendo rispetto ai ben consolidati database relazionali. Fino a ieri il web era guidato da pochi RDBMS e oggi quattro o cinque soluzioni NoSQL si sono affermate come alternative attendibili.

Anche se sembra che queste transizioni avvengano nel corso di una notte la realta è che possono passare anni prima che una nuova tecnologia diventi una pratica accettata. L'entusiasmo iniziale è guidato da un gruppo relativamente piccolo di sviluppatori e aziende. I prodotti migliorano con l'esperienza e, quando ci si rende conto che una tecnologia è destinata a persistere, altri cominciano a sperimentarla. Ciò è particolarmente vero nel caso del NoSQL poiché spesso queste soluzioni non sono progettate come alternative a modelli di storage più tradizionali, ma intendono far fronte a nuove necessità.

Detto questo, prima di tutto dobbamo capirci su cosa si intenda per NoSQL. E' un termine vago, che ha significati diversi a seconda di chi lo usa. Personalmente intendo in senso molto ampio per indicare un sistema che ha un ruolo nel salvataggio dei dati. In altre parole per me NoSQL è la convinzione che lo strato di persistenza non è necessariamente responsabilità di un solo sistema. Laddove storicamente i fornitori di database relazionali hanno sempre tentanto di posizionare i loro software come soluzione universale per qualunque problema, NoSQL tende a individuare piccole unità di responsabilità per ognuna delle quali scegliere lo strumento ideale. Quindi uno stack NoSQL potrebbe contemplare un database relazionare, MySQL per esempio, Redis per i lookup veloci e Hadoop per le elaborazioni intensive dei dati. In parole povere NoSQL è essere aperti e coscienti dell'esistenza di pattern e strumenti alternativi per la gestione dei dati. 

Vi potreste domandare qual'è il ruolo di MongoDB in tutto questo. In quanto database orientato ai documenti Mongo è una soluzione NoSQL piuttosto generalizzata, e dovrebbe essere visto come alternativa ai database relazionali. Come i database relazionali anche Mongo potrebbe trarre beneficio dall'abbinamento a soluzioni NoSQL più specializzate. MongoDB ha vantaggi e svantaggi che vedremo nei successivi capitoli di questo libro.

Come avrai notato in questo libro usiamo indifferentemente i termini MongoDB e Mongo.

## Come Iniziare ##
Gran parte di questo libro è dedicata alla funzionalità di base di MongoDB. Per questo motivo ci affideremo alla shell di MongoDB. La shell è utile sia per imparare che come strumento di amministrazione, tuttavia è il tuo codice userà uno dei tanti driver MongoDB.

Una delle prime cose che devi conoscere su MongoDB sono i suoi drivers. Mongo ha una certa dotazione di [driver ufficiali](http://www.mongodb.org/display/DOCS/Drivers), adatti ai diversi linguaggi di programmazione. Puoi considerare questi driver simili ai driver per database che probabilmente hai già usato in passato. La community di sviluppatori ha poi costruito, sulla base di questi driver, una serie di framework e librerie dedicate ai vari linguaggi. Per esempio [NoRM](https://github.com/atheken/NoRM) è una libreria C# che implementa LINQU, mentre [MongoMapper](https://github.com/jnunemaker/mongomapper) è una libreria Ruby compatibile con ActiveRecord. La scelta di programmare coi driver di base oppure con una delle libreria di più alto livello è libera. Ne parlo solo perché molte persone che si avvicinano a MongoDB rimangono confuse dall'esistenza dei driver ufficiali e delle librerie della communit - in linea generale i primi si occupano di comunicazione e connettività di base con MongoDB, mentre le seconde implementano caratteristiche specifiche dei linguaggi/framework.

Durante la lettura del libro ti invito a giocare con MongoDB, mettendo in pratica quel che propongo ed anche sperimentando per conto tuo, rispondendo alle domande che senz'altro ti farai. E' facile cominciare a lavorare con MongoDB, quindi diamoci subito da fare e cominciamo configurando quel che ci serve.

1. Vai alla [pagina di download ufficiale](http://www.mongodb.org/downloads) è scarica i file binari per il tuo sistema operativo (scegli la versione stabile raccomandata). Ai fini dello sviluppo puoi prelevare indifferentemente la versione a 32-bit o 64-bit.

2. Scompatta l'archvio (non importa la posizione) quindi vai alla cartella `bin`. Non eseguire nulla, ma sappi che `mongod` è il processo server mentre `mongo` è la shell (il client) - questi sono i due eseguibili coi quali passeremo gran parte del nostro tempo.

3. Crea un nuovo file di testo nella cartella `bin` e chiamalo `mongodb.config`.

4. Aggiungi questa riga al tuo mongodb.config: dbpath=PERCORSO_DOVE_VUOI_SALVARE_IL_TUO_DATABASE`. Ad esempio, su Windows potresti scegliere `dbpath=c:\mongodb\data` mentre su Linux una scelta valida potrebbe essere `dbpath=/etc/mongodb/data`.

5. Assicurati che il `dbpath` che hai indicato esista.

6. Lancia mongod con l'opzione `--config /path/to/your/mongodb.config`.

Ad esempio un utente Windows potrebbe estrarre il file scaricato in `c:\mongodb\` e creare la cartella `c:\mongodb\data\`. In questo caso all'interno di `c:\mongodb\bin\mongodb.config` dovrà specificare `dbpath=c:\mongodb\data\`. A questo punto può lanciare `mongod` dalla linea di comando con `c:\mongodb\bin\mongod --config c:\mongodb\bin\mongodb.config`.

Naturalmente puoi aggiungere la cartella `bin` al tuo PATH per rendere tutto più facile. Tutto questo è valido anche per gli utenti MacOSX e Linux, che probabilmente dovranno adattare i percorsi.

A questo punto dovresti trovari con MongoDB pronto e operativo. Se invece ottieni un messaggio di errore, leggi con attenzione l'output - il server è piuttosto bravo a spiegare cos'è andato storto.

Puoi lanciare `mongo` (senza la *d*) che connetterà la shell al tuo server in esecuzione. Prova a digitare `db.version()` per assicurarti che tutto sta funzionando come si deve. Dovresti vedere il numero della versione che hai installato.

\clearpage

## Capitolo 1 - Le Basi ##
Cominciamo il nostro viaggio imparando i meccanismi base di MongoDB. Ovviamente sono fondamentali per capire MongoDB, ma a un livello più generale ci aiuterannoa rispondere alle nostre domande sul ruolo stesso di MongoDB.

Per cominciare, ci sono sei semplici concetti che dobbiamo comprendere.

1. MongoDB implementa lo stesso concetto di 'database' al quale probabilmente siete abituati (o schema, se venite dal mondo Oracle). All'interno di una istanza MongoDB potete avere zero o più database, ognuno dei quali agisce come un contenitore di alto livello per tutto il resto.

2. Un database può avere zero o più 'collezioni'. Una collezione ha molto in comune con le 'tabelle' tradizionali, tanto che potete considerarle la stessa cosa.

3. Le collezioni sono composte da zero o più 'documenti'. Di nuovo, potete pensare a un documento come a una 'riga' (record) di una tabella.

4. Un documento è a sua volta composto da uno o più 'campi', che come potete immaginare assomigliano alle 'colonne'.

5. Gli 'indici' in MongoDB funzionano in modo molto simile alle loro controparti RDBMS.

6. I 'cursori', a cui spesso viene data poca importanza, sono qualcosa di diverso dagli altri cinque concetti, e li ritengo abbastanza importanti da meritare attenzione. E' importante sapere che quando si chiedono dati a MongoDB questi restituisce un cursore col quale possiamo, per esempio, contare i documenti o spostarci avanti, senza che alcun dato venga effettivamente letto.

Riassumendo, MongoDB è fatto di 


Riassumendo, MongoDB è fatto di `database` che contengono `collezioni`. Una `collezione` è una raccolta di `documenti`. Ogni `documento` è composto da `campi`. Le `collezioni` possono essere `indicizzate`, il che migliora le prestazioni delle ricerche e degli ordinamenti. Infine, quando chiediamo dati a MongoDB otteniamo un `cursore` la cui esecuzione è rinviata finché non si rende necessaria.

Vi potreste domandare per quale ragione adottiamo una nuova terminologia (collezione invece di tabella, documento al posto di riga e campo piuttosto che colonna). Vogliamo solo complicare le cose? La verità è che questi nuovi concetti non sono identici alle loro controparti nei database relazionali. La differenza più importante è che i database relazionali definiscono le `colonne` a livello `tabella` mentre i database orientati ai documenti definiscono i `campi` a livello di `documento`. Ciò significa che ogni `documento` di una `collezione` può avere il suo set esclusivo di `campi`. Ne consegue che una `collezione` è un contenitore più semplice di una `tabella`, laddove un `documento` ha molte più informazioni di una `riga`.

Si tratta di una cosa importante da capire, ma non c'è da preoccuparsi se il concetto non è ancora chiaro. Basteranno un paio di inserimenti per capire il vero significato di tutto questo. In definitiva una collezione non vincola il suo contenuto (è senza schema, o schema-less). I campi vengono tracciati in ogni singolo documento. Esploreremo vantaggi e svantaggi di tutto questo in uno dei prossimi capitoli.

Cominciamo a darci da fare. Se ancora non l'avete fatto eseguite pure il server `mongod` e la mongo shell. La shell esegue codice JavaScript. Ci sono alcuni comandi globali che potete lanciare, come `help` o `exit`. I comandi lanciati nei confronti del database attivo si eseguono nei confronti dell'oggetto `db`, come ad esempio `db.help()` o `db.stats()`. I comandi lanciati nei confronti una collezione specifica, cosa che avviene spesso, vanno eseguiti nei confronti dell'oggetto `db.NOME_COLLEZIONE`, come per esempio `db.unicorns.help()` oppure `db.unicorns.count()`.

Provate a digitare `db.help()`. Otterrete una lista dei comandi che è possibile eseguire nei confornti dell'oggetto `db`.

Piccola nota a margine. Poiché questa è una shell JavaScript, se eseguite un metodo e omettete le parentesi `()`, vedrete il contenuto del metodo piuttosto che ottenerne l'esecuzione. Ve lo ricordo affinché la prima volta che vi capiterà di farlo e di vedere una risposta che comincia con `function (...){` non rimaniate sorpresi. Per esempio se inserite `db.help` (senza le parentesi) quello che otterrete è la visualizzazione dell'implementazione interna del metodo `help`.

Prima di tutto useremo il metodo globale `use` per cambiare il database attivo. Digitate `use learn`. Non importa che il database non esista ancora. Quando creeremo la prima collezione, allora verrà creato anche il database `learn`. Ora che abbiamo un database attivo possiamo eseguire comandi sul database stesso, come per esempio `db.getCollectionNames()`. Se lo fate dovreste ottenere un array vuoto (`[ ]`). Poiché le collezioni sono schema-less non c'è necessità di crearle esplicitamente. Possiamo semplicemente inserire un documento nella nuova collezione. Per farlo usiamo il comando `insert`, passandogli direttamente il documento da inserire:

	db.unicorns.insert({name: 'Aurora', gender: 'f', weight: 450})

La riga esegue il comando `insert` nei confronti della collezione `unicorns`, passandogli un singolo argomento. Per la serializzazione MongoDB usa internamente il formato JSON binario. Esternamente ciò significa che useremo parecchio JSON, come nel caso dei nostri parametri. Se ora eseguiamo `db.getCollectionNames()` otteniamo due collezioni: `unicorns` e `system.indexes`. `system.indexes` viene creata una volta per database, e contiene informazioni sugli indici del database.

Ora possiamo usare il comando `find` sulla collezione `unicorns` per ottenere una lista di documenti:

	db.unicorns.find()

Notate che in aggiunta ai dati che avete specificato c'è un campo `_id`. Ogni documento deve avere un campo `_id` univoco. Potete generarlo da voi oppure lasciare che sia MongoDB a generare un ObjectId per voi. Probabilmente la maggior parte delle volte sarà sufficiente lasciarlo generare a MongoDB. Per impostazione predefinita il campo `_id` è indicizzato - il che spiega l'esistenza della collezione `system.indexes`. E' possibile consultare l'elenco degli indici:

	db.system.indexes.find()

Ciò che otteniamo è il nome dell'indice, il database e la collezione nel quale è stato creato e l'elenco dei campi inclusi nell'indice.

Torniamo alla nostra discussione sulle collezioni schema-less. Inseriamo un documento completamente diverso nella collezione `unicorns`:

	db.unicorns.insert({name: 'Leto', gender: 'm', home: 'Arrakeen', worm: false})

Usiamo di nuovo `find` per vedere la lista dei documenti. Quando sapremo qualcosa in più discuteremo questo interessante comportamento di MongoDB, ma a questo punto dovreste cominciare a comprendere perché la terminologia tradizionale non è più adeguata.

### Padroneggiare i Selettori ###
Oltre ai sei concetti già visti c'è un aspetto pratico di MongoDB che è necessario comprendere a fondo prima di poter continuare con argomenti più avanzati: i selettori di query (query selectors). Un selettore di query in MongoDB assomiglia alla clausola `where` di un comando SQL. In quanto tale viene usato per trovare, contare, aggiornare e rimuovere documenti dalle collezioni. Un selettore è un oggetto JSON la cui forma più semplice è `{}` che rintraccia tutti i documenti (`null` è altrettando valido). Se volessimo trovare tutti gli unicorni femmina potremmo usare `{gender:'f'}`.

Prima di addentrarci a fondo nei selettori prepariamo un po' di dati con cui giocare. Prima di tutto cancellerriamo ciò che abbiamo inserito finora nella collezione `unicorns`: `db.unicorns.remove()` (poiché non stiamo fornendo un selettore, rimuoveremo tutti i documenti). Ora digitiamo i comandi di inserimento seguenti, così da ottenere un po' di dati con cui lavorare (suggerisco di copiare e incollare da qui):

	db.unicorns.insert({name: 'Horny', dob: new Date(1992,2,13,7,47), loves: ['carrot','papaya'], weight: 600, gender: 'm', vampires: 63});
	db.unicorns.insert({name: 'Aurora', dob: new Date(1991, 0, 24, 13, 0), loves: ['carrot', 'grape'], weight: 450, gender: 'f', vampires: 43});
	db.unicorns.insert({name: 'Unicrom', dob: new Date(1973, 1, 9, 22, 10), loves: ['energon', 'redbull'], weight: 984, gender: 'm', vampires: 182});
	db.unicorns.insert({name: 'Roooooodles', dob: new Date(1979, 7, 18, 18, 44), loves: ['apple'], weight: 575, gender: 'm', vampires: 99});
	db.unicorns.insert({name: 'Solnara', dob: new Date(1985, 6, 4, 2, 1), loves:['apple', 'carrot', 'chocolate'], weight:550, gender:'f', vampires:80});
	db.unicorns.insert({name:'Ayna', dob: new Date(1998, 2, 7, 8, 30), loves: ['strawberry', 'lemon'], weight: 733, gender: 'f', vampires: 40});
	db.unicorns.insert({name:'Kenny', dob: new Date(1997, 6, 1, 10, 42), loves: ['grape', 'lemon'], weight: 690,  gender: 'm', vampires: 39});
	db.unicorns.insert({name: 'Raleigh', dob: new Date(2005, 4, 3, 0, 57), loves: ['apple', 'sugar'], weight: 421, gender: 'm', vampires: 2});
	db.unicorns.insert({name: 'Leia', dob: new Date(2001, 9, 8, 14, 53), loves: ['apple', 'watermelon'], weight: 601, gender: 'f', vampires: 33});
	db.unicorns.insert({name: 'Pilot', dob: new Date(1997, 2, 1, 5, 3), loves: ['apple', 'watermelon'], weight: 650, gender: 'm', vampires: 54});
	db.unicorns.insert({name: 'Nimue', dob: new Date(1999, 11, 20, 16, 15), loves: ['grape', 'carrot'], weight: 540, gender: 'f'});
	db.unicorns.insert({name: 'Dunx', dob: new Date(1976, 6, 18, 18, 18), loves: ['grape', 'watermelon'], weight: 704, gender: 'm', vampires: 165});

Ora che abbiamo i dati possiamo fare pratica coi selettori. Usiamo `{campo: valore}` per trovare documenti il cui `campo` sia uguale a `valore`. Usiamo `{field1: value1, field2: value2}` per indicare l'operatore `and`. Usiamo `$lt`, `$lte`, `$gt`, `$gte` e `$ne` come operatori minore di (less than), minore o uguale (less than or equale), maggiore di (greater than), maggiore o uguale (greater then or equal) e diverso da (not equal). Per esempio, per ottenere tutti gli unicorni maschi che pesano più di 700 libbre possamo usare:

	db.unicorns.find({gender: 'm', weight: {$gt: 700}})
	//oppure (non è la scelta migliore, ma vale come esempio)
	db.unicorns.find({gender: {$ne: 'f'}, weight: {$gte: 701}})

L'operatore `$exists` è usato per verificare la presenza o l'assenza di un campo, per esempio:

	db.unicorns.find({vampires: {$exists: false}})

Dovrebbe restituire un singolo documento. Se vogliamo un OR invece di un AND usiamo l'operatore `$or` assegnandoli un array di valori sui quali vogliamo compiere l'OR:

	db.unicorns.find({gender: 'f', $or: [{loves: 'apple'}, {loves: 'orange'}, {weight: {$lt: 500}}]})

Questa istruzione restituisce tutti gli unicorni femmina che amano le mele (apple), le arance (orange) oppure che pesano (weight) meno di 500 librre.

Nell'ultimo esempio succede qualcosa di interessante. Forse avrete notato che il campo `loves` è un array. MongoDB supporta gli array come oggetti di prima classe. Questa è una caratteristica incredibilmente utile. Una volta cominciato ad usarla ti domanderai come hai potuto vivere senza finora. Ciò che è ancor più interessante è quanto sia facile fare selezioni basate su un valore array: `{loves: 'watermelon'}` restituisce qualunque documento che abbia campi 'loves' valorizzati a 'watermelon'.

Sono disponibili più operatori di quelli che abbiamo visto finora. Il più flessibile è `$where`, il quale ci permette di passare codice JavaScript da eseguire sul server. Questi operatori sono discussi nella sezione [Advanced Queries](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries) del sito di MongoDB. Quel che abbiamo visto finora è sufficiente per cominciare con MongoDB, ed è anche ciò che userete per la maggior parte del tempo.

Abbiamo visto come i selettori possano essere usati col comando `find`. Possono essere adoperati anche con `remove`, già incontrato brevemente, `count`, che ancora non abbiamo ancora ma che potete intuire da soli, e col comando `update` a cui ci dedicheremo in seguito.

Il `ObjectId` che MongoDB ha generato per il nostro campo `_id` puà a sua volta essere selezionato:

	db.unicorns.find({_id: ObjectId("TheObjectId")})

### Riepilogo ###
Non abbiamo ancora studiato il comando `update` né abbiamo visto le cose più interessanti che possiamo ottenere con `find`. Tuttavia abbiamo fatto partire MongoDB, abbiamo dato una occhiata ai comandi `inset` e `remove` (su questi non c'è molto altro da aggiungere). Abbiamo introdotto `find` e scoperto che cosa sono i 'selectors' (selettori) in MongoDB. Siamo partiti col piede giusto impostando le basi per quel che deve ancora venire. Che ci crediate o no, a questo punto conoscete la maggior parte di quel che serve sapere per usare MongoDB - è davvero progettato per essere facile e veloce da imparare e usare. Vi invito caldamente a giocare con la vostra copia locale prima di proseguire. Inserite documenti diversi, possibilmente in nuove collezioni, e prendete confidenza con i vari selettori. Usate `find`, `find` e `remove`. Dopo pochi tentativi ciò che ora può sembrare poco chiaro finira probabilmente per avere senso.

\clearpage

## Capitolo 2 - Gli Aggiornamenti ##
Nel primo capitolo abbiamo introdotto tre delle quattro operazioni CRUD (create, read, update, delete). Questo capitolo è dedicato all'operazione di cui non abbiamo ancora parlato: `update`. Quest'ultima riserva qualche sorpresa, e per questo motivo gli dedichiamo un capitolo.

### Update: Replace Versus $set ###
Nella sua forma più semplice `update` richiede due argomenti: il selettore da usare (where) e il valore del campo da aggiornare. Se Roooooodles avesse guadagnato qualche chilo, potremmo usare:

	db.unicorns.update({name: 'Roooooodles'}, {weight: 590})

(se nel frattempo avete cambiato la collezione `unicorns` e i dati originali sono compromessi, procedete con un `remove` di tutti i documenti e re-inserite i dati col codice visto nel capitolo 1).

Se questo fosse codice reale aggiorneremmo i dati in base al campo `_id`, ma poiché non possiamo sapere a priori quale `_id` verrà generato da MongoDB, continueremo a usare `names`. Ora, se andiamo a cercare il record che abbiamo aggiornato:

	db.unicorns.find({name: 'Roooooodles'})

Abbiamo la prima sopresa che `update` ci riserva. Non viene trovato alcun documento perchè il secondo parametro che forniamo viene usato per **sostituire** l'originale. In altre parole la nostra `update` ha cercato il documento per `name`, quindi ha sostituito l'intero documento con il nuovo documento (il secondo parametro). Questo è molto diverso da come funziona il comando `update` nel mondo SQL. In alcune situazioni questo è molto comodo, e può essere sfruttato per ottnere aggiornamenti molto dinamici. Tuttavia, quando tutto quel che vogliamo fare è cambiare il valore di uno o più campi, è meglio usare il modificatore `$set` di MongoDB:

	db.unicorns.update({weight: 590}, {$set: {name: 'Roooooodles', dob: new Date(1979, 7, 18, 18, 44), loves: ['apple'], gender: 'm', vampires: 99}})

Questo ripristinerà i campi perduti. Non sovrascriverà il nuovo `weight` dato che non l'abbiamo specificato. Ora se eseguiamo:

	db.unicorns.find({name: 'Roooooodles'})

Otteniamo il risultato che volevamo. Quindi, il modo corretto di aggiornare il peso sarebbe stato:

	db.unicorns.update({name: 'Roooooodles'}, {$set: {weight: 590}})

### Modificatori di Aggiornamento ###
Oltre a `$set` possiamo azionare altri modificatori che ci consentono di fare cose eleganti. Tutti questi modificatori di aggiornamento operano sui campi - non azzerano l'intero documento. Per esempio il modificatore `$inc` viene usato per aumentare il valore di un campo di un certo valore, positivo o negativo. Supponiamo che a Pilot siano stati assegnate per errore un paio di uccisioni di vampiri; potremmo correggere l'errore eseguendo:

	db.unicorns.update({name: 'Pilot'}, {$inc: {vampires: -2}})

Se Aurora sviluppasse improvvisamente un'amore per i dolci, potremmo aggiungere un valore al suo array di `loves` usando il modificatore `$push`:

	db.unicorns.update({name: 'Aurora'}, {$push: {loves: 'sugar'}})

La sezione [Updating](http://www.mongodb.org/display/DOCS/Updating) del sito di MongoDB ha informazioni sugli altri modificatori di aggiornamento disponibili.

### Upserts ###
Una delle sorprese più piacevoli che il nostro `update` ci riserva è il supporto per gli `upsert`. Se trova il documento cercato, `upsert` lo aggiorna, altrimenti lo crea. Gli upsert sono comodi in diverse situazioni, ve ne renderete conto non appena vi ci imbatterete. Per attivare gli upsert impostiamo un terzo parametro a `true` (vero).

Un esempio banale è quello di contantore di visite ad un sito web. Se volessimo gestire un contatore in tempo reale dovremmo verificare l'esistenza del record per la pagina attuale, quindi decidere per l'inserimento o l'aggiornamento. Omettendo il terzo parametro (o mettendolo a false), l'esecuzione del comando seguente non ottiene alcun risultato:

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}});
	db.hits.find();

Tuttavia, se attiviamo gli upsert, il risultato cambia:

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}}, true);
	db.hits.find();

Poiché non esistono documenti col campo `page` equivalente a `unicorns`, viene inserito un nuovo documento. Se eseguiamo lo stesso comando una seconda volta, il documento esistente viene aggiornato, e il suo campo `hits` aumentato a due.

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}}, true);
	db.hits.find();

### Aggiornamenti Multipli ###
L'ultima sorpresa che `update` ci riserva è il fatto che, per default, aggiorna un singolo documento. Per gli esempi che abbiamo visto finora, questo comportamente potrebbe sembrare logico. Tuttavia, se eseguiste qualcosa di questo genere:

	db.unicorns.update({}, {$set: {vaccinated: true }});
	db.unicorns.find({vaccinated: true});


Probabilmente vi aspettereste di trovare tutti i vostri preziosi unicorni vaccinati. Per ottenere il comportamento desiderato è necessario mettere a true un quarto parametro:
 
	db.unicorns.update({}, {$set: {vaccinated: true }}, false, true);
	db.unicorns.find({vaccinated: true});

### Riepilogo ###
Questo capitolo conclude la nostra introduzone alle operazioni CRUD che è possibile eseguire su una collezione. Abbiamo visto in dettaglio il comando `update`, scoprendo tre comportamenti interessanti. Primo, a differenza di una update SQL, la `update` in MongoDB sostituisce un documento. Per questo motivo il modificatore `$set` è piuttosto utile. Secondo, `update` supporta l`upsert` (aggiornamento o inserimento) in maniera piuttosto intuitiva, ciò che lo rende particolarmente utile quando abbinato al modificatore `$inc`. Infine, per default `update` aggiorna solo il primo documento trovato.

Tenete sempre presente che stiamo usando MongoDB dal punto di vista della sua shell. Il driver e la libreria adottata potrebbero alterare questi comportamenti predefiniti, o esporre una API differente. Il driver Ruby, per esempio, unisce gli ultimi due parametri in una singola hash: `{:upsert => false, :multi => false}`.

\clearpage

## Capitolo 3 - Padroneggiare il metodo Find ##
Nel capitolo 1 abbiamo dato una occhiata superficiale al comando `find`. Su `find` c'è altro da sapere, la comprensione dei `selettori` non è sufficiente. Abbiamo già detto che `find` restituisce un `cursore`. E' giunta tempo di andare a fondo e vedere cosa possiamo fare esattamente.

### Selettori di Campo ###
Prima di passare ai `cursori` è necessario sapere che `find` accetta un secondo parametro opzionale. Si tratta dell'elenco dei campi che vogliamo recuperare. Per esempio, possiamo chiedere i nomi di tutti gli unicorni con questo comando:

	db.unicorns.find(null, {name: 1});

Per default il campo `_id` viene restituito sempre. Possiamo escluderlo in modo esplicito con `{name:1, _id: 0}`.

Ad eccezione del campo `_id` non è possibile mescolare inclusioni ed esclusioni. A ben vedere ciò ha senso, di solito vogliamo escludere oppure includere uno o più campi esplicitamente.

### Ordinamenti ###
Abbiamo ripetuto più volte che `find` restituisce un cursore la cui esecuzione è ritardata finché non si rende davvero necessaria. Tuttavia avrete senz'altro notato che nella shell `find` viene eseguito immediatamente. Questo è un comportamento esclusivo della shell. Possiamo osservare il vero comportamento dei `cursori` quando usiamo uno dei metodi che è possibile concatenare a `find`. Il primo che prendiamo in esame è `sort`. `sort` funziona in maniera simile al selettore di campo che abbiamo visto nella sezione precedente. Elenchiamo i campi da ordinare, usando 1 per ottenere un ordinamento crescente e -1 per uno discendente. Per esempio:

	//gli unicorni più pesanti per primi:
	db.unicorns.find().sort({weight: -1})
	
	//per nome, quindi per il numero di vampiri uccisi:
	db.unicorns.find().sort({name: 1, vampires: -1})

Come succede nel caso dei database relazionali, per compiere l'ordinamento MongoDB è in grado di usare un indice. Approfondiremo gli indici più avanti, tuttavia è utile sapere che in assenza di un indice MongoDB limita la dimensione dell'ordinamento. Ciò significa che il tentativo di ordinamento di un set molto grande, sprovvisto di indice, genererà un errore. Alcuni ritengono che questa sia una limitazione. In realtà vorrei davvero che più database fossero capaci di rifiutare le query non ottimizzate (non ho intenzione di trasformare ogni svantaggio di MongoDB in un suo vantaggio, ma ho visto fin troppi database scarsamente ottimizzati per non sapere che un controllo più stretto sarebbe quanto mai necessario).

### Paginazione ###
La paginazione dei risultati può essere ottenuta con i metodi cursore `limit` e `skip`. Per ottenere solo il secondo e il terzo unicorno più pesante potremmo digitare:

	db.unicorns.find().sort({weight: -1}).limit(2).skip(1)

Usare `limit` in combinazione con `sort` è un buon sistema per non incappare in problemi quando si fanno ordinamenti su campi non indicizzati.

### Conteggi ###
La shell consente l'esecuzione di `count` direttamente sulla collezione:

	db.unicorns.count({vampires: {$gt: 50}})

In realtà `count` è a sua volta un metodo `cursore`, la shell in questo caso implementa una scorciatoia. Per i driver che non implementano questa scorciatoia dovremo usare la sintassi completa (che funziona anche nella shell):

	db.unicorns.find({vampires: {$gt: 50}}).count()

### Riepilogo ###
Usare `find` e i `cursori` è piuttosto lineare. Ci sono alcuni comandi aggiuntivi che vedremo nei capitoli successivi, o che servono solo in casi rari ma, giunti a questo punto, dovreste cominciare a sentirvi a vostro agio sia con la shell di Mongo che nella comprensione dei fondamenti di MongoDB.

\clearpage

## Capitolo 4 - Modellazione dei Dati ##
Cambiamo marcia e passiamo a un argomento MongoDB più astratto. Spiegare qualche nuovo termine e nuove sintassi è tutto sommato un compito banale; parlare della modellazione dei dati applicata a un nuovo paradigma non è tutt'altra cosa. In realtà in fatto di modellazione con queste nuove tecnologie la maggior parte di noi è tutt'ora impegnata a scoprire cosa funziona e cosa no. Possiamo discuterne, ma in ultima analisi dovrete far pratica e imparare lavorando sul vero codice.

In confronto alla gran parte delle soluzioni NoSQL i database orientati ai documenti sono probabilmente i meno differenti rispetto ai database relazionali. Le differenze sono sottili ma questo non significa che non siano importanti.

### Niente Join ###
La prima e fondamentale differenza alla quale dovrete abituarvi è l'assenza, in MongoDB, delle join. Non conosco la ragione precisa per cui almeno qualche tipo di join non sia supportato in MongoDB, ma so che in generale le join sono considerate non scalabili. Una volta cominciata la suddivisione dei dati finiamo prima o poi per eseguire le join sul client (l'application server). Al di là delle spiegazioni, rimane il fatto che i dati *sono* relazionali, e che MongoDB non supporta le join.

Con quel che sappiamo finora, per sopravvirere in un mondo senza join siamo costretti ad eseguirle attraverso il codice della nostra applicazione. In pratica dobbiamo lanciare una seconda query per trovare (`find`) i dati pertinenti alla nostra ricerca. Impostare i nostri dati non è diverso dal dichiarare una chiave esterna in un database relazionale. Spostiamo la nostra attenzione dai mercavigliosi unicorni (`unicorns`) agli impiegati (`employees`). La prima cosa che facciamo è creare un impiegato (fornirò un `_id` esplicito per poter costruire esempi coerenti)


	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d730"), name: 'Leto'})

Ora aggiungiamo un paio di impiegati e impostiamo `Leto` come loro manager:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d731"), name: 'Duncan', manager: ObjectId("4d85c7039ab0fd70a117d730")});
	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d732"), name: 'Moneo', manager: ObjectId("4d85c7039ab0fd70a117d730")});


(vale la pena ripetere che `_id` può essre qualunque valore univoco. Poiché in una applicazione vera useremmo probabilmente un `ObjectId`, lo usiamo anche nel nostro esempio)

Naturalmente per trovare tutti gli impiegati di Leto è sufficiente eseguire:


	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

Non c'è niente di magico. La maggior parte delle volte nel caso peggiore l'assenza delle join richiederà semplicemente una query extra (probabilmente su campi indicizzati).

#### Array e Documenti Incorporati ####
L'assenza di join in MongoDB non significa che non ci siano un paio di assi nella manica. Ricordate quando abbiamo detto che MongoDB supporta gli array come oggetti di prima classe di un documento? Salta fuori che ciò è incredibilmente utile quando si ha che fare con relazioni molti-a-uno oppure molti-a-molti. Per esempio, nel caso che un impiegato possa avere due manager, potremmo facilmente memorizzarli in un array:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d733"), name: 'Siona', manager: [ObjectId("4d85c7039ab0fd70a117d730"), ObjectId("4d85c7039ab0fd70a117d732")] })

E' interessante notare che, per alcuni documenti, `manager` può essere un valore scalare, mentre per altri un array. La nostra query `find` originale funzionerà per entrambi i casi:

	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

Scoprirete presto che gli array di valori sono molto più convenienti da usare che non le join molti-a-molti tra più tabelle.

Oltre agli array Mongo supporta i documenti incorporati. Provate a inserire un documento che abbia a sua volta un documento incorporato, come per esempio:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d734"), name: 'Ghanima', family: {mother: 'Chani', father: 'Paul', brother: ObjectId("4d85c7039ab0fd70a117d730")}})

Nel caso ve lo stiate chiedendo, i documenti incorporati possono essere cercati usando una notazione-a-punto:

	db.employees.find({'family.mother': 'Chani'})

Discuteremo brevemente di quale sia il ruolo dei documenti incorporati e del come andrebbero usati.

#### DBRef ####
MongoDB supporta qualcosa noto come `DBRef`, che non è altro che una convenzione supportata da molti driver. Quando un driver incontra un `DBRef` può richiamare automaticamente il documento referenziato. Un `DBRef` include la collezione e l'id del documento a cui si fa riferimento. Di solito si usa in un caso specifico: quando documenti dalla stessa collezione possono far riferimento a documenti che appartengono a collezioni diverse l'una dall'altra. Per sempio il `DBRef` per ducomento1 potrebbe puntare a un documento contenuto in `managers` mentre per documento2 potrebbe puntare a un documento in `employees`.


#### Denormalizzazione ####
Un'altra alternativa alle join denormalizzare i dati. In passato la denormalizzazione è sempre stata riservata alle ottimizzazioni della performance, oppure ci si ricorreva quando era necessario creare degli snapshot dei dati (come in un log di revisione). Tuttavia, con la popolarità crescente dei NoSQL, molti dei quali non hanno join, la denormalizzazione come parte integrante della modellazione dei dati sta diventanto sempre più frequente. Ciò non significa che è necessario duplicare ogni informazione in ogni documento. Tuttavia, piuttosto che lasciare che la paura di duplicare dati guidi il design, provate a modellare i dati basandovi su quale informazione appartiene a quale documento.

Per esempio, immaginate di essere al lavoro su un forum. Il modo tradizionale di associare uno specifico `user` a un `post` è per via di una colonna `userid` nella tabella `users`. Una possibile alternativa è semplicimente memorizzare sia il nome (`name`) che il `userid` con ogni `post`. Potreste usare addirittura un documento incorporato, come: `user: {id: ObjectId('Something'), name: 'Leto'}`. Si, se consentite il cambio del nome agli utenti dovrete aggiornare ogni documento (il che significa 1 query aggiuntiva). 

Adattarsi a questo tipo di approccio non risulterà semplice per qualcuno di noi. In molti casi non avrà nemmeno senso. Non abbiate paura di sperimentare quest'approccio, però. Non solo è adattabile ad alcune circostanze, ma potrebbe essere addirittura la cosa giusta da fare.

#### Quale Scegliere? ####
Gli arrray di id sono sempre una strategia utile quando abbiamo a che fare con scenari uno-a-molti o molti-a-molti. E' probabilmente il caso di dire che i `DBRef` non sono usati spesso, anche se potete senz'altro giocarci un pò. Tutto spesso lascia i nuovi sviluppatori col dubbio se usare i documenti incorporati o piuttosto ricorrere ai riferimenti manuali.

Prima di tutto dovete sapere che i singoli documenti sono attualmente limitati a 16 megabyte. Sapere che c'è un limite alla dimensione dei documenti, benché piuttosto ampio, aiuta a farsi una idea di come andrebbero usati. Al momento pare che gran parte dei programmatori ricorra pesantemente ai riferimenti diretti per la gran parte delle loro relazioni. I documenti incorporati sono molto usati, ma per blocchi di dati relativamente piccoli, che vogliamo sempre richiamare assieme al documento principale. Un esempio reale che ho usato in passato è il salvataggio di un documento `accounts` per ogni utente, qualcosa tipo:

	db.users.insert({name: 'leto', email: 'leto@dune.gov', account: {allowed_gholas: 5, spice_ration: 10}})

Questo non significa che dovreste sottovalutare la potenza dei documenti incorporati, o classificarli come una utility di secondaria importanza. Avere un modello dati mappato direttamente sugli oggetti rende tutto molto semplice e spesso elimina la necessità di join. Ciò è specialmente vero considerando che MongoDB consente di cercare e indicizzare sui campi di un documento incorporato.

### Poche o Tante Collezioni ###
Dato che le collezioni non obbligano ad alcuno schema, è ovviamente possibile costruire un sistema che usa una sola collezione contenente un guazzabuglio di oggetti diversi. Per quanto ho visto, la maggior parte dei sistemi MongoDB è disposto in maniera simile a quel che trovereste in un sistema relazionale. In altre parole, se avrebbe una tabella in un database relazione, è probabile che avrà una collezione in MongoDB (le tabelle per relazioni molti-a-molti in questo caso sono una eccezione importante).

La faccenda si fa ancor più interessante prendendo in considerazione i documenti incorporati. L'esempio più usato è il blog. Dovremmo avere una collezione `posts` e una collezione `comments`, oppure dovremmo far si che ogni `post` abbia una array di `comments` incorporati? Lasciando da parte il limite dei 16MB (tutto l'Amleto è meno di 200KB, quanto è famoso il vostro blog?) la maggior parte degli sviluppatori preferiscono separare le cose. E' semplicemente più limpido ed esplicito.

Non ci sono regole precise (a parte la faccenda dai 16MB). Giocate con i diversi approcci e capirete presto cosa ha senso e cosa non funziona nel vostro caso.

### Riepilogo ###
In questo capitolo il nostro scopo era fornire delle linee guida utili alla modellazione dati con MongoDB. Un punto di partenza se volete. La modellazione in un sistema document-oriented è cosa diversa, ma non troppo, dal mondo relazionale. C'è un pò più di flessibilità e un vincolo in più ma, per essere un nuovo sistema, le cose sembrano aggiustarsi piuttosto bene. L'unico modo di sbagliare è non provarci nemmeno.

\clearpage

## Capitolo 5 - Quando Usare MongoDB ##
A questo punto dovreste conoscere MongoDB abbastanza bene da capire dove e come inserirlo nel vostro sistema. Ci sono abbastanza nuove tecnologie in competizione tra loro che è facile farsi intimidire dal numero delle opzioni. 

Per quanto mi riguarda la lezione più importante, che non ha nulla a che fare con MongoDB, è che non siamo più costretti ad affidarci a un'unica soluzione per gestire i nostri dati. Non c'è dubbio che adottare un'unica soluzione porti ovvi vantaggi e che per molti progetti, probabilmente la gran parte, una singola soluzione sia l'approccio migliore. L'idea non è che dovete per forza usare più tecnologie, ma piuttosto che potete farlo. Solo voi potete sapere se affiancare nuove tecnologie poerterà più vantaggi o svantaggi al vostro progetto.
 
Detto questo, sono fiducioso che quel che avete visto finora via abbia fatto capire MongoDB come una soluzione generale. Abbiamo già detto un paio di volte che i database document-oriented hanno molto in comune con quelli relazionali. Quindi, piuttosto che girarci attorno, diciamo chiaramente che MongoDB dovrebbe essere visto come una diretta alternativa ai datbase relazionali. Laddove vediamo Lucene come un database relazionale con l'indicizzazione del full-text in aggiunta, o Redis come un archivio persistente di coppie chiave-valore, vediamo MongoDB come un deposito centralizzato per i nostri dati.

Noterete che non ho definito MongoDB una *sostituzione* dei database relazionali, ma piuttosto una *alternativa*. E' uno strumento in grado di fare gran parte delle cose che fanno gli altri strumenti, alcune le fa meglio, altre peggio. Approfondiamo un pò il discorso.

### Schema-less ###
Un aspetto molto propagandato dei database orientati ai documenti è l'assenza di schema. Li rende molto più flessibili delle tabelle nei database relazionali tradizionali. Concordo sul fatto che schema-less sia una bella caratteristica, ma non per la ragione che la maggior parte della gente pensa.

Quando pensiamo a strutture senza schema immaginiamo di cominciare ad archiviare dati eterogenei. Ci sono domini e set di dati che possono essere davvero difficili da modellare con i database relazionali, ma si tratta di casi limite. Schema-less è bello, ma la gran parte dei dati finiranno per essere altamente strutturati. E' vero che avere dati eterogenei è comodo, specialmente quando introduciamo nuove caratteristiche, cosa che in realtà potremmo ottenere con una banale colonna nullabile in un database relazionale.

Per quanto mi riguarda il vero vantaggio di un design schema-less è l'assenza di un setup e la frizione ridotta con la programmazione orientata agli oggetti (OOP). Questo è particolarmente utile quando lavoriamo con un linguaggio statico. Ho usato MongoDB sia in C# che in Ruby, e la differenza è impressionante. Il dinamismo di Ruby e il le sue famose implementazioni ActiveRecord già riducono molto il problema della discordanza tra gli oggetti e il database. Ciò non significa che MongoDB sia una scelta inutile per Ruby, al contrario. Credo che per i programmatori Ruby MongoDB sia un miglioramento, laddove per gl sviluppatori C# o Java si riverlerà un cambio fondamentale nel modo in cui interagiscono coi dati. 

Vedetela dal punto di vista di uno sviluppatore di driver. Vuoi salvare un oggetto? Serializzalo in JSON (tecnicamente si tratta di BSON, ma cambia poco) e invialo a MongoDB. Non c'è mappatura delle proprietà o dei tipi di dato. Questa immediatezza si rispecchia direttamente su di noi, gli sviluppatori finali.

### Scritture ###
Un'area in cui MongoDB può soddisfare un ruolo particolare è il logging. Ci sono due cose che rendono le scritture di MongoDB piuttosto veloci. Primo, possiamo inviare un comando di scrittura e vederlo ritornare senza dover aspettare che la scrittura sia effettivamente avvenuta. Secondo, con l'introduzione del journaling nella versione 1.8 e i miglioramenti fatti nella 2.0 possiamo controllare il comportamento delle write con riferimento alla durabilità dei dati. Queste impostazioni, in aggiunta all'indicazione di quanti server devono ricevere i dati prima che venga considerata sicura, sono conigurabili per ogni write, il che ci garantisce un ottimo controllo sulla performance delle write e sulla performance. 

In aggiunta ai fattori sulla performance, il log dei dati è uno di quei data set che possono trarre vantaggio dalle collezioni senza schema. Infine, MongoDB è dotato di qualcosa chiamato [capped collection](http://www.mongodb.org/display/DOCS/Capped+Collections). Finora tutte le collezioni che abbiamo creato erano normali. Possiamo creare una capped collection usando il comando  `db.createCollection` con il flag capped:

	//limitiamo la nostra collezione a 1 megabyte
	db.createCollection('logs', {capped: true, size: 1048576})

Quando la nostra collezione raggiungerà il limite di 1MB, i vecchi documenti verranno eliminati automaticamente. E' anche possibile usare `max` per impostare un limite sul numero dei documenti piuttosto che sulla dimensione della collezione. Le capped collections hanno alcune caratteristiche interessanti. Per esempio, è possibile aggiornare un documento ma non aumentarne le dimensioni. Inoltre, l'ordine di inserimento è preservato così non si rende necessario aggiungere un ulteriore indice per fare ordinamenti basati sulla data di creazione.

Questo è un buon punto per sottolineare che se volete sapere se la vostra write è andata a buon fine, basta far seguire il comando `db.getLastError()`. La maggior parte dei driver supportabi questa opzione come una *safe write*, per esempio specificando `{:safe => true}` come secondo parametro della `insert`. 

### Affidabilità ###
Fino alla versione 1.8 MongoDB non era affidabile sul server singolo. Ciò significa che un crash avrebbe probabilmente causato una perdita di dati. La soluzione è sempre stata quella di eseguire MongoDB in configurazione multi-server (MongoDB supporta la replication). Una delle più importanti novità introdotte con la versione 1.8 è il journaling. Per attivarlo basta aggiungere una nuova linea con `journal=true` al file `mongodb.config` che abbiamo creato quando abbiamo configurato MongoDB la prima volta (è necessario riavviare il server se vogliamo attivare subito il journaling). Probabilmente vale la pena attivare il journaling (sarà attivato di default in una delle prossime versioni). A volte tuttavia potrebbe valer la pena rinunciare al journaling a fronte di un aumento delle prestazioni (alcuni tipi di applicazioni possono accettare il rischio di perdita dati). 

In passato si è discusso molto della mancanza in MongoDB del supporto per la durabilità sul singolo server. E' probabile che su Google salteranno fuori queste discussione ancora per parecchio tempo, ma sappiate che si tratta, semplicemente, di informazioni non più aggiornate.

### Rircerca Full-Text ###
Speriamo che la ricerca full text arrivi con una delle prossima versioni di MongoDB. Grazie al supporto per gli array è piuttosto facile implementare una ricerca full text di base. Per ottenere qualcosa di più potente ci toccherà rivolgerci a soluzioni tipo Lucene/Solr. Naturalmente questo è vero anche per molti database relazionali.

### Transazioni ###
MongoDB non supporta la transazioni. Offre due alternative, una delle quali è ottima ma di uso limitato mentre l'altra è macchinosa ma flessibile.

La prima corrisponde alle sue molte operazioni atomiche. Sono eccellenti, fintanto che riescono a risolvere il nostro problema. Abbiamo già visto alcune delle più semplici, come `$inc` e  `$set`. Sono disponibili anche comandi come `findAndModify` che aggiorna o cancella un documento e lo restituisce atomicamente.

La seconda, da usare quando le operazioni atomiche non sono sufficienti, consite nel ripiegare su una commit in due fasi. Una commit in due fasi è l'equivalente, per le transazioni, di quel che la deferenzazione costituisce per le join. Si tratta di una implementare nel proprio codice una soluzione, indipendentemente dalla base dati. In realtà le commit a due fasi sono piuttoto diffuse nel mondo dei database relazionali nel quale vengono suate per implementare le transazioni multi database. Il sito di MongoDB [propone un esempio](http://www.mongodb.org/display/DOCS/two-phase+commit) di uno scenario tipico (un trasferimento di fondi). L'idea di fondo è che lo stato della transazione venga archiviato col documento stesso, e che si proceda alle varie fasi init-pending-commit/rollback manualmente.

Il supporto di MongoDB per documenti nidificati e design schema-less rendono meno impegnative le commit a due fasi, ma senz'altro non si tratta di una procedura comoda, specialmente se siam alle prime armi.

### Elaborazione Dati ###
MongoDB si affida a MapReduce per la gran parte dei compiti di elaborazione. E' dotato di alcune capacità di [aggregazione di base](http://www.mongodb.org/display/DOCS/Aggregation), ma per qualcosa di serio dovrete ricorrere senz'altro a MapReduce. Nel prossimo capitolo affronteremo MapReduce in dettaglio. Per il momento possiamo limitarci a considerarlo una tecnica molto potente e diversa per eseguire dei `group by` (stiamo semplificando). Uno dei punti di forza di MapReduce è il fatto che può essere usato in parallelo quando occorre eseguire elaborazioni su grandi quantità di dati. Tuttavia l'implementazione di MongoDB si affida a JavaScript, il quale è single-threaded. Qual'è il punto? Per elaborare una grande mole di dati ci sarà bisogno di rivolgersi a qualcos'altro, come Hadoop. Per fortuna i due sistemi si complementano a vicenda, ed esiste un [adapter MongoDB per Hadoop](https://github.com/mongodb/mongo-hadoop). 

Naturalmente, l'elaborazione dati parallela non è un campo in cui i database relazionali siano particolarmente dotati. Una gestione migliore dei grandi dati è prevista comunque, in una delle future versioni di MongoDB


### Geospazialità ###
Una caratteristica particolarmente potente di MongoDB è il suo supporto per gli indici geospaziali. Consente di archiviare coordinate x e y nei documenti e in seguito di cercare documenti che sono `$near` (vicini) un set di coordinate, o `$within` (contenuti) in un rettangolo o un cerchio. E' una caratteristica più facile da comprendere visivamente, pertanto vi invito a provare il [tutorial geospaziali interattivo di 5 minuti](http://mongly.com/geo/index) se volete saperne di più.

### Strumenti e Maturità ###
Probabilmente lo sapete già, il fatto è che MongoDB è ovviamente più giovane della maggior parte dei database relazionali. Questo è qualcosa da prendere in considerazione con attenzione. Quanto dipende da cosa state facendo e come lo state facendo. In ogni caso un serio ragionamento semplicemente non può ignorare il fatto che MongoDB è più giovane e che gli strumenti a disposizione non sono fantastici (anche se bisogna dire che gli strumenti a disposizione di molti database relazionali maturi sono anch'essi piuttosto terribili!). Per esempio, la mancanza di supporto per i numeri a virgola mobile in base 10 si rivelerà senz'altro un grattacapo (ma non necessariamente la fine de giochi) per quei sistemi che devono gestire denaro.

La buona notizia è che esistono driver per molti linguaggi, il protocollo è moderno e semplice, e lo sviluppo avviene a grandissima velocità. MongoDB è in usato in produzione da un numero tale di aziende che le preoccupazioni sulla sua maturità, pur valide, stanno rapidamente diventando una cosa del passato.

### Riepilogo ###
Il messaggio da cogliere da questo capitolo è che MongoDB nella maggior parte dei casi può sostituire un database relazionale. E' molto più semplice e diretto; è più veloce e in genere impone meno restrizioni agli sviluppatori. La mancanza di transazioni può rivelarsi un limite significativo. Tuttavia, quando qualcuno chiede quale sia il ruolo di MongoDB nel panorama dei nuovi sistemi di archiviazione, la riposta è semplice: **proprio nel mezzo**.

\clearpage

## Chapter 6 - MapReduce ##
MapReduce è un approccio all'elaborazione dati che vanta due vantaggi significativi rispetto alle altre soluzione più tradizionali. Il primo, e più importante, sono le performance. In linea teorica MapReduce può essere parallelizzato, il che permette l'elaborazione di set di dati molto grandi su più cores/CPU/computers. Come abbiamo già visto attualmente MongoDB non è in grado di sfruttare appieno questo aspetto. Rispetto a quel che è possibile fare via SQL, il codice di MapReduce è infinitamente più ricco e ci permette di spingergi molto avanti prima che una soluzione ancora più specializzata si renda necessaria.

La popolarità del modello MapReduce è cresciuta molto, ed è ora possibile usarlo praticamente ovunque; C#, Riby, Java, Python e così via, tutti ne offrono l'implementazione. Preferisco avvirsarmi, inizialmente tutto questo sembrerà molto diverso dal solito e piuttosto complicato. Non fatevi abbattere, prendetevi il tempo di sperimentare voi stessi. Vale la pena capire MapReduce a prescindere dal fatto che userete MongoDB o meno.

### Un Mix di Teoria e Pratic ###
MapReduce è un processo a due fasi. Prima si mappa (map) e poi si riduce (reduce). Il mapping trasforma i documenti in input ed emette una coppia chiave=>valore (chiave e valore possono essere complessi). La reduce prende una chiavee l'array dei valori abbinati a quella chiave e produce il risultato finale. Affronteremo entrambe le fasi e il rispettivo output.

L'esempio che useremo è la generazione di un report col numero di viste (hits), per giorno, che otteniamo per una data risorsa (diciamo una pagina web). E' il *hello world* del MapReduce. Per raggiungere il nostro scopo ci affideremo a una collezione `hits` che conterrà due campi: `resource` e `date`. L'output che vogliamo ottenere è un elenco con le seguenti colonne:  `resource`, `year`, `month`, `day` e `count`.

Dati i seguenti contenuti di `hits`:

	resource     date
	index        Jan 20 2010 4:30
	index        Jan 20 2010 5:30
	about        Jan 20 2010 6:00
	index        Jan 20 2010 7:00
	about        Jan 21 2010 8:00
	about        Jan 21 2010 8:30
	index        Jan 21 2010 8:30
	about        Jan 21 2010 9:00
	index        Jan 21 2010 9:30
	index        Jan 22 2010 5:00

Desideriamo ottenere i seguenti risultati:

	resource  year   month   day   count
	index     2010   1       20    3
	about     2010   1       20    1
	about     2010   1       21    3
	index     2010   1       21    2
	index     2010   1       22    1

La cosa bella di un approccio di questo tipo è che, salvando l'output, i report sono veloci da generare e la crescita dei dati è controllata (per ogni risorsa che tracciamo aggiungeremo non più di 1 documento al giorno)

Per il momento concentriamoci sul concetto. Alla fine di questo capitolo vi fornirò dei dati e del codice di esempio da usare per fare degli esperimenti per conto vostro.

La prima cosa da fare è affrontare la funzione map. L'obiettivo della map è emettere un valore che può essere ridotto. E' possibile che map emetta 0 o piu risultati. Nel nostro caso emettera un risultato (cosa che capita spesso). Immaginiamo la map come un ciclo che scorre i documenti della collezione hits. Per ogni documento vogliamo emettere una chiave con resource, year, month e day, ed un semplice valore 1:

	function() {
		var key = {
		    resource: this.resource, 
		    year: this.date.getFullYear(), 
		    month: this.date.getMonth(), 
		    day: this.date.getDate()
		};
		emit(key, {count: 1}); 
	}

`this` fa riferimento al documento trattato al momento. Vedere l'output del mapping dovrebbe agevolare la comprensione del procedimento. Usando i dati visti sopra, l'output completo sarebbe:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'about', year: 2010, month: 0, day: 20} => [{count: 1}]
	{resource: 'about', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'index', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}]
	{resource: 'index', year: 2010, month: 0, day: 22} => [{count: 1}]

Capire questo passagio intermedio è la chiave per comprendere MapReduce. I valori della emit sono raggruppati, in forma di array, per ogni chiave. Gli sviluppatori .NET e Java possono immaginare che si tratti del tipo: `IDictionary<object, IList<object>>` (.NET) oppure `HashMap<Object, ArrayList>` (Java).

Cambiamo la nosta map function in modo piuttosto artificioso:

	function() {
		var key = {resource: this.resource, year: this.date.getFullYear(), month: this.date.getMonth(), day: this.date.getDate()};
		if (this.resource == 'index' && this.date.getHours() == 4) {
			emit(key, {count: 5});
		} else {
			emit(key, {count: 1}); 
		}
	}

Il primo output intermedio cambierebbe in:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 5}, {count: 1}, {count:1}]

Notate come ogni emit genera un nuovo valore che è raggruppato in base alla nostra chiave (key).

La funzione reduce prende ognuno di questi risultati intermedi e genera l'output finale. Ecco come appare la nostra funzione:

	function(key, values) {
		var sum = 0;
		values.forEach(function(value) {
			sum += value['count'];
		});
		return {count: sum};
	};

Che restituisce l'output seguente:

	{resource: 'index', year: 2010, month: 0, day: 20} => {count: 3}
	{resource: 'about', year: 2010, month: 0, day: 20} => {count: 1}
	{resource: 'about', year: 2010, month: 0, day: 21} => {count: 3}
	{resource: 'index', year: 2010, month: 0, day: 21} => {count: 2}
	{resource: 'index', year: 2010, month: 0, day: 22} => {count: 1}

Tecnicamente, l'output in MongoDB è:

	_id: {resource: 'home', year: 2010, month: 0, day: 20}, value: {count: 3}

Avrete notato che questo è proprio il risultato finale che stavamo cercando.

Se avete prestato attenzione, forse vi sarete chiesti *perché non abbiamo usato semplicemente `sum = values.length`?* Sembrerebbe un approccio efficace visto che stiamo essenzialmente sommando un array di 1. Il fatto è che non sempre reduce è usato con un set di dati intermedi perfetti e completi. Per esempio, se invece di essere chiamato con:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]

Reduce fosse chiamato con:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}]
	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 2}, {count: 1}]

L'ouput finale è lo stesso (3), il percorso fatto è semplicemente diverso. Per questo motivo reduce deve esempre essere idempotente, il che significa che chiamare reduce piè volte dovrebbe sempre generare il risultato che si otterrebbe con una sola chiamata.

Non lo faremo qui, ma è frequente concatenare metodi reduce quando si eseguono analisi più complesse.

### Pratica Pura ###
Con MongoDB usiamo il comando `mapReduce` su una collezione. `mapReduce` accetta una funzione map, una funzione reduce e una direttiva di output. Nella nostra scell possiamo creare e passare una funzione JavaScript. Con la maggior parte delle librerie potete passare una stringa che contiene le vostre funzioni (il che è piuttosto brutto). Prima di tutto creiamo il nostro semplice set di dati:

	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 4, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 5, 30)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 20, 6, 0)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 7, 0)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 8, 0)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 8, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 21, 8, 30)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 9, 0)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 21, 9, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 22, 5, 0)});

Ora possiamo creare le nostre funzioni map e reduce (la shell MongoDB accetta comandi multi-riga, vedrai apparire *...* dopo la pressione di invio ad indicare che ci si aspetta altro testo)

	var map = function() {
		var key = {resource: this.resource, year: this.date.getFullYear(), month: this.date.getMonth(), day: this.date.getDate()};
		emit(key, {count: 1}); 
	};
	
	var reduce = function(key, values) {
		var sum = 0;
		values.forEach(function(value) {
			sum += value['count'];
		});
		return {count: sum};
	};

Ora possiamo lanciare il comando `mapReduce` sulla nostra collezione `hits`:

	db.hits.mapReduce(map, reduce, {out: {inline:1}})

Se eseguite il comando qui sopra dovreste ottenere il risultato desiderato. Impostare `out` a `inline` signica che l'output da `mapReduce` ci è immediatamente restituito. Attualmente c'è un limite a 16 megabyte o meno per gli output di questo tipo. Potremmo invece specificare `{out: 'hit_stats'}` per ottenere i risultati nella nuova collezione `hit_statis`:

	db.hits.mapReduce(map, reduce, {out: 'hit_stats'});
	db.hit_stats.find();

Facendo questo, eventuali dati esistenti in `hit_stats` vanno perduti. Se facessimo `{out: {merge: 'hit_stats'}}` le chiavi esistenti verrebbero aggiornate coi nuovi valori e le nuove chiavi verrebbero inserite come nuovi documenti. Potremmo infine fare `out` su una funzione `reduce` per gestire casi più avanzati (come una upsert)

Il terzo parametro accetta opzioni aggiuntive, potremmo per esempio filtrare, ordinare e limitare i documenti che vogliamo analizzare. Possiamo inoltre fornire un metodo `finalize` da applciare ai risultati dopo la fase `reduce`.

### Riepilogo ###
Questo è il primo capitolo in cui abbiamo affrontato qualcosa di veramente diverso dal solito. Se vi siete trovati a disagio, tenete presente che potete sempre ricorrere alle altre [capacità di aggregazione](http://www.mongodb.org/display/DOCS/Aggregation) offerte da MongoDB, adatte a scenari più semplicei. In fin dei conti MapReduce è una delle caratteristiche più accattivanti di MongoDB. La chiave per comprendere a fondo come scrivere le vostre funzioni di map e reduce è visualizzare e comprendere l'aspetto che i dati intermedi assumeranno all'uscita della `map`, pronti per passare alla `reduce`

\clearpage

## Chapter 7 - Performance e Strumenti ##
In quest'ultimo capitolo tratteremo le questioni di performance e daremo una occhiata ad alcuni strumenti (tools) disponibili per gli sviluppatori MongoDB. Per ognuno di questi argomenti esamineremo gli aspetti più importanti, senza scendere troppo in dettaglio.

### Indici ###
All'inizio del libro abbiamo incontrato la collezione speciale `system.indexes` che contiene informazioni su tutti gli indici del nostro database. Gli indici in MongoDB funzionano in molto maniera simile a quella dei database relazionali: migliorano la performance di ricerche e ordinamenti. Gli indici vengono creati con `ensureIndex`:

	db.unicorns.ensureIndex({name: 1});

E cancellati con `dropIndex`:

	db.unicorns.dropIndex({name: 1});

Un indice univoco si crea passando un secondo parametro e impostando `unique` a `true`:

	db.unicorns.ensureIndex({name: 1}, {unique: true});

Gli indici possono venire creati su campi incorporati (ancora una volta con la notazione col punto) e sugli array. E' anche possibile creare indici compositi:

	db.unicorns.ensureIndex({name: 1, vampires: -1});

L'ordine dell'indice (1 per ascendente, -1 per descendente) non importa per gli indici singoli, ma può avere un impatto sugli indici compositi, quando si fanno ordinamenti applicando condizioni di range (gamma).

Maggiori informazioni sugli indici sono reperibili sulla [pagina sugli indici](http://www.mongodb.org/display/DOCS/Indexes) del sito ufficiale.

### Explain ###
Per capire se le nostre query stanno usando un indice possiamo ricorrere al metodo `explain` applicato a un cursore:

	db.unicorns.find().explain()

L'output ci dice che è stato usato un `BasicCursor` (che significa non-indicizzato), che 12 oggetti sono stati trattati, quanto tempo c'è voluto, quale indice è stato eventualmente usato, e qualche altra utile informazione.

Se facciamo in modo che la nostra query usi un indice scopriremo che è stato usato `BtreeCursor`, e ci verrà detto il nome dell'indice applicato:

	db.unicorns.find({name: 'Pilot'}).explain()

### Scritture 'Fire and Forget' ###
Abbiamo già detto prima che, per default, le write in MongoDB sono del tipo fire-and-forget. Questo migliora le performance e anche il rischio di perdita dati nel caso di un crash. Un effetto interessante di questo tipo di scrittura dei dati è il fatto che non viene restituito un errore quando una insert/update viola un vincolo di univocità. Per essere informati sugli errori di scrittura è necessario chiamare esplicitamente il metodo `db.getLastError()` dopo una insert. Molti driver gestiscono internamente (astraggono) questo dettaglio, e forniscono direttamente un metodo per eseguire writes *sicure* - spesso ricorrendo a un parametro extra. 

Sfortunamente la shell esegue automaticamente delle scritture sicure, pertanto non possiamo vedere facilmente questo comportamento in azione.

### Sharding ###
MongoDB supporta l'auto-sharding. Il Sharding è un approccio alla scalabilità che suddivide i dati su server multipli. Una implementazone banale potrebbe salvare tutti i dati degli utenti con nome che comincia per A-M sul server 1, e il resto sul server2. Per fortuna le capacità di sharding di MongoDB sono nettamente superiori. L'argomento Sharding è ben al di là degli scopi di questo libro, ma sappiate che esiste e che dovreste considerarlo nel caso le vostre necessità vadano oltre il singolo server.

### Replication ###
La replicazione in MongoDB funziona in modo simile a quella dei database relazionali. Le scritture vengono inviate a un singolo server, il master, che in seguito si sincronizza con uno o più server, gli slave. Possiamo controllare se le letture possono avvenire o meno sugli slave, il che ci può aiutare a distribuire il carico di lavoro correndo però il rischio di leggere dati leggermente obsoleti. Se il master fallisce, uno slave può venir promosso al ruolo di master. Anche la replication è al di là degli scopi di questo libro.

E' vero che la replication può migliorare la performance (distribuendo le letture), ma il suo scopo principale è migliorare l'affidabilità. Combinare replication e sharding è un approccio molto diffuso. Per esempio, ogni shard potrebbe essere configurato con un master e uno slave. (Tecnicamente ci sarà anche bisogno di un arbitro per decidere chi promuovere nel caso di due slave che tentano entrambi di diventare master. Ma un arbitro richiede poche risorse e può essere usato per più shard.)

### Statistiche ###
Possiamo ottenere informazioni su un database digitando `db.stats()`. Gran parte delle informazioni riguardano le dimensioni del database. Possiamo anche ottenere informazini su una collection, per esempio `unicorns`, digitando `db.unicorns.stats()`. Anche in questo caso le informazioni riguardano più che altro le dimensioni della nostra collezione.

### Intefaccia Web ###
Tra le informazioni disponibili quando abbiamo lanciato MongoDB c'era un link a un tool amministrativo su web (potrebbe essere ancora visibile se fate scorrere la finestra di comando/terminale fino al punto in cui avete lanciato `mongod`). Lo strumento amministrativo è accessibile puntando il browser all'indirizzo <http://localhost:28017/>. Varrà la pena aggiungere `rest=true` al config e riavviare il processo `mongod`. L'interfaccia web fornisce molte informazioni sullo stato del server.

### Profiler ###
Possiamo attivare il profile di MongoDB eseguendo:

	db.setProfilingLevel(2);

Una volta attivato, possiamo lanciare un comando:

	db.unicorns.find({weight: {$gt: 600}});

Quindi esaminare il profiler:

	db.system.profile.find()

L'output ci dirà che cosa è stato eseguito e quando, quando documenti sono stati considerati e quanti dati sono stati restituiti.

Il profiler si disattiva chiamando di nuovo `setProfileLevel` ma questa volta impostando l'argomento a `0`. Un'altra opzione è specificare `1` che profilerà solo le query che richiedono più di 100 millisecondi. Oppure possiamo specificare il tempo minimo, in millisecondi, ricorrendo a un secondo parametro:

	//profile per qualunque cosa che impieghi più di 1 secondo
	db.setProfilingLevel(1, 1000);

### Backups e Restore ###
Nella cartella `bin` di MongoDB c'è l'eseguibile `mongodump`. Semplicemente lanciandolo, `mongodump` si connetterà al localhost e farà il backup dei database in una sotto-cartella `dump`. Possiamo digitare `mongodump --help` per scoprire le opzioni aggiuntive. Le più comuni sono `--db NOME` per fare il backup di un database specifico e `-- collection NOMECOLLEZIONE` per fare il backup di una collezione specifica. In seguito possiamo ricorrere all'eseguibile `mongorestore`, sempre nella cartella `bin`, per ripristinare un backup precedente. Anche in questo caso possiamo usare `--db` e `--collection` per ripristinare un database o una collezione particolare.

Per esempio se volessimo eseguire il backup della collezione `learn` in una cartella `backup`, dovremmo eseguire (questi sono eseguibili indipendenti, non funzioneranno dall'interno della shell di mongo):

	mongodump --db learn --out backup

Per ripristinare solo la collezione `unicorns` potremmo eseguire:

	mongorestore --collection unicorns backup/learn/unicorns.bson

Vale la pena ricordare che `mongoexport` e `mongoimport` sono due altri eseguibili che possono essere usati per esportare e importare dati da JSON o CSV. Per esempio possiamo ottenere un output JSON eseguendo:

	mongoexport --db learn -collection unicorns

E un output CSV eseguendo:

	mongoexport --db learn -collection unicorns --csv -fields name,weight,vampires

Tenete presente che `mongoexport` e `mongoimport` non sono sempre in grado di rappresentare i dati. Solo `mongodump` e `mongorestore` dovrebbero essere usati per ottenere dei veri backup.

### Riepilogo ###
In questo capitolo abbiamo scoperto vari comandi, strumenti e dettagli sulla performance di MongoDB. Non abbiamo visto tutto, ci siamo limitati quelli usati più spesso. L'indicizzazione in MongoDB è simile a quella dei database relazionali, così come molti gli altri strumenti. In MongoDB tuttavia molti di questi strumenti sono davvero semplici da usare.

\clearpage

## Conclusion ##
You should have enough information to start using MongoDB in a real project. There's more to MongoDB than what we've covered, but your next priority should be putting together what we've learned, and getting familiar with the driver you'll be using. The [MongoDB website](http://www.mongodb.com/) has a lot of useful information. The official [MongoDB user group](http://groups.google.com/group/mongodb-user) is a great place to ask questions.

NoSQL was born not only out of necessity, but also out of an interest to try new approaches. It is an acknowledgement that our field is ever advancing and that if we don't try, and sometimes fail, we can never succeed. This, I think, is a good way to lead our professional lives.
