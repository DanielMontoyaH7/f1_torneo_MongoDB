# Operaciones CRUD en la Base de Datos del Torneo

Este documento describe ejemplos de operaciones CRUD realizadas sobre las colecciones del torneo deportivo en MongoDB.

## 1. Crear (Create)
### a. Insertar un nuevo piloto en la colección `deportistas`:

db.deportistas.insertOne({
  "nombre": "Fernando Alonso",
  "escuderia": "Aston Martin",
  "nacionalidad": "Spain",
  "puntos": 1950
});

### b. Insertar varios resultados en la colección `resultados`:
db.resultados.insertMany([
  {
    "carrera": "GP de Brasil",
    "fecha": "2024-11-05",
    "posiciones": [
      { "nombre": "Max Verstappen", "posicion": 1 },
      { "nombre": "Lewis Hamilton", "posicion": 2 },
      { "nombre": "Fernando Alonso", "posicion": 3 }
    ]
  },
  {
    "carrera": "GP de México",
    "fecha": "2024-10-29",
    "posiciones": [
      { "nombre": "Sergio Pérez", "posicion": 1 },
      { "nombre": "Max Verstappen", "posicion": 2 },
      { "nombre": "Charles Leclerc", "posicion": 3 }
    ]
  }
]);

## 2. Leer (Read)
### a. Consultar todos los deportistas:
db.deportistas.find();

### b. Buscar un deportista específico:
db.deportistas.find({ "nombre": "Fernando Alonso" });

### c. Consultar todos los resultados de una carrera específica:
db.resultados.find({ "carrera": "GP de Brasil" });

### d. Tabla de posiciones por puntaje
db.tabla_de_posiciones.find().sort({ "puntos": -1 });

## 3. Actualizar (Update)
### a. Actualizar el puntaje de un deportista en la colección deportistas:
db.deportistas.updateOne(
  { "nombre": "Fernando Alonso" },
  { $set: { "puntos": 2000 } }
);

### b. Agregar un nuevo piloto a la lista de posiciones de una carrera en la colección resultados:
db.resultados.updateOne(
  { "carrera": "GP de Brasil" },
  { $push: { "posiciones": { "nombre": "Lando Norris", "posicion": 4 } } }
);

## 4. Eliminar (Delete)
a. Eliminar un deportista de la colección deportistas:
db.deportistas.deleteOne({ "nombre": "Piloto Retirado" });

b. Eliminar una carrera de la colección resultados:
db.resultados.deleteOne({ "carrera": "GP de México" });


