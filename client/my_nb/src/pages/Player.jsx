import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
// import { Link } from "react-router-dom";

const Player = () => {
  const [player, setPlayer] = useState([]);
const { id } = useParams();
// const playerId = 1;

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/players/${id}`)
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setPlayer(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, [id]);

  console.log(player);

  return (
    <div className="player-container">
      <div className="player-header">
        <div className="player-info">
          <h1> {`${player.Fname} ${player.Lname}`}</h1>
          <p>
            {player.position}, {player.tname}
          </p>
          <p>
            Age: {player.age} • Height: {player.height} • Weight:{" "}
            {player.weight} lbs • Draft-Year: {player.draftYear} • Draft-Pick:{" "}
            {player.draftPick} • Draft-Round: {player.draftRound}
          </p>
        </div>
      </div>
      <div className="player-stats">
        <div className="stats-header">
          <h2>2021-22 Regular Season Stats</h2>
        </div>
        <table>
          <thead>
            <tr>
              <th>PPG</th>
              <th>RPG</th>
              <th>APG</th>
              <th>SPG</th>
              <th>BPG</th>
              <th>3P%</th>
              <th>FG%</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{player.PPG}</td>
              <td>{player.RPG}</td>
              <td>{player.APG}</td>
              <td>{player.SPG}</td>
              <td>{player.BPG}</td>
              <td>{player["3P%"]}</td>
              <td>{player["FG%"]}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default Player;
