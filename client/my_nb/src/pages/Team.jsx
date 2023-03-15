import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";

const Team = () => {
  const [team, setTeam] = useState([]);
  const [teamPlayers, setTeamPlayers] = useState([]);
  const { name } = useParams();
  // const teamId = 1;

  
  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/teams/${name}`)
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
  }, [name]);

  console.log(team);

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/teams/${name}/players`)
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
  }, [name]);

  console.log(teamPlayers);
  
  return (
    <div className="player-container">
      <div className="player-header">
        <div className="player-info">
          <h1>{team.teamName}</h1>
        </div>
      </div>
      <div className="player-stats">
        <div className="stats-header">
          <h2>2022-23 Regular Season Records</h2>
        </div>
        <table>
          <thead>
            <tr>
              <th>Standing</th>
              <th>Offensive Rating</th>
              <th>Defensive Rating</th>
              <th>Home Wins</th>
              <th>Home Loses</th>
              <th>Away Wins</th>
              <th>Away Loses</th>
              <th>No of Championships won</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{team.standing}</td>
              <td>{team.offRtg}</td>
              <td>{team.defRtg}</td>
              <td>{team.homeWins}</td>
              <td>{team.homeLosses}</td>
              <td>{team.awayWins}</td>
              <td>{team.awayLosses}</td>
              <td>{team.champ_won}</td>
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
                <th>AGE</th>
                <th>DRAFT YEAR</th>
              </tr>
            </thead>
            <tbody>
              {teamPlayers.map((player, index) => (
                <tr key={index}>
                  {/* <td>{player.id}</td> */}

                  <td className="player-img">
                    <Link className="link" to={`/player/${player.playerId}`}>
                      {`${player.Fname} ${player.Lname}`}
                    </Link>
                  </td>
                  <td>{player.position}</td>
                  <td>{player.age} lbs</td>
                  <td>{player.draftYear}</td>
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
