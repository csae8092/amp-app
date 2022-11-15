# bin/bash

rm main.zip
rm -rf amp-entities-main
wget https://github.com/Auden-Musulin-Papers/amp-entities/archive/refs/heads/main.zip
unzip main
mkdir ./data/indices
mv amp-entities-main/out/*.xml ./data/indices
rm -rf amp-entities-main
rm main.zip
