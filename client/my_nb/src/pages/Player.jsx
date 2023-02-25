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
        <img src={player.playerImg} alt="Steven Adams" />
        <div className="player-info">
          <h1>{player.playerName}</h1>
          <p>
            {player.position}, {player.team_name}
          </p>
          <p>
            Age: {player.age} • Height: {player.height} • Weight:{" "}
            {player.weight} lbs
          </p>
          <p>Country: {player.country}</p>
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
              <th>3P%</th>
              <th>FG%</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{player.ppg}</td>
              <td>{player.rpg}</td>
              <td>{player.apg}</td>
              <td>{player.tpp}</td>
              <td>{player.fgp}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div className="player-bio">
        <h2>Biography</h2>
        <h3>Personal life: </h3>
        <p>{player.personalBio}</p>
        <h3>Professional Career: </h3>
        <p>{player.profBio}</p>
        <h3>Pre NBA: </h3>
        <p>{player.preBio}</p>
      </div>
    </div>
  );
}

export default Player;
