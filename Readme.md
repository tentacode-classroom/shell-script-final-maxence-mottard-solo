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

3.Amélioration possible
-----------------------

Pour améliorer ce projet, nous pourrions créer une tâche CRON qui execute ce script toutes les X minutes.

Exemple de tâche CRON qui lance le script toutes les 60 minutes :

    60 * * * * sh ~/Scripts/final-project/start.sh
