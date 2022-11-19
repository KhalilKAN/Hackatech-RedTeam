import React, { useState } from "react";
import { useLocation } from "react-router-dom";
import "./Maps.css";
import { MapContainer, TileLayer, Polyline } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import { Marcadores } from "./Marcadores";


export const Maps = () => {
  const [data, setData] = useState({
    rang: [-27.477151335963306, -58.9290258167181],
    zoom: 13,
  });

  const location = useLocation();

  const getFormat = (data) => {
    let data_send = []
    let data_send2 = []
    console.log(data)
    for (let i = 0; i < data.length; i++) {
      data_send.push([
        [data[i].punto1.latitud, data[i].punto1.longitud], 
        [data[i].punto2.latitud, data[i].punto2.longitud]
      ])

      data_send2.push({
        "latitud" : data[i].punto1.latitud,
        "longitud" : data[i].punto1.longitud,
        "_id": i,
        "nombre": (data[i].tipo_obra) ? data[i].tipo_obra:"",
        "direccion": data[i].calle
      })
      data_send2.push({
        "latitud" : data[i].punto2.latitud,
        "longitud" : data[i].punto2.longitud,
        "_id": i,
        "nombre": (data[i].tipo_obra) ? data[i].tipo_obra:"",
        "direccion": data[i].calle
      })
    }
    return [data_send, data_send2]
  }

  return (
    <MapContainer center={data.rang} zoom={data.zoom}>
      
      <TileLayer
        attribution='© <a href="https://osm.org/copyright">OpenStreetMap</a> contributors'
        url="https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}{r}.png?api_key=f3a71b93-04a2-4edf-a8d6-a3ee3a540f89"
      />
      {
        (location.data[1] == 0) &&
        <>
          <Polyline 
            key={132} 
            positions={getFormat(location.data[0])[0]} 
            color={'red'} 
          />
          <Marcadores datas={getFormat(location.data[0])[1]} />
        </>
      }
      {
        (location.data[1] == 1) &&
        <Marcadores datas={location.data[0]} />
      }
    </MapContainer>
  );
};
