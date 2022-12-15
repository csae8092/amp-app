# bin/bash

# rm main.zip
# rm -rf ./data
# wget https://github.com/Auden-Musulin-Papers/amp-data/archive/refs/heads/main.zip
# unzip main
# mv amp-data-main/data ./data
# rm -rf amp-data-main
# rm main.zip

# rm -rf ./data/tmp

rm entities.zip
rm -rf ./data
wget https://github.com/Auden-Musulin-Papers/amp-data/archive/refs/heads/entities.zip
unzip entities
mv amp-data-entities/data ./data
rm -rf amp-data-entities
rm entities.zip

rm -rf ./data/tmp