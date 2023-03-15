import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const Players = () => {
  const [players, setPlayers] = useState([]);
   const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/players/")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setPlayers(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);
  const filteredPlayers = players.filter((player) =>
    player.Fname.toLowerCase().includes(searchTerm.toLowerCase())
  );
  console.log(players);


  return (
    <div className="players-list">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search players"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <table className="player-table">
        <thead>
          <tr>
            {/* <th>ID</th> */}
            <th>Player</th>
            <th>TEAM</th>
            <th>POSITION</th>
            <th>WEIGHT</th>
            <th>HEIGHT</th>
            <th>Age</th>
          </tr>
        </thead>
        <tbody>
          {filteredPlayers.map((player) => (
            <tr key={player.playerId}>
              {/* <td>{player.id}</td> */}

              <td className="player-img">
                <Link className="link" to={`/player/${player.playerId}`}>
                  <p>{player.Fname}</p>
                  <p>{player.Lname}</p>
                  {/* {`${player.Fname}${player.Lname}`} */}
                </Link>
              </td>
              <td>{player.tname}</td>
              <td>{player.position}</td>
              <td>{player.weight} lbs</td>
              <td>{player.height}</td>
              <td>{player.age}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );

};

export default Players;
