# bin/bash

echo "add attributes"
add-attributes -g "./data/editions/correspondence/*.xml" -b "https://amp.acdh.oeaw.ac.at"
add-attributes -g "./data/editions/photos/*.xml" -b "https://amp.acdh.oeaw.ac.at"
# add-attributes -g "./data/editions/memoirs/*.xml" -b "https://amp.acdh.oeaw.ac.at"
# add-attributes -g "./data/editions/additional-materials/*.xml" -b "https://amp.acdh.oeaw.ac.at"
