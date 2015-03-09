#!/bin/bash

weather=$(/home/nicolai/.i3/scripts/weather.sh "EUR|DK|DAXX0009|Copenhagen" | sed 's/C/°C/')

if [ "$weather" = "" ]
then echo "No info available"
else
	echo "$weather"
fi
