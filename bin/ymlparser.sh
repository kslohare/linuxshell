#!/bin/bash

set -e

YML_FILE="../resource/sl.yml"

if [ ! -f "$YML_FILE" ]; then
    echo "ERROR: $YML_FILE not found"
    exit 1
fi

echo "=============================="
echo " YAML Configuration"
echo "=============================="

echo "Application : $(yq -r '.app.name' "$YML_FILE")"
echo "Version     : $(yq -r '.app.version' "$YML_FILE")"

echo
echo "Company:"
echo "  Name      : $(yq -r '.app.company.name' "$YML_FILE")"
echo "  Country   : $(yq -r '.app.company.country' "$YML_FILE")"

echo
echo "Features:"
echo "  Collateral Management : $(yq -r '.app.features."collateral-management"' "$YML_FILE")"
echo "  Margin Call           : $(yq -r '.app.features."margin-call"' "$YML_FILE")"

echo
echo "Supported Currencies:"

yq -r '.app."supported-currencies"[]' "$YML_FILE" |
while read -r currency
do
    echo "  - $currency"
done