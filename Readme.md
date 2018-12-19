Tâche CRON de News
==================

1.Objectifs
-----------

Création d'un script qui fait appelle l'API [NewsApi](https://newsapi.org). Cette API retourne des articles venant de différentes sources.

Le but serait d'appeler ce script afin d'alimenter un serveur web en articles.

2.Dépendances
-------------

Afin de parser le JSON retourné par l'API, j'ai utilisé la libraire [JQ](https://stedolan.github.io/jq/).

Installastion sur Mac OS:

    brew install jq

4.Doc
-----

Si on lance le script sans paramètres, les fichiers qui seront créés se placeront dans le dossier www dans le même répertoire que le script. Cependant si un chemin est passé en paramètre, les fichiers se plceront dans celui-ci.

Les fichiers son créés uniquement si il n'existe déjà pas ; ainsi, le script ne va pas recréer inutilement les fichiers.

3.Amélioration possible
-----------------------

Pour améliorer ce projet, nous pourrions créer une tâche CRON qui execute ce script toutes les X minutes.

Exemple de tâche CRON qui lance le script toutes les 60 minutes :

    60 * * * * sh ~/Scripts/final-project/start.sh
