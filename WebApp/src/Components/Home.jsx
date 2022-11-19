import React, { useState } from "react";
import { Link } from "react-router-dom";
import Select from "react-select";
import { GrLinkNext } from "react-icons/gr";
import { customStyles } from "./styles";
import Fondo from "../Images/fondo.svg";
import logo from "../Images/Logo.svg";
import circulo1 from "../Images/Circle1.png";
import circulo2 from "../Images/Circle2.png";

export const Home = () => {
  const categories = [
    { value: "instituciones", label: "Instituciones" },
    { value: "obras", label: "Obras" },
    { value: "sendas", label: "Sendas" },
    { value: "rampa", label: "Rampas" },
  ];

  const type = [
    { value: "braille", label: "Braille" },
    { value: "señas", label: "Lenguaje de Señas" }
  ];

  const [state1, setState1] = useState({optionSelect: "",});
  const [state2, setState2] = useState({optionSelect: "",});
  const [data, setData] = useState([]);
  const handleChange1 = async (option) => {
    if(option.value != "instituciones" && option.value != "rampa"){
      const data = await getData("points?cat=" + option.value);
      console.log(data)
      setData([data, 0]);
    }else if(option.value == "rampa"){
      const data = await getData("points?cat=" + option.value);
      console.log(data)
      setData([data, 1]);
    }

    setState1({
      optionSelect: option.value,
    });


  };
  const url = "http://localhost:4000/"

  const getData = async (path) => {
    const data = await fetch(url + path);
    const json = await data.json();
    return json
  }

  const handleChange2 = async (option) => {
    setState2({
      optionSelect: option.value,
    });
    
    const data = await getData("points?cat=" + state1.optionSelect + "&filter=" + option.value);
    console.log(data);
    setData([data, 1]);
  };

  return (
    <div className="conteiner">
      <img src={logo} alt="logo parada de colectivos" className="logo" />
      <img
        src={circulo1}
        alt="circulo parada de colectivos"
        className="circulo1"
      />
      <img
        src={circulo2}
        alt="circulo parada de colectivos"
        className="circulo2"
      />
      <img src={Fondo} alt="paradas de colectivos" className="fondo" />
      <div className="body">
        <h1>¿Qué quieres ver?</h1>

        <div className="option">
          <h2>Categorias</h2>
          <Select
            placeholder="Elegí una categoria"
            options={categories}
            value={state1.options}
            onChange={handleChange1}
            closeMenuOnSelect={true}
            styles={customStyles}
            isSearchable={false}
          />
        {
          (state1.optionSelect == "instituciones") &&
          <>
          
          <h2>Tipo</h2>
          <Select
            placeholder="Elegí un tipo"
            options={type}
            value={state2.options}
            onChange={handleChange2}
            closeMenuOnSelect={true}
            styles={customStyles}
            isSearchable={false}
          />
          </>
        }
        </div>

        <div className="boton">
          <Link
            to={{
              pathname: "/map",
              data,
            }}
            className="link"
          >
            ¡Echemos un vistazo al mapa!
          </Link>
          <span>
            <GrLinkNext className="icon" />
          </span>
        </div>
      </div>
    </div>
  );
};
