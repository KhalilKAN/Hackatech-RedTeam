const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const sendasSchema = new Schema({
  calle: { type: String, required: true },
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

module.exports = mongoose.model("sendas", sendasSchema);
