# bin/bash

echo "add attributes"
add-attributes -g "./data/editions/correspondence/*.xml" -b "https://amp.acdh.oeaw.ac.at"
add-attributes -g "./data/editions/photos/*.xml" -b "https://amp.acdh.oeaw.ac.at"
