import express from "express";
import instituciones from "../models/instituciones";
import obras from "../models/obras";
import rampa from "../models/rampas";
import sendas from "../models/rampas";

//Obtener puntos

export const getPoints = async (req, res) => {
  //del parametro obtengo la tabla de la que quiero obtener los datos
  const table = req.query.cat; // por ejemplo: table = "instituciones"
  const filter = req.query.filter; // por ejemplo: filter = "nombre"

  //obtengo los datos de la tabla
  if (table == "instituciones") {
    const data = await instituciones.find({ tipo: filter });
    res.json(data);
  }
  if (table == "obras") {
    const data = await obras.find();
    res.json(data);
  }
  if (table == "rampa") {
    const data = await rampa.find();
    res.json(data);
  }
  if (table == "sendas") {
    const data = await sendas.find();
    res.json(data);
  }
};

//cargar instituciones
export const postInstituciones = async (req, res) => {
  const { nombre, direccion, baño_disc, tipo, latitud, longitud } = req.body;
  const newInstitucion = new instituciones({
    nombre,
    direccion,
    baño_disc,
    tipo,
    latitud,
    longitud,
  });
  await newInstitucion.save();
  res.send(newInstitucion);
};

//cargar obras
export const postObras = async (req, res) => {
  const { calle, tipo_obra, estado, punto1, punto2 } = req.body;
  const newObra = new obras({ calle, tipo_obra, estado, punto1, punto2 });
  await newObra.save();
  res.send(newObra);
};

//cargar rampas
export const postRampas = async (req, res) => {
  const { direccion, latitud, longitud } = req.body;
  const newRampa = new rampa({ direccion, latitud, longitud });
  await newRampa.save();
  res.send(newRampa);
};

//cargar sendas
export const postSendas = async (req, res) => {
  const { calle, punto1, punto2 } = req.body;
  const newSenda = new sendas({ calle, punto1, punto2 });
  await newSenda.save();
  res.send(newSenda);
};
