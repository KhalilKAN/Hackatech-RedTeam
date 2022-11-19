const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const sendasSchema = new Schema({
  calle: { type: String },
  //dos puntos de latitud y longitud
  punto1: {
    latitud: { type: Number },
    longitud: { type: Number },
  },
  punto2: {
    latitud: { type: Number },
    longitud: { type: Number },
  },
});

module.exports = mongoose.model("sendas", sendasSchema);
