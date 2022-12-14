const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const obrasSchema = new Schema({
  calle: { type: String, required: true },
  tipo_obra: { type: String, required: true }, //Bacheo, Pavimento, Evento, Accidente
  //dos puntos de latitud y longitud
  punto1: {
    latitud: { type: Number, required: true },
    longitud: { type: Number, required: true },
  },
  punto2: {
    latitud: { type: Number, required: true },
    longitud: { type: Number, required: true },
  },
});

module.exports = mongoose.model("obras", obrasSchema);
