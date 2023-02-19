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
          <Link className="link" to="/stats">
            <h6>Stats</h6>
          </Link>
          <Link className="link" to="/login">
            <h6>Login</h6>
          </Link>

          {/* <span>Mama</span> */}
          {/* <span>Logout</span> */}
          <span className="search">Search</span>
          {/* <Link className='link'>Teams</Link>
          <Link className='link'>GMs</Link>
          <Link className='link'>Coaches</Link> */}
        </div>
      </div>
    </div>
  );
};

export default Navbar;
