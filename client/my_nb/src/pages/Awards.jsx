import React, { useEffect, useState } from "react";

const Awards = () => {
  const [awards, setAwards] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/awards/")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setAwards(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);
  const filteredAwards = awards.filter((award) =>
    award.awardName.toLowerCase().includes(searchTerm.toLowerCase())
  );
  console.log(awards);

  return (
    <div className="players-list">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search awards"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <table className="player-table">
        <thead>
          <tr>
            <th>Awarded Player</th>
            <th>AWARD</th>
            <th>AWARD YEAR</th>
          </tr>
        </thead>
        <tbody>
          {filteredAwards.map((award) => (
            <tr key={award.awardId}>
              <td>{`${award.Fname} ${award.Lname}`}</td>
              <td>{award.awardName}</td>
              <td>{award.awardYear}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Awards;
