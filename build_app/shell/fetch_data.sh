# bin/bash

rm dev05.zip
rm -rf ./data
wget https://github.com/Auden-Musulin-Papers/amp-data/archive/refs/heads/dev05.zip
unzip dev05
mv amp-data-dev05/data ./data
rm -rf amp-data-dev05
rm dev05.zip

rm -rf ./data/tmp