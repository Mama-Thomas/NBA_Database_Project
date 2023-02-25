import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function AddArena() {
  const navigate = useNavigate();

  const [inputs, setInputs] = useState({
    arena_team_id:"",
    arena_name:"",
    arena_img:"",
    location:"",
    occupancy:"",
  });

  const [err, setError] = useState(null);

  const handleChange = (e) => {
    setInputs((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await fetch("/backend/arenas/", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(inputs),
      });
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData);
      }
      navigate("/arenas");
      // console.log("BUTTON")
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div className="add-entity">
      <h1>Add a New Arena</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="arena_name">Name:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="arena_name"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="arena_team_id"> Team ID:</label>
          <input
            required
            placeholder="int"
            type="text"
            name="arena_team_id"
            onChange={handleChange}
          />
        </div>

        <div>
          <label htmlFor="location">Location:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="location"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="arena_img">IMG URL:</label>
          <input
            required
            placeholder="text seperated by ' ; '"
            type="text"
            name="arena_img"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="occupancy">Occupancy:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="occupancy"
            onChange={handleChange}
          />
        </div>
          <button type="submit">
            Add Arena
            </button>
      </form>
    </div>
  );
}

export default AddArena;
