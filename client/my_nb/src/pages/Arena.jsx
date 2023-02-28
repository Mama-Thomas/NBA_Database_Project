import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

const Arena = () => {
  const [arena, setArena] = useState([]);
  const { id } = useParams();

  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch(`/backend/arenas/${id}`)
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setArena(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, [id]);

  console.log(arena);

  return (
    <div className="player-container">
      <div className="player-header">
        <img src={arena.img} alt="" />
        <div className="player-info">
          <h1>{arena.arena_name}</h1>
          <p>Team: {arena.team_name}</p>
          <p>Location: {arena.location}</p>
          <p>Occupancy: {arena.occupancy}</p>
        </div>
      </div>
    </div>
  );
};

export default Arena;
