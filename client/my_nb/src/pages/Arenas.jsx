import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const Arenas = () => {
  const [arenas, setArenas] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/arenas/")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setArenas(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);
  const filteredArenas = arenas.filter((arena) =>
    arena.arenaName.toLowerCase().includes(searchTerm.toLowerCase())
  );
  console.log(arenas);

  return (
    <div className="players-list">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search Arenas"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <table className="player-table">
        <thead>
          <tr>
            <th>Arena</th>
            <th>Team</th>
            <th>DIVISON</th>
            <th>OCCUPANCY</th>
            <th>CITY</th>
            <th>STATE</th>
          </tr>
        </thead>
        <tbody>
          {filteredArenas.map((arena) => (
            <tr key={arena.id}>
              <td className="player-img">
                <div className="link">
                  {arena.arenaName}
                </div>
              </td>
              <td>{arena.teamName}</td>
              <td>{arena.conference}</td>
              <td>{arena.occupancy}</td>
              <td>{arena.arenaCity}</td>
              <td>{arena.arenaState}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Arenas;
