#!/bin/bash

while :; do

temp=$(sensors coretemp-isa-0000 | awk '/Physical/ { print $4 }' | tr -d '+')
tempNumeric=$(sensors coretemp-isa-0000 | awk '/Physical/ { print $4 }' | tr -d '+' | tr -d '.0°C' )
fanSpeed=$(sensors | awk '/fan1/ { print " (" $2 " " $3 ")" }')

if [ "$tempNumeric" -gt "55" ]
then printf '{"full_text":"%s %s", "border":"#bc1d00"}\n' "$temp" "$fanSpeed";
else printf '{"full_text":"%s %s"}\n' "$temp" "$fanSpeed"
fi;
sleep 1;
done
