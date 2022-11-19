import React from "react";
import { Marker, Popup, Polyline } from "react-leaflet";
import { LocationIcon } from "./Icon";
import "./Maps.css";

export const Marcadores = ({ datas }) => {
  const marcadore = datas.map((data) => {
    return (
      <Marker
        key={data._id}
        position={{ lat: data.latitud.toString(), lng: data.longitud.toString() }}
        icon={LocationIcon}
      >
        <Popup>
          <h1 className="popup">{`Direccion: ${(data.direccion) ? data.direccion: ""}`}</h1>
          <h1 className="popup">{`${(data.nombre) ? data.nombre: ""}`}</h1>
        </Popup>
      </Marker>
    );
  });

  return <>{marcadore}</>;
};
