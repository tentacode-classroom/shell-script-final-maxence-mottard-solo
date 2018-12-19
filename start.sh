#!/bin/bash
DIR=`dirname $0`

API_KEY=`cat $DIR/api_key.txt`

BASE_URL="https://newsapi.org/v2"
ARTICLES_URL="$BASE_URL/top-headlines?apiKey=$API_KEY&coutry=fr&sources=le-monde"

RESPONSE=`curl $ARTICLES_URL`

STATUS=`echo $RESPONSE | jq '.status' | sed s/\"//g`

if [ $STATUS = "error" ]
then
	echo "ERROR"
	exit 1
fi

NB_ARTICLES=`echo $RESPONSE | jq '.totalResults'`
ARTICLES=`echo $RESPONSE | jq '.articles'`

((NB_ARTICLES--))

for NUMBER in `seq 0 $NB_ARTICLES`
do
	ARTICLE=`echo $ARTICLES | jq ". [$NUMBER]"`

	TITLE=`echo $ARTICLE | jq '.title' | sed s/\"//g`
	SLUG=`echo $TITLE | sed s/[^A-Za-z0-9]/-/g`
	CONTENT=`echo $ARTICLE | jq '.content' | sed s/\"//g`

	TEMPLATE=`cat $DIR/template.html`

	TEMPLATE=`echo $TEMPLATE | sed "s/#TITLE/$TITLE/g"`
	#TEMPLATE=`echo $TEMPLATE | sed "s/#CONTENT/$CONTENT/g"`
	echo $TEMPLATE > $DIR/www/$SLUG.html
done
