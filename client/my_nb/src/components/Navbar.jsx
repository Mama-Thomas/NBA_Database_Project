import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import Logo from "../img/nba_logo.png";
import Autosuggest from "react-autosuggest";

const Navbar = () => {
  const [searchNames, setSearchNames] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [suggestions, setSuggestions] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/search")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setSearchNames(json);
          });
      } catch (error) {
        console.log(error);
      }
    };
    fetchData();
  }, []);

  const getSuggestions = (value) => {
    const inputValue = value.trim().toLowerCase();
    const inputLength = inputValue.length;
    return inputLength === 0
      ? []
      : searchNames
          .filter(
            (name) =>
              name.name.toLowerCase().slice(0, inputLength) === inputValue
          )
          .map((name) => ({
            ...name,
            type: name.type.toLowerCase(),
            id: name.id.toString(),
          }));
  };


  // const getSuggestions = (value) => {
  //   const inputValue = value.trim().toLowerCase();
  //   const inputLength = inputValue.length;
  //   return inputLength === 0
  //     ? []
  //     : searchNames.filter(
  //         (name) => name.name.toLowerCase().slice(0, inputLength) === inputValue
  //       );
  // };

  const onSuggestionsFetchRequested = ({ value }) => {
    setSuggestions(getSuggestions(value));
  };

  const onSuggestionsClearRequested = () => {
    setSuggestions([]);
  };

  const onSuggestionSelected = (event, { suggestion }) => {
    setSearchTerm(suggestion.name);
  };

  const inputProps = {
    placeholder: "Search",
    value: searchTerm,
    onChange: (_, { newValue }) => setSearchTerm(newValue),
  };

  // const renderSuggestion = (suggestion) => <span>{suggestion.name}</span>;
const renderSuggestion = (suggestion) => (
  <Link to={`/${suggestion.type}/${suggestion.id}`}>
    <span>{suggestion.name}</span>
  </Link>
);
  return (
    <div className="navbar">
      <div className="container">
        <div className="logo">
          <Link to="/">
            <img src={Logo} alt="" />
          </Link>
        </div>
        <div className="links">
          <Link className="link" to="/">
            <h6>Home</h6>
          </Link>
          <Link className="link" to="/players">
            <h6>Players</h6>
          </Link>
          <Link className="link" to="/teams">
            <h6>Teams</h6>
          </Link>
          <Link className="link" to="/coaches">
            <h6>Coaches</h6>
          </Link>
          <Link className="link" to="/gms">
            <h6>GMs</h6>
          </Link>
          <Link className="link" to="/arenas">
            <h6>Arenas</h6>
          </Link>
          <Link className="link" to="/awards">
            <h6>Awards</h6>
          </Link>

          <div className="search-list">
            <Autosuggest
              suggestions={suggestions}
              onSuggestionsFetchRequested={onSuggestionsFetchRequested}
              onSuggestionsClearRequested={onSuggestionsClearRequested}
              getSuggestionValue={(suggestion) => suggestion.name}
              onSuggestionSelected={onSuggestionSelected}
              renderSuggestion={renderSuggestion}
              inputProps={inputProps}
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Navbar;
