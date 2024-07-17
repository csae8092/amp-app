# bin/bash

rm main.zip
rm -rf amp-entities-main
wget https://github.com/Auden-Musulin-Papers/amp-entities/archive/refs/heads/main.zip
unzip main
mkdir ./data/indices
mv amp-entities-main/out/*.xml ./data/indices
mv amp-entities-main/out/*.geojson ./data/indices
mv amp-entities-main/json_dumps/person_person.json ./html/js/json/analytics/relationships.json
rm -rf amp-entities-main
rm main.zip
