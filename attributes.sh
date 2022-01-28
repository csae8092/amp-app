# bin/bash

echo "add attributes"
add-attributes -g "./data/editions/correspondence/*.xml" -b "https://auden-musulin-papers.github.io/amp-app"
add-attributes -g "./data/editions/additional-materials/*.xml" -b "https://auden-musulin-papers.github.io/amp-app"
add-attributes -g "./data/editions/photos/*.xml" -b "https://auden-musulin-papers.github.io/amp-app"
