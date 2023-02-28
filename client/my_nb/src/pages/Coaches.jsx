import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

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
    team.coach_name.toLowerCase().includes(searchTerm.toLowerCase())
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
            <th>General Manager</th>
            <th>Team</th>
            <th>DIVISON</th>
          </tr>
        </thead>
        <tbody>
          {filteredCoaches.map((coach) => (
            <tr key={coach.id}>
              <td className="player-img">
                <Link className="link" to={`/coach/${coach.coach_id}`}>
                  <img src={coach.coach_img} alt="" />
                  {coach.coach_name}
                </Link>
              </td>
              <td>{coach.teamName}</td>
              <td>{coach.division}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Coaches;
