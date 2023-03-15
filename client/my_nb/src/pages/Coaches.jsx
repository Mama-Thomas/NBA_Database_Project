import React, { useEffect, useState } from "react";

const Coaches = () => {
  const [coaches, setCoaches] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/coaches/")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setCoaches(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);
  const filteredCoaches = coaches.filter((team) =>
    team.coachFname.toLowerCase().includes(searchTerm.toLowerCase())
  );
  console.log(coaches);

  return (
    <div className="players-list">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search coaches"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <table className="player-table">
        <thead>
          <tr>
            <th>Coach</th>
            <th>Team</th>
            <th>DIVISON</th>
            <th>AGE</th>
            <th>YEARS OF EXPERIENCE</th>
            <th>WIN %</th>
          </tr>
        </thead>
        <tbody>
          {filteredCoaches.map((coach) => (
            <tr key={coach.id}>
              <td className="player-img">
                <div  className="link" >
                  {`${coach.coachFname} ${coach.coachLname}`}
                </div>
              </td>
              <td>{coach.teamName}</td>
              <td>{coach.conference}</td>
              <td>{coach.age}</td>
              <td>{coach.experience}</td>
              <td>{coach["win%"]}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Coaches;
