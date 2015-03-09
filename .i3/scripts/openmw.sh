#!/bin/bash
#while :; do
echo $(ruby /home/nicolai/.i3/scripts/openmw.rb) > /tmp/mw.txt

openmw=$(cat /tmp/mw.txt | awk '{ print $1 " " $2 " "w $3 }')
versionNumeric=$(cat /tmp/mw.txt | awk '{ print $3 }' | tr -d '(%)')

if [ "$openmw" = "" ];
#then echo "OpenMW.org down"
then printf '{"full_text":"OpenMW.org down", "border":"#bc1d00"}\n'

elif [ "$versionNumeric" -ge "90" ]
then printf '{"full_text":"%s", "border":"00bc0d"}\n' "$openmw"

else
	printf '{"full_text":"%s"}\n' "$openmw"
fi;
#sleep 1;
#done
