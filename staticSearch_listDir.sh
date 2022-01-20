# bin/bash

echo "create file filenames_auden.txt"
touch "html/static-search/filenames_auden.txt"
echo "opend dir html/static-search/stems"
for file in html/static-search/stems/*; do
    echo $file >> "html/static-search/filenames_auden.txt"
done
echo "filenames_auden.txt in html/static-search created"