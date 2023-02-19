import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const Teams = () => {
  const [teams, setTeams] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/teams/")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setTeams(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);
  const filteredTeams = teams.filter((team) =>
    team.teamName.toLowerCase().includes(searchTerm.toLowerCase())
  );
  console.log(teams);

  

  return (
    <div className="players-list">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search teams"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <table className="player-table">
        <thead>
          <tr>
            <th>Team</th>
            <th>Division</th>
            <th>Offensive Rating</th>
            <th>Deffensive Rating</th>
            <th>State</th>
            <th>Country</th>

            
          </tr>
        </thead>
        <tbody>
          {filteredTeams.map((team) => (
            <tr key={team.id}>

              <td className="player-img">
                <Link className="link" to={`/team/${team.id}`}>
                  <img src={team.img} alt="" />
                  {team.teamName}
                </Link>
              </td>
              <td>{team.division}</td>
              <td>{team.ofr}</td>
              <td>{team.dfr}</td>
              <td>{team.state}</td>
              <td>{team.country}</td>
              
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Teams;

