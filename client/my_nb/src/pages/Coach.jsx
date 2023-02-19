import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

const Coach = () => {
  const [coach, setCoach] = useState([]);
  const { id } = useParams();

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/coaches/${id}`)
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setCoach(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, [id]);

  console.log(coach);

  return (
    <div class="player-container">
      <div class="player-header">
        <img src={coach.img} alt="" />
        <div class="player-info">
          <h1>{coach.name}</h1>
        </div>
      </div>
      <div class="player-stats">
        <div class="stats-header">
          <h2>Biography:</h2>
        </div>
        <div>
          {coach.bio?.split(".").map((line, index) => (
          <div key={index}>
            {line}
            <p> </p>
          </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Coach;
