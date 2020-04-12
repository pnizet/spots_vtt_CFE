#!/bin/sh

## Script pour corriger les commits qui viennent de geojson.io et qui ont la mauvais idée de mettre les champs _storage_options et _umap_options en ligne (ex : "_storage_options": "{\"color\":\"Blue\",\"opacity\":\"1\"}" ) ce qui a pour conséquence que les couleurs des pistes ne sont plus prises en compte dans l'affichage de la carte

cat spots.json \
    | sed -e 's/_storage_options": "{\\"color\\":\\"\([a-zA-Z]*\)\\",\\"opacity\\":\\"\([0-9]\)\\"}\"/_storage_options": {\n          "color": "\1",\n          "opacity": "\2"\n        }/gi' \
    | sed -e 's/_umap_options": "{\\"color\\":\\"\([a-zA-Z]*\)\\",\\"opacity\\":\\"\([0-9]\)\\"}\"/_umap_options": {\n          "color": "\1",\n          "opacity": "\2"\n        }/gi' \
    > ./spots_sed.json
mv spots_sed.json spots.json

