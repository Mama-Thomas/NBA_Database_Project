import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function AddTeam() {
  const navigate = useNavigate();

  const [inputs, setInputs] = useState({
    playerName: "",
    country: "",
    player_team_id: "",
    height: "",
    weight: "",
    age: "",
    position: "",
    playerImg: "",
    personalBio: "",
    preBio: "",
    profBio: "",
    ppg: "",
    rpg: "",
    apg: "",
    tpp: "",
    fgp: ""
  });

  const [err, setError] = useState(null);

  const handleChange = (e) => {
    setInputs((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await fetch("/backend/players/", {
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
      navigate("/players");
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div className="add-entity">
      <h1>Add a New Player</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="playerName">Name:</label>
          <input
            type="text"
            name="playerName"
            placeholder="text"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="country">Country:</label>
          <input
            type="text"
            placeholder="text"
            name="country"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="playerImg">Image URL:</label>
          <input
            type="text"
            placeholder="text"
            name="playerImg"
            onChange={handleChange}
          />
        </div>

        <div>
          <label htmlFor="player_team_id">Team ID:</label>
          <input
            type="text"
            placeholder="int"
            name="player_team_id"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="position">Position:</label>
          <input
            type="text"
            placeholder="int"
            name="position"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="height">Height:</label>
          <input
            type="text"
            placeholder="feet'inch''"
            name="height"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="weight">Weight:</label>
          <input
            type="text"
            placeholder="int"
            name="weight"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="age">Age:</label>
          <input
            type="text"
            placeholder="int"
            name="age"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="personalBio">Personal Bio:</label>
          <input
            type="text"
            placeholder="text"
            name="personalBio"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="profBio">Professional Bio:</label>
          <input
            type="text"
            placeholder="text"
            name="profBio"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="preBio">Pre NBA Bio:</label>
          <input
            type="text"
            placeholder="text"
            name="preBio"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="ppg">PPG:</label>
          <input
            type="text"
            placeholder="float"
            name="ppg"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="rpg">RPG:</label>
          <input
            type="text"
            placeholder="float"
            name="rpg"
            onChange={handleChange}
          />
        </div>
        <div>
        <div>
          <label htmlFor="apg">APG:</label>
          <input
            type="text"
            placeholder="float"
            name="apg"
            onChange={handleChange}
          />
        </div>
          <label htmlFor="tpp">3 Points Percentage:</label>
          <input
            type="text"
            placeholder="float"
            name="tpp"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="fgp">FG Percentage:</label>
          <input
            type="text"
            placeholder="float"
            name="fgp"
            onChange={handleChange}
          />
        </div>
        
        <button type="submit">Add Player</button>
      </form>
    </div>
  );
}

export default AddTeam;
