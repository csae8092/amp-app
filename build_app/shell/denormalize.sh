# bin/bash

denormalize-indices -f "./data/editions/*/*.xml" -i "./data/indices/*.xml" -m ".//tei:rs[@ref]/@ref|//tei:quote[@source]/@source|.//tei:bibl[@sameAs]/@sameAs" -x ".//tei:title[@level='a']/text()"