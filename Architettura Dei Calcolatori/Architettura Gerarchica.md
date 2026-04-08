---
id: Architettura Gerarchica
aliases: []
tags: []
---

Parlando di sistemi [[Compiti dei sistemi|general purpose]], possiamo rappresentare la loro architettura come una *gerarchia*, che va dal compito **generale**, posto più in alto, a quello più **specifico**, posto in basso.
Per fare questo è necessario analizzare il sistema *dall'alto al basso* (top-down), dividendo opportunamente in **sottosistemi**, finchè non raggiungiamo un punto in cui *tutto il sistema* viene composto da *blocchi* **elementari**, ovviamente in riguardo al *livello di interesse* della mia specifica analisi.

Per esempio, potrei scomporre il mio sistema $S$ nei *sottosistemi* $A, B, C,D$. Immaginiamo che $A,B,D$ siano considerati *blocchi elementari*, quindi non posso ulteriormente scomporli.
Invece, $C$ non è un blocco elementare, quindi posso *ulteriormente scomporlo* nei blocchi $E,F$, che in questa ipotesi possiamo considerare elementari.

In questo modo ho ottenuto un **grafico gerarchico**, in cui il sistema general purpose $S$, viene scomposto in blocchi elementari, in questo modo:
```
┌───┐                                         
│ S │                        General purpose  
└─┬─┘                                         
  │                                           
  ├──────┬──────┬──────┐ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
  │      │      │      │                      
  │      │      │      │                      
┌─▼─┐  ┌─▼─┐  ┌─▼─┐  ┌─▼─┐                    
│ A │  │ B │  │ C │  │ D │   Special purpose  
└───┘  └───┘  └─┬─┘  └───┘                    
                │                             
  ┌──────┬──────┘                             
  │      │                                    
  │      │                                    
┌─▼─┐  ┌─▼─┐                                  
│ E │  │ F │                                  
└───┘  └───┘                                  
```

In linea generale, qualsiasi sistema può essere formato *sia* da componenti **specificamente realizzati** per svolgere la funzione del sistema, *sia* da componenti [[Sistemi basati su componenti programmabili|programmabili]].
Ovviamente quando progetto un sistema, devo tener conto di tutti i fattori che portano queste scelte.

