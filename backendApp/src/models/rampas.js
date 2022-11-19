const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const rampaSchema = new Schema({
  direccion: { type: String, required: true },
  latitud: { type: Number, required: true },
  longitud: { type: Number, required: true },
});

module.exports = mongoose.model("rampa", rampaSchema);
