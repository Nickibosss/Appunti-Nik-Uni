# Appunti-Nik-Uni
Gli appunti del corso di Ingegneria Informatica di Nicola Pascale (federico II napoli).
Vi prego di non mandare questo repo a chiunque (per richiedere accesso fatemi sapere grazie).

## Come funziona sta cosa?
Ho organizzato gli appunti in cartelle. All'interno di ogni cartella ho tutti i file markdown degli appunti che scrivo. Per visualizzarlo basta che lo clicchi e si dovrebbe aprire il viewer di github.

## Sono aggiornati questi appunti?
Si, li aggiorno lezione per lezione.

## Come fare a vedere bene gli appunti
Gli appunti sono stati scritti usando [Obsidian](https://www.obsidian.md). Nulla vi ferma da **Clonare il repo** nel vault di obsidian per visualizzarlo bene (link tra appunti, formatting "migliore").

Basta scaricare Obsidian e creare un [vault](https://docs.obsidian.md/Plugins/Vault) sul sistema di file del tuo dispositivo. A questo punto scarica i file del repository e mettili nella cartella vault che hai creato.
Puoi usare [Git](https://github.com/git) per copiare tutto e aggiornarlo periodicamente senza visitare la pagina di github.
#### Windows (git)
Installa git dal *sito* oppure usando *winget*:
- Dentro a poweshell (o cmd):
```
winget install --id Git.Git -e --source winget
```
E aspetta che completa l'istallazione.

Crea una nuova cartella nel vault e inserisci questi comandi su powershell(o cmd):
```
cd <percorso cartella>
git clone https://github.com/Nickibosss/Appunti-Nik-Uni.git
```
Sostituisci `<percorso cartella>` con il percorso della cartella dove hai inserito il vault, ad esempio `C:\User\Nicola\Documents\Vault`.

A questo punto puoi chiudere poweshell, e dovresti poter visualizzare tutti i file una volta aperto obsidian.

#### Linux/MacOS (git)
Linux e MacOS dovrebbero avere git già installato.

Crea una nuova cartella nel vault e inserisci questi comandi sul terminal:
```
cd <percorso cartella>
git clone https://github.com/Nickibosss/Appunti-Nik-Uni.git
```
Sostituisci `<percorso cartella>` con il percorso della cartella che hai creato.

A questo punto puoi chiudere il terminal, e dovresti poter visualizzare tutti i file una volta aperto obsidian.
### Aggiorna file
Se hai usato git basta inserire nella console questi comandi:
```
cd <percorso in cui hai scaricato i file>
git pull
```
Sostituisci `<percorso in cui hai scaricato i file>` con il percorso della cartella in cui hai usato `git clone`.

## !!ATTENZIONE!!
Non è necessario usare **git**, basta scaricare i file e inserirli nella cartella del vault. (Però è comodo se vuoi aggiornamenti rispetto a quando li pubblico).