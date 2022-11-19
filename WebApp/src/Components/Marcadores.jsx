import React from "react";
import { Marker, Popup } from "react-leaflet";
import { LocationIcon } from "./Icon";
import "./Maps.css";

export const Marcadores = ({ paradas }) => {
  const marcadore = paradas.map((parada) => {
    return (
      <Marker
        key={parada.gid}
        position={{ lat: parada.lat.toString(), lng: parada.lng.toString() }}
        icon={LocationIcon}
      >
        <Popup>
          <h1 className="popup">{`Direccion: ${parada.ubicacion}`}</h1>
        </Popup>
      </Marker>
    );
  });

  return <>{marcadore}</>;
};
