import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const GMs = () => {
  const [gms, setGms] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/gms/")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setGms(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);
  const filteredGms = gms.filter((gm) =>
    gm.gm_name.toLowerCase().includes(searchTerm.toLowerCase())
  );
  console.log(gms);

  return (
    <div className="players-list">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search general managers"
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
          {filteredGms.map((gm) => (
            <tr key={gm.id}>
              <td className="player-img">
                <Link className="link" to={`/gm/${gm.gm_id}`}>
                  <img src={gm.gm_img} alt="" />
                  {gm.gm_name}
                </Link>
              </td>
              <td>{gm.teamName}</td>
              <td>{gm.division}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default GMs;
