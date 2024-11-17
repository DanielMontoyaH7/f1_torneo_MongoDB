#!/bin/bash

DB_NAME="f1_torneo"

# Importar colecciones
mongoimport --db $DB_NAME --collection pilotos --file colecciones/pilotos.json --jsonArray
mongoimport --db $DB_NAME --collection escuderias --file colecciones/escuderias.json --jsonArray
mongoimport --db $DB_NAME --collection premios --file colecciones/premios.json --jsonArray
mongoimport --db $DB_NAME --collection resultados --file colecciones/resultados.json --jsonArray
mongoimport --db $DB_NAME --collection tabla_posiciones --file colecciones/tabla_posiciones.json --jsonArray

echo "Importación completada."
