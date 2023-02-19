import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";

const Team = () => {
  const [team, setTeam] = useState([]);
  const [teamPlayers, setTeamPlayers] = useState([]);
  const { id } = useParams();
  // const teamId = 1;

  
  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/teams/${id}`)
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setTeam(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, [id]);

  console.log(team);

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/teams/${id}/players`)
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setTeamPlayers(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, [id]);

  console.log(teamPlayers);
  
  return (
    <div className="player-container">
      <div className="player-header">
        <img src={team.img} alt="" />
        <div className="player-info">
          <h1>{team.teamName}</h1>
          <p>
            {team.state},{team.country}
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
              <th>Offensive Rating</th>
              <th>Defensive Rating</th>
              <th>No of Championships won</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{team.ofr}</td>
              <td>{team.dfr}</td>
              <td>{team.champs}</td>
            </tr>
          </tbody>
        </table>
        <div className="player-stats">
          <div className="stats-header">
            <h2>ALL TIME RECORDS</h2>
          </div>

          {team.records && (
            <ul>
              <li>Total Points: {team.records.split(";")[0]}</li>
              <li>Total Assists: {team.records.split(";")[1]}</li>
              <li>Total Rebounds: {team.records.split(";")[2]}</li>
              <li>Total Blocks: {team.records.split(";")[3]}</li>
              <li>Total Steals: {team.records.split(";")[4]}</li>
            </ul>
          )}
        </div>
      </div>
      <div>
        <div className="players-list">
          <div className="stats-header">
            <h2>{team.teamName}' Players</h2>
          </div>
          <table className="player-table">
            <thead>
              <tr>
                <th>Player</th>
                <th>POSITION</th>
                <th>WEIGHT</th>
                <th>HEIGHT</th>
                <th>COUNTRY</th>
              </tr>
            </thead>
            <tbody>
              {teamPlayers.map((player, index) => (
                <tr key={index}>
                  {/* <td>{player.id}</td> */}

                  <td className="player-img">
                    <Link className="link" to={`/player/${player.pid}`}>
                      <img src={player.playerImg} alt="" />
                      {player.playerName}
                    </Link>
                  </td>
                  <td>{player.position}</td>
                  <td>{player.weight} lbs</td>
                  <td>{player.height}</td>
                  <td>{player.country}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Team;
