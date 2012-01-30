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

## Chapter 4 - Data Modeling ##
Let's shift gears and have a more abstract conversation about MongoDB. Explaining a few new terms and some new syntax is a trivial task. Having a conversation about modeling with a new paradigm isn't as easy. The truth is that most of us are still finding out what works and what doesn't when it comes to modeling with these new technologies. It's a conversation we can start having, but ultimately you'll have to practice and learn on real code.

Compared to most NoSQL solutions, document-oriented databases are probably the least different, compared to relational databases, when it comes to modeling. The differences which exist are subtle but that doesn't mean they aren't important. 

### No Joins ###
The first and most fundamental difference that you'll need to get comfortable with is MongoDB's lack of joins. I don't know the specific reason why some type of join syntax isn't supported in MongoDB, but I do know that joins are generally seen as non-scalable. That is, once you start to horizontally split your data, you end up performing your joins on the client (the application server) anyways. Regardless of the reasons, the fact remains that data *is* relational, and MongoDB doesn't support joins.

Without knowing anything else, to live in a join-less world, we have to do joins ourselves within our application's code. Essentially we need to issue a second query to `find` the relevant data. Setting our data up isn't any different than declaring a foreign key in a relational database. Let's give a little less focus to our beautiful `unicorns` and a bit more time to our `employees`. The first thing we'll do is create an employee (I'm providing an explicit `_id` so that we can build coherent examples)

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d730"), name: 'Leto'})

Now let's add a couple employees and set their manager as `Leto`:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d731"), name: 'Duncan', manager: ObjectId("4d85c7039ab0fd70a117d730")});
	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d732"), name: 'Moneo', manager: ObjectId("4d85c7039ab0fd70a117d730")});


(It's worth repeating that the `_id` can be any unique value. Since you'd likely use an `ObjectId` in real life, we'll use them here as well.)

Of course, to find all of Leto's employees, one simply executes:

	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

There's nothing magical here. In the worst cases, most of the time, the lack of join will merely require an extra query (likely indexed).

#### Arrays and Embedded Documents ####
Just because MongoDB doesn't have joins doesn't mean it doesn't have a few tricks up its sleeve. Remember when we quickly saw that MongoDB supports arrays as first class objects of a document? It turns out that this is incredibly handy when dealing with many-to-one or many-to-many relationships. As a simple example, if an employee could have two managers, we could simply store these in an array:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d733"), name: 'Siona', manager: [ObjectId("4d85c7039ab0fd70a117d730"), ObjectId("4d85c7039ab0fd70a117d732")] })

Of particular interest is that, for some documents, `manager` can be a scalar value, while for others it can be an array. Our original `find` query will work for both:

	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

You'll quickly find that arrays of values are much more convenient to deal with than many-to-many join-tables.

Besides arrays, MongoDB also supports embedded documents. Go ahead and try inserting a document with a nested document, such as:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d734"), name: 'Ghanima', family: {mother: 'Chani', father: 'Paul', brother: ObjectId("4d85c7039ab0fd70a117d730")}})

In case you are wondering, embedded documents can be queried using a dot-notation:

	db.employees.find({'family.mother': 'Chani'})

We'll briefly talk about where embedded documents fit and how you should use them.

#### DBRef ####
MongoDB supports something known as `DBRef` which is a convention many drivers support. When a driver encounters a `DBRef` it can automatically pull the referenced document. A `DBRef` includes the collection and id of the referenced document. It generally serves a pretty specific purpose: when documents from the same collection might reference documents from a different collection from each other. That is, the `DBRef` for document1 might point to a document in `managers` whereas the `DBRef` for document2 might point to a document in `employees`.


#### Denormalization ####
Yet another alternative to using joins is to denormalize your data. Historically, denormalization was reserved for performance-sensitive code, or when data should be snapshotted (like in an audit log). However, with the ever-growing popularity of NoSQL, many of which don't have joins, denormalization as part of normal modeling is becoming increasingly common. This doesn't mean you should duplicate every piece of information in every document. However, rather than letting fear of duplicate data drive your design decisions, consider modeling your data based on what information belongs to what document.

For example, say you are writing a forum application. The traditional way to associate a specific `user` with a `post` is via a `userid` column within `posts`. With such a model, you can't display `posts` without retrieving (joining to) `users`. A possible alternative is simply to store the `name` as well as the `userid` with each `post`. You could even do so with an embedded document, like `user: {id: ObjectId('Something'), name: 'Leto'}`. Yes, if you let users change their name, you'll have to update each document (which is 1 extra query). 

Adjusting to this kind of approach won't come easy to some. In a lot of cases it won't even make sense to do this. Don't be afraid to experiment with this approach though. It's not only suitable in some circumstances, but it can also be the right way to do it.

#### Which Should You Choose? ####
Arrays of ids are always a useful strategy when dealing with one-to-many or many-to-many scenarios. It's probably safe to say that `DBRef` aren't use very often, though you can certainly experiment and play with them. That generally leaves new developers unsure about using embedded documents versus doing manual referencing.

First, you should know that an individual document is currently limited to 4 megabytes in size. Knowing that documents have a size limit, though quite generous, gives you some idea of how they are intended to be used. At this point, it seems like most developers lean heavily on manual references for most of their relationships. Embedded documents are frequently leveraged, but mostly for small pieces of data which we want to always pull with the parent document. A real world example I've used is to store an `accounts` document with each user, something like:

	db.users.insert({name: 'leto', email: 'leto@dune.gov', account: {allowed_gholas: 5, spice_ration: 10}})

That doesn't mean you should underestimate the power of embedded documents or write them off as something of minor utility. Having your data model map directly to your objects makes things a lot simpler and often does remove the need to join. This is especially true when you consider that MongoDB lets you query and index fields of an embedded document. 

### Few or Many Collections ###
Given that collections don't enforce any schema, it's entirely possible to build a system using a single collection with a mismatch of documents.  From what I've seen, most MongoDB systems are laid out similarly to what you'd find in a relational system. In other words, if it would be a table in a relational database, it'll likely be a collection in MongoDB (many-to-many join tables being an important exception).

The conversation gets even more interesting when you consider embedded documents. The example that frequently comes up is a blog. Should you have a `posts` collection and a `comments` collection, or should each `post` have an array of `comments` embedded within it. Setting aside the 4MB limit for the time being (all of Hamlet is less than 200KB, just how popular is your blog?), most developers still prefer to separate things out. It's simply cleaner and more explicit.

There's no hard rule (well, aside from 4MB). Play with different approaches and you'll get a sense of what does and does not feel right. 

### In This Chapter ###
Our goal in this chapter was to provide some helpful guidelines for modeling your data in MongoDB. A starting point if you will. Modeling in a document-oriented system is different, but not too different than a relational world. You have a bit more flexibility and one constraint, but for a new system, things tend to fit quite nicely. The only way you can go wrong is by not trying.

\clearpage

## Chapter 5 - When To Use MongoDB ##
By now you should have a good enough understanding of MongoDB to have a feel for where and how it might fit into your existing system. There are enough new and competing storage technologies that it's easy to get overwhelmed by all of the choices. 

For me, the most important lesson, which has nothing to do with MongoDB, is that you no longer have to rely on a single solution for dealing with your data. No doubt, a single solution has obvious advantages and for a lot projects, possibly even most, a single solution is the sensible approach. The idea isn't that you must use different technologies, but rather that you can. Only you know whether the benefits of introducing a new solution outweigh the costs.

With that said, I'm hopeful that what you've seen so far has made you see MongoDB as a general solution. It's been mentioned a couple times that document-oriented databases share a lot in common with relational databases. Therefore, rather than tiptoeing around it, let's simply state that MongoDB should be seen as a direct alternative to relational databases. Where one might see Lucene as enhancing a relational database with full text indexing, or Redis as a persistent key-value store, MongoDB is a central repository for your data.

Notice that I didn't call MongoDB a *replacement* for relational databases, but rather an *alternative*. It's a tool that can do what a lot of other tools can do. Some of it MongoDB does better, some of it MongoDB does worse. Let's dissect things a little further.

### Schema-less ###
An oft-touted benefit of document-oriented database is that they are schema-less. This makes them much more flexible than traditional database tables. I agree that schema-less is a nice feature, but not for the main reason most people mention.

People talk about schema-less as though you'll suddenly start storing a crazy mismatch of data. There are domains and data sets which can really be a pain to model using relational databases, but I see those as edge cases. Schema-less is cool, but most of your data is going to be highly structured. It's true that having an occasional mismatch can be handy, especially when you introduce new features, but in reality it's nothing a nullable column probably wouldn't solve just as well.

For me, the real benefit of schema-less design is the lack of setup and the reduced friction with OOP. This is particularly true when you're working with a static language. I've worked with MongoDB in both C# and Ruby, and the difference is striking. Ruby's dynamism and its popular ActiveRecord implementations already reduce much of the object-relational impedance mismatch. That isn't to say MongoDB isn't a good match for Ruby, it really is. Rather, I think most Ruby developers would see MongoDB as an incremental improvement, whereas C# or Java developers would see a fundamental shift in how they interact with their data. 

Think about it from the perspective of a driver developer. You want to save an object? Serialize it to JSON (technically BSON, but close enough) and send it to MongoDB. There is no property mapping or type mapping. This straightforwardness definitely flows to you, the end developer.

### Writes ###
One area where MongoDB can fit a specialized role is in logging. There are two aspects of MongoDB which make writes quite fast. First, you can send a write command and have it return immediately without waiting for it to actually write. Secondly, with the introduction of journaling in 1.8, and enhancements made in 2.0, you can control the write behavior with respect to data durability. These settings, in addition to specifying how many servers should get your data before being considered successful, are configurable per-write, giving you a great level of control over write performance and data durability.

In addition to these performance factors, log data is one of those data sets which can often take advantage of schema-less collections. Finally, MongoDB has something called a [capped collection](http://www.mongodb.org/display/DOCS/Capped+Collections). So far, all of the implicitly created collections we've created are just normal collections. We can create a capped collection by using the `db.createCollection` command and flagging it as capped:

	//limit our capped collection to 1 megabyte
	db.createCollection('logs', {capped: true, size: 1048576})

When our capped collection reaches its 1MB limit, old documents are automatically purged. A limit on the number of documents, rather than the size, can be set using `max`. Capped collections have some interesting properties. For example, you can update a document but it can't grow in size. Also, the insertion order is preserved, so you don't need to add an extra index to get proper time-based sorting.

This is a good place to point out that if you want to know whether your write encountered any errors (as opposed to the default fire-and-forget), you simply issue a follow-up command: `db.getLastError()`. Most drivers encapsulate this as a *safe write*, say by specifying `{:safe => true}` as a second parameter to `insert`.

### Durability ###
Prior to version 1.8, MongoDB didn't have single-server durability. That is, a server crash would likely result in lost data. The solution had always been to run MongoDB in a multi-server setup (MongoDB supports replication). One of the major features added to 1.8 was journaling. To enable it add a new line with `journal=true` to the `mongodb.config` file we created when we first setup MongoDB (and restart your server if you want it enabled right away). You probably want journaling enabled (it'll be a default in a future release). Although, in some circumstances the extra throughput you get from disabling journaling might be a risk you are willing to take. (It's worth pointing out that some types of applications can easily afford to lose data).

Durability is only mentioned here because a lot has been made around MongoDB's lack of single-server durability. This'll likely show up in Google searches for some time to come. Information you find about this missing feature is simply out of date.

### Full Text Search ###
True full text search capability is something that'll hopefully come to MongoDB in a future release. With its support for arrays, basic full text search is pretty easy to implement. For something more powerful, you'll need to rely on a solution such as Lucene/Solr. Of course, this is also true of many relational databases.

### Transactions ###
MongoDB doesn't have transactions. It has two alternatives, one which is great but with limited use, and the other that is a cumbersome but flexible. 

The first is its many atomic operations. These are great, so long as they actually address your problem. We already saw some of the simpler ones, like `$inc` and `$set`. There are also commands like `findAndModify` which can update or delete a document and return it atomically.

The second, when atomic operations aren't enough, is to fall back to a two-phase commit. A two-phase commit is to transactions what manual dereferencing is to joins. It's a storage-agnostic solution that you do in code.  Two-phase commits are actually quite popular in the relational world as a way to implement transactions across multiple databases. The MongoDB website [has an example](http://www.mongodb.org/display/DOCS/two-phase+commit) illustrating the most common scenario (a transfer of funds). The general idea is that you store the state of the transaction within the actual document being updated and go through the init-pending-commit/rollback steps manually. 

MongoDB's support for nested documents and schema-less design makes two-phase commits slightly less painful, but it still isn't a great process, especially when you are just getting started with it. 

### Data Processing ###
MongoDB relies on MapReduce for most data processing jobs. It has some [basic aggregation](http://www.mongodb.org/display/DOCS/Aggregation) capabilities, but for anything serious, you'll want to use MapReduce. In the next chapter we'll look at MapReduce in detail. For now you can think of it as a very powerful and different way to `group by` (which is an understatement). One of MapReduce's strengths is that it can be parallelized for working with large sets of data. However, MongoDB's implementation relies on JavaScript which is single-threaded. The point? For processing of large data, you'll likely need to rely on something else, such as Hadoop. Thankfully, since the two systems really do complement each other, there's a [MongoDB adapter for Hadoop](https://github.com/mongodb/mongo-hadoop).

Of course, parallelizing data processing isn't something relational databases excel at either. There are plans for future versions of MongoDB to be better at handling very large sets of data.

### Geospatial ###
A particularly powerful feature of MongoDB is its support for geospatial indexes. This allows you to store x and y coordinates within documents and then find documents that are `$near` a set of coordinates or `$within` a box or circle. This is a feature best explained via some visual aids, so I invite you to try the [5 minute geospatial interactive tutorial](http://mongly.com/geo/index), if you want to learn more.

### Tools and Maturity ###
You probably already know the answer to this, but MongoDB is obviously younger than most relational database systems. This is absolutely something you should consider. How much a factor it plays depends on what you are doing and how you are doing it. Nevertheless, an honest assessment simply can't ignore the fact that MongoDB is younger and the available tooling around isn't great (although the tooling around a lot of very mature relational databases is pretty horrible too!). As an example, the lack of support for base-10 floating point numbers will obviously be a concern (though not necessarily a show-stopper) for systems dealing with money.

On the positive side, drivers exist for a great many languages, the protocol is modern and simple, and development is happening at blinding speeds. MongoDB is in production at enough companies that concerns about maturity, while valid, are quickly becoming a thing of the past.

### In This Chapter ###
The message from this chapter is that MongoDB, in most cases, can replace a relational database. It's much simpler and straightforward; it's faster and generally imposes fewer restrictions on application developers. The lack of transactions can be a legitimate and serious concern. However, when people ask *where does MongoDB sit with respect to the new data storage landscape?* the answer is simple: **right in the middle**.

\clearpage

## Chapter 6 - MapReduce ##
MapReduce is an approach to data processing which has two significant benefits over more traditional solutions. The first, and main, reason it was development is performance. In theory, MapReduce can be parallelized, allowing very large sets of data to be processed across many cores/CPUs/machines. As we just mentioned, this isn't something MongoDB is currently able to take advantage of. The second benefit of MapReduce is that you get to write real code to do your processing. Compared to what you'd be able to do with SQL, MapReduce code is infinitely richer and lets you push the envelope further before you need to use a more specialized solution.

MapReduce is a pattern that has grown in popularity, and you can make use of it almost anywhere; C#, Ruby, Java, Python and so on all have implementations. I want to warn you that at first this'll seem very different and complicated. Don't get frustrated, take your time and play with it yourself. This is worth understanding whether you are using MongoDB or not.

### A Mix of Theory and Practice ###
MapReduce is a two-step process. First you map and then you reduce. The mapping step transforms the inputted documents and emits a key=>value pair (the key and/or value can be complex). The reduce gets a key and the array of values emitted for that key and produces the final result. We'll look at each step, and the output of each step.

The example that we'll be using is to generate a report of the number of hits, per day, we get on a resource (say a webpage). This is the *hello world* of MapReduce. For our purposes, we'll rely on a `hits` collection with two fields: `resource` and `date`. Our desired output is a breakdown by `resource`, `year`, `month`, `day` and `count`. 

Given the following data in `hits`:

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

We'd expect the following output:

	resource  year   month   day   count
	index     2010   1       20    3
	about     2010   1       20    1
	about     2010   1       21    3
	index     2010   1       21    2
	index     2010   1       22    1

(The nice thing about this type of approach to analytics is that by storing the output, reports are fast to generate and data growth is controlled (per resource that we track, we'll add at most 1 document per day.)

For the time being, focus on understanding the concept. At the end of this chapter, sample data and code will be given for you to try on your own.

The first thing to do is look at the map function. The goal of map is to make it emit a value which can be reduced. It's possible for map to emit 0 or more times. In our case, it'll always emit once (which is common). Imagine map as looping through each document in hits. For each document we want to emit a key with resource, year, month and day, and a simple value of 1:

	function() {
		var key = {
		    resource: this.resource, 
		    year: this.date.getFullYear(), 
		    month: this.date.getMonth(), 
		    day: this.date.getDate()
		};
		emit(key, {count: 1}); 
	}

`this` refers to the current document being inspected. Hopefully what'll help make this clear for you is to see what the output of the mapping step is. Using our above data, the complete output would be:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'about', year: 2010, month: 0, day: 20} => [{count: 1}]
	{resource: 'about', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'index', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}]
	{resource: 'index', year: 2010, month: 0, day: 22} => [{count: 1}]

Understanding this intermediary step is the key to understanding MapReduce. The values from emit are grouped together, as arrays, by key. .NET and Java developers can think of it as being of type `IDictionary<object, IList<object>>` (.NET) or `HashMap<Object, ArrayList>` (Java).

Let's change our map function in some contrived way:

	function() {
		var key = {resource: this.resource, year: this.date.getFullYear(), month: this.date.getMonth(), day: this.date.getDate()};
		if (this.resource == 'index' && this.date.getHours() == 4) {
			emit(key, {count: 5});
		} else {
			emit(key, {count: 1}); 
		}
	}

The first intermediary output would change to:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 5}, {count: 1}, {count:1}]

Notice how each emit generates a new value which is grouped by our key.

The reduce function takes each of these intermediary results and outputs a final result. Here's what ours looks like:

	function(key, values) {
		var sum = 0;
		values.forEach(function(value) {
			sum += value['count'];
		});
		return {count: sum};
	};

Which would output:

	{resource: 'index', year: 2010, month: 0, day: 20} => {count: 3}
	{resource: 'about', year: 2010, month: 0, day: 20} => {count: 1}
	{resource: 'about', year: 2010, month: 0, day: 21} => {count: 3}
	{resource: 'index', year: 2010, month: 0, day: 21} => {count: 2}
	{resource: 'index', year: 2010, month: 0, day: 22} => {count: 1}

Technically, the output in MongoDB is:

	_id: {resource: 'home', year: 2010, month: 0, day: 20}, value: {count: 3}

Hopefully you've noticed that this is the final result we were after.

If you've really been paying attention, you might be asking yourself *why didn't we simply use `sum = values.length`?* This would seem like an efficient approach when you are essentially summing an array of 1s. The fact is that reduce isn't always called with a full and perfect set of intermediate data. For example, instead of being called with:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]

Reduce could be called with:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}]
	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 2}, {count: 1}]

The final output is the same (3), the path taken is simply different. As such, reduce must always be idempotent. That is, calling reduce multiple times should generate the same result as calling it once. 

We aren't going to cover it here but it's common to chain reduce methods when performing more complex analysis. 

### Pure Practical ###
With MongoDB we use the `mapReduce` command on a collection. `mapReduce` takes a map function, a reduce function and an output directive. In our shell we can create and pass a JavaScript function. From most libraries you supply a string of your functions (which is a bit ugly). First though, let's create our simple data set:

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

Now we can create our map and reduce functions (the MongoDB shell accepts multi-line statements, you'll see *...* after hitting enter to indicate more text is expected):

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

Which we can use the `mapReduce` command against our `hits` collection by doing:

	db.hits.mapReduce(map, reduce, {out: {inline:1}})

If you run the above, you should see the desired output. Setting `out` to `inline` means that the output from `mapReduce` is immediately streamed back to us. This is currently limited for results that are 16 megabytes or less. We could instead specify `{out: 'hit_stats'}` and have the results stored in the `hit_stats` collections:

	db.hits.mapReduce(map, reduce, {out: 'hit_stats'});
	db.hit_stats.find();

When you do this, any existing data in `hit_stats` is lost. If we did `{out: {merge: 'hit_stats'}}` existing keys would be replaced with the new values and new keys would be inserted as new documents. Finally, we can `out` using a `reduce` function to handle more advanced cases (such an doing an upsert). 

The third parameter takes additional options, for example we could filter, sort and limit the documents that we want analyzed. We can also supply a `finalize` method to be applied to the results after the `reduce` step.

### In This Chapter ###
This is the first chapter where we covered something truly different. If it made you uncomfortable, remember that you can always use MongoDB's other [aggregation capabilities](http://www.mongodb.org/display/DOCS/Aggregation) for simpler scenarios. Ultimately though, MapReduce is one of MongoDB's most compelling features. The key to really understanding how to write your map and reduce functions is to visualize and understand the way your intermediary data will look coming out of `map` and heading into `reduce`.

\clearpage

## Chapter 7 - Performance and Tools ##
In this last chapter, we look at a few performance topics as well as some of the tools available to MongoDB developers. We won't dive deeply into either topic, but we will examine the most import aspects of each.

### Indexes ###
At the very beginning we saw the special `system.indexes` collection which contains information on all the indexes in our database. Indexes in MongoDB work a lot like indexes in a relational database: they help improve query and sorting performance. Indexes are created via `ensureIndex`:

	db.unicorns.ensureIndex({name: 1});

And dropped via `dropIndex`:

	db.unicorns.dropIndex({name: 1});

A unique index can be created by supplying a second parameter and setting `unique` to `true`:

	db.unicorns.ensureIndex({name: 1}, {unique: true});

Indexes can be created on embedded fields (again, using the dot-notation) and on array fields. We can also create compound indexes:

	db.unicorns.ensureIndex({name: 1, vampires: -1});

The order of your index (1 for ascending, -1 for descending) doesn't matter for a single key index, but it can have an impact for compound indexes when you are sorting or using a range condition.

The [indexes page](http://www.mongodb.org/display/DOCS/Indexes) has additional information on indexes.

### Explain ###
To see whether or not your queries are using an index, you can use the `explain` method on a cursor:

	db.unicorns.find().explain()

The output tells us that a `BasicCursor` was used (which means non-indexed), 12 objects were scanned, how long it took, what index, if any was used as well as a few other pieces of useful information.

If we change our query to use an index, we'll see that a `BtreeCursor` was used, as well as the index used to fulfill the request:

	db.unicorns.find({name: 'Pilot'}).explain()

### Fire And Forget Writes ###
We previously mentioned that, by default, writes in MongoDB are fire-and-forget. This can result in some nice performance gains at the risk of losing data during a crash. An interesting side effect of this type of write is that an error is not returned when an insert/update violates a unique constraint. In order to be notified about a failed write, one must call `db.getLastError()` after an insert. Many drivers abstract this detail away and provide a way to do a *safe* write - often via an extra parameter.

Unfortunately, the shell automatically does safe inserts, so we can't easily see this behavior in action.

### Sharding ###
MongoDB supports auto-sharding. Sharding is an approach to scalability which separates your data across multiple servers. A naive implementation might put all of the data for users with a name that starts with A-M on server 1 and the rest on server 2. Thankfully, MongoDB's sharding capabilities far exceed such a simple algorithm. Sharding is a topic well beyond the scope of this book, but you should know that it exists and that you should consider it should your needs grow beyond a single server.

### Replication ###
MongoDB replication works similarly to how relational database replication works. Writes are sent to a single server, the master, which then synchronizes itself to one or more other servers, the slaves. You can control whether reads can happen on slaves or not, which can help distribute your load at the risk of reading slightly stale data. If the master goes down, a slave can be promoted to act as the new master. Again, MongoDB replication is outside the scope of this book.

 While replication can improve performance (by distributing reads), its main purpose is to increase reliability. Combining replication with sharding is a common approach. For example, each shard could be made up of a master and a slave. (Technically you'll also need an arbiter to help break a tie should two slaves try to become masters. But an arbiter requires very few resources and can be used for multiple shards.)

### Stats ###
You can obtain statistics on a database by typing `db.stats()`. Most of the information deals with the size of your database. You can also get statistics on a collection, say `unicorns`, by typing `db.unicorns.stats()`. Again, most of this information relates to the size of your collection.

### Web Interface ###
Included in the information displayed on MongoDB's startup was a link to a web-based administrative tool (you might still be able to see if if you scroll your command/terminal window up to the point where you started `mongod`). You can access this by pointing your browser to <http://localhost:28017/>. To get the most out of it, you'll want to add `rest=true` to your config and restart the `mongod` process. The web interface gives you a lot of insight into the current state of your server.

### Profiler ###
You can enable the MongoDB profiler by executing:

	db.setProfilingLevel(2);

With it enabled, we can run a command:

	db.unicorns.find({weight: {$gt: 600}});

And then examine the profiler:

	db.system.profile.find()

The output tells us what was run and when, how many documents were scanned, and how much data was returned.

You can disable the profiler by calling `setProfileLevel` again but changing the argument to `0`. Another option is to specify `1` which will only profile queries that take more than 100 milliseconds. Or, you can specify the minimum time, in milliseconds, with a second parameter:

	//profile anything that takes more than 1 second
	db.setProfilingLevel(1, 1000);

### Backups and Restore ###
Within the MongoDB `bin` folder is a `mongodump` executable. Simply executing `mongodump` will connect to localhost and backup all of your databases to a `dump` subfolder. You can type `mongodump --help` to see additional options. Common options are `--db DBNAME` to back up a specific database and `--collection COLLECTIONAME` to back up a specific collection. You can then use the `mongorestore` executable, located in the same `bin` folder, to restore a previously made backup. Again, the `--db` and `--collection` can be specified to restore a specific database and/or collection. 

For example, to back up our `learn` collection to a `backup` folder, we'd execute (this is its own executable which you run in a command/terminal window, not within the mongo shell itself):

	mongodump --db learn --out backup

To restore only the `unicorns` collection, we could then do:

	mongorestore --collection unicorns backup/learn/unicorns.bson

It's worth pointing out that `mongoexport` and `mongoimport` are two other executables which can be used to export and import data from JSON or CSV. For example, we can get a JSON output by doing:

	mongoexport --db learn -collection unicorns

And a CSV output by doing:

	mongoexport --db learn -collection unicorns --csv -fields name,weight,vampires

Note that `mongoexport` and `mongoimport` cannot always represent your data. Only `mongodump` and `mongorestore` should ever be used for actual backups.

### In This Chapter ###
In this chapter we looked a various commands, tools and performance details of using MongoDB. We haven't touched on everything, but we've looked at the most common ones. Indexing in MongoDB is similar to indexing with relational databases, as are many of the tools. However, with MongoDB, many of these are to the point and simple to use.

\clearpage

## Conclusion ##
You should have enough information to start using MongoDB in a real project. There's more to MongoDB than what we've covered, but your next priority should be putting together what we've learned, and getting familiar with the driver you'll be using. The [MongoDB website](http://www.mongodb.com/) has a lot of useful information. The official [MongoDB user group](http://groups.google.com/group/mongodb-user) is a great place to ask questions.

NoSQL was born not only out of necessity, but also out of an interest to try new approaches. It is an acknowledgement that our field is ever advancing and that if we don't try, and sometimes fail, we can never succeed. This, I think, is a good way to lead our professional lives.
