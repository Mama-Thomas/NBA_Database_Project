import React from "react";
import { Link } from "react-router-dom";
import Logo from "../img/nba_logo.png";

const Navbar = () => {
  
  
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

          
        </div>
      </div>
    </div>
  );
};

export default Navbar;
