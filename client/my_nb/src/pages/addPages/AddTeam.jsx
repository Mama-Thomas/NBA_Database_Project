import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function AddTeam() {
  const navigate = useNavigate();

  const [inputs, setInputs] = useState({
    teamName: "",
    country: "",
    state: "",
    teamCode: "",
    division: "",
    img: "",
    ofr: "",
    dfr: "",
    records: "",
    champs: "",
    wins: "",
    loses: "",
  });

  const [err, setError] = useState(null);

  const handleChange = (e) => {
    setInputs((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await fetch("/backend/teams/", {
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
      navigate("/teams");
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div className="add-entity">
      <h1>Add a New Team</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="teamName"> Name:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="teamName"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="country">Country:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="country"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="state">State:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="state"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="teamCode">Code:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="teamCode"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="division">Division:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="division"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="img">Image:</label>
          <input
            required
            placeholder="text"
            type="text"
            name="img"
            onChange={handleChange}
          />
        </div>

        <div>
          <label htmlFor="ofr">Ofr:</label>
          <input
            required
            placeholder="float"
            type="text"
            name="ofr"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="dfr">Dfr:</label>
          <input
            required
            placeholder="float"
            type="text"
            name="dfr"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="wins">Wins:</label>
          <input
            required
            placeholder="float"
            type="text"
            name="wins"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="loses">Loses:</label>
          <input
            required
            placeholder="float"
            type="text"
            name="loses"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="champs"> Total Championships:</label>
          <input
            required
            placeholder="int"
            type="text"
            name="champs"
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="records">Team Records:</label>
          <input
            required
            placeholder="text seperated by ' ; ' "
            type="text"
            name="records"
            onChange={handleChange}
          />
        </div>
        <div className="button-grid">
          <button type="submit">Add Team</button>
        </div>
      </form>
    </div>
  );
}

export default AddTeam;
