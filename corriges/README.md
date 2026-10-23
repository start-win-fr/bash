# Corrigés · Algorithmique en bash

Les corrections commentées de tous les exercices de la semaine (19 au 23 octobre 2026). Chaque script commence par un en-tête qui rappelle l'exercice et la façon de le lancer, puis les lignes importantes sont expliquées en commentaire.

Un conseil : faites l'exercice **avant** d'ouvrir le corrigé. Si vous bloquez, lisez seulement l'en-tête et les premiers commentaires, puis refermez et réessayez.

## Lancer un corrigé

```bash
cd corriges/lundi
bash L07_premier.sh 97
```

Avec `bash script.sh`, pas besoin de `chmod +x`. C'est plus simple après un `git clone` depuis Windows, qui ne garde pas toujours le droit d'exécution.

## Lundi · conditions, boucles, tableaux

| Fichier | Exercice | Exemple |
|---|---|---|
| `L01_pair.sh` | Pair ou impair | `bash L01_pair.sh 7` |
| `L02_max3.sh` | Le plus grand des trois | `bash L02_max3.sh -3 -8 -1` |
| `L03_table.sh` | Table de multiplication | `bash L03_table.sh 7` |
| `L04_bissextile.sh` | Année bissextile | `bash L04_bissextile.sh 1900` |
| `L05_somme_fact.sh` | Somme et factorielle | `bash L05_somme_fact.sh 21` |
| `L06_fizzbuzz.sh` | FizzBuzz | `bash L06_fizzbuzz.sh 15` |
| `L07_premier.sh` | Nombre premier | `bash L07_premier.sh 7919` |
| `L08_triangle.sh`, `L08_sapin.sh` | Triangle et sapin | `bash L08_sapin.sh 4` |
| `L09_occurrences.sh` | Compter les occurrences | `bash L09_occurrences.sh 3 1 3 5 3 7 3` |
| `L10_second.sh` | Le deuxième plus grand | `bash L10_second.sh 14 3 27 8 27 1` |
| `L11_devinette.sh` | Le juste prix | `bash L11_devinette.sh` |

## Mardi · fonctions, chaînes, fichiers

| Fichier | Exercice | Exemple |
|---|---|---|
| `moyenne.sh` | La moyenne des notes (avec les 3 bonus) | `bash moyenne.sh` |
| `palindrome.sh` | Le palindrome (avec le bonus du compteur) | `bash palindrome.sh kayak bash 'Esope reste ici et se repose'` |
| `M01_max.sh` | max2 et max3 | `bash M01_max.sh` |
| `M02_moyenne_args.sh` | Moyenne avec les notes en arguments | `bash M02_moyenne_args.sh 12 8 15 10 17 9` |
| `M03_inverser.sh` | Inverser une chaîne | `bash M03_inverser.sh bonjour` |
| `M04_palindrome_indices.sh` | Palindrome avec deux indices | `bash M04_palindrome_indices.sh kayak bash` |
| `M05_pgcd.sh` | PGCD d'Euclide | `bash M05_pgcd.sh 84 36` |
| `M06_binaire.sh` | Décimal vers binaire | `bash M06_binaire.sh 13` |
| `M07_doublons.sh` | Supprimer les doublons | `bash M07_doublons.sh 4 2 4 7 2 9 4` |
| `M08_shells.sh` | Qui utilise quel shell ? | `bash M08_shells.sh passwd_exemple.txt` |
| `M09_top3.sh` | Les trois plus gros fichiers | `bash M09_top3.sh /var/log` |

## Mercredi · TP du pendu

Les corrigés étape par étape sont dans le dossier `TP/` (`tp_etape1.sh` à `tp_etape5.sh`). Ici, vous trouverez la version complète avec tous les bonus : saisies invalides refusées, lettres déjà jouées, fonction `masque` et dessin du pendu.

```bash
bash mercredi-tp/pendu_complet.sh
```

## Jeudi

Les quatre exercices de la feuille du jeudi :

| Fichier | Exercice | Exemple |
|---|---|---|
| `1_meteo.sh` | La météo de la semaine (avec le bonus du jour le plus chaud) | `bash 1_meteo.sh` |
| `2_lettres.sh` | Compter une lettre (avec le bonus des voyelles) | `bash 2_lettres.sh banane a` |
| `3_admis.sh`, `3_mentions.sh` | Admis ou recalé, puis les mentions | `bash 3_admis.sh` |
| `4_liste.sh`, `4_presents.sh` | Chercher un prénom, puis la fonction `est_present` | `bash 4_liste.sh chloe` |

Le dossier `jeudi/support/` contient les exercices J1 à J8 du support de cours : complexité, recherche dichotomique et tris (bulles, sélection, insertion, fusion de deux listes).

## Vendredi

Les huit exercices de la feuille du vendredi, du plus simple au plus dur :

| Fichier | Exercice | Exemple |
|---|---|---|
| `1_rebours.sh` | Compte à rebours | `bash 1_rebours.sh 5` |
| `2_pairs.sh` | Pair ou impair | `bash 2_pairs.sh` |
| `3_somme.sh` | Somme de 1 à n | `bash 3_somme.sh 100` |
| `4_plus_long.sh` | Le mot le plus long | `bash 4_plus_long.sh` |
| `5_mdp.sh` | Mot de passe valide ? | `bash 5_mdp.sh 'Mot@passe1'` |
| `6_envers.sh` | Le tableau à l'envers | `bash 6_envers.sh` |
| `7_cesar.sh` | Le chiffrement de César | `bash 7_cesar.sh bonjour 3` |
| `8_bulles.sh` | Le tri à bulles (avec l'arrêt anticipé) | `bash 8_bulles.sh` |

Le dossier `vendredi/support/` contient les exercices V1 à V8 du support de cours : récursivité, tours de Hanoï, piles, crible d'Ératosthène, calculatrice polonaise inverse et tri fusion.
