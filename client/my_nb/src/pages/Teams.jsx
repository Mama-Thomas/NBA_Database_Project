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
            <th>Color</th>
            <th>Division</th>
            <th>Pace</th>
            <th>Mascot</th>
            <th>Coach</th>
            <th>Manager</th>
          </tr>
        </thead>
        <tbody>
          {filteredTeams.map((team) => (
            <tr key={team.id}>
              <td className="player-img">
                <Link className="link" to={`/team/${team.teamName}`}>
                  {team.teamName}
                </Link>
              </td>

              <td>{team.primaryColor}</td>
              <td>{team.conference}</td>
              <td>{team.pace}</td>
              <td>{team.mascot}</td>
              <td>{`${team.coachFname} ${team.coachLname}`}</td>
              <td>{`${team.gmFname} ${team.gmLname}`}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Teams;

