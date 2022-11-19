const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const rampaSchema = new Schema({
  direccion: { type: String },
  latitud: { type: Number },
  longitud: { type: Number },
});

module.exports = mongoose.model("rampa", rampaSchema);
