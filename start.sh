DIR=`dirname $0`

API_KEY=`cat $DIR/api_key.txt`
API_KEY_QUERY="apiKey=$API_KEY"

BASE_URL="https://newsapi.org/v2"
ARTICLES_URL="$BASE_URL/top-headlines?$API_KEY_QUERY&coutry=fr&sources=le-monde"


