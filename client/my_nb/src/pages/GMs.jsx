import React, { useEffect, useState } from "react";

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
    gm.gmFname.toLowerCase().includes(searchTerm.toLowerCase())
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
            <th>AGE</th>
            <th>Team</th>
            <th>DIVISON</th>
            <th>YEARS OF EXPERIENCE</th>
          </tr>
        </thead>
        <tbody>
          {filteredGms.map((gm) => (
            <tr key={gm.gmId}>
              <td className="player-img">
                <div className="link">{`${gm.gmFname} ${gm.gmLname}`}</div>
              </td>
              <td>{gm.age}</td>
              <td>{gm.teamName}</td>
              <td>{gm.conference}</td>
              <td>{gm.experienceinRole}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default GMs;
