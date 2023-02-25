import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

const GM = () => {
  const [gm, setGm] = useState([]);
  const { id } = useParams();
  // const teamId = 1;

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/gms/${id}`)
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setGm(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, [id]);

  console.log(gm);
//   const tradesText = gm.trades_made;
//   const trades = tradesText.split(";");

  return (
    <div class="player-container">
      <div class="player-header">
        <img src={gm.gm_img} alt="" />
        <div class="player-info">
          <h1>{gm.gm_name}</h1>
          <h4>General Manager for The {gm.team_name}</h4>
        </div>
      </div>
      <div class="player-stats">
        <div class="stats-header">
          <h2>2021-22 TRADES MADE</h2>
        </div>
        <div>
          
          {gm.trades_made?.split(";").map((trade, index) => (
            <div key={index}>
              <li>{trade}</li>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default GM;
