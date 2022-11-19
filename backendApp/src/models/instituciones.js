const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const instSchema = new Schema({
  nombre: { type: String },
  direccion: { type: String },
  baño_disc: { type: Boolean },
  tipo: { type: String },
  latitud: { type: Number },
  longitud: { type: Number },
});

module.exports = mongoose.model("institucion", instSchema);
