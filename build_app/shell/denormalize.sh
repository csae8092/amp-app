# bin/bash

denormalize-indices -f "./data/editions/*/*.xml" -i "./data/indices/*.xml" -m ".//tei:rs[@ref]/@ref" -x ".//tei:title[@level='a']/text()" -xs ".//tei:author/text()" -d ".//tei:origDate/@notBefore"