#!/bin/bash

source ~/r/my-recipes/linux/bin/topsecret/ado-azure.properties
AZURE_URL="https://dev.azure.com/$AZURE_ORGANIZATION/$AZURE_PROJECT/_apis/wit/workItems/\$Task?api-version=7.1"

SUMMARY="$1"
DESCRIPTION="$2"

PAYLOAD=$(cat <<EOF
[
    {
        "op": "add",
        "path": "/fields/System.AreaPath",
        "value": "$AZURE_AREAPATH"
    },
    {
        "op": "add",
        "path": "/fields/System.IterationPath",
        "value": "$AZURE_ITERATIONPATH"
    },
    {
        "op": "add",
        "path": "/fields/System.Title",
        "value": "##SUMMARY##"
    },
    {
        "op": "add",
        "path": "/fields/System.Description",
        "value": "##DESCRIPTION##"
    }
]
EOF
)

PAYLOAD=$(echo "$PAYLOAD" | sed -e "s/##SUMMARY##/$SUMMARY/g" -e "s/##DESCRIPTION##/$DESCRIPTION/g")

curl -X PATCH -H "Authorization: Basic $AZURE_PAT" \
-H "Content-Type: application/json-patch+json" \
"$AZURE_URL" \
--data "$PAYLOAD" | jq
