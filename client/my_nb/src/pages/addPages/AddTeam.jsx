import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function AddTeam() {
  const navigate = useNavigate();
  const [teamName, setTeamName] = useState("");
  const [country, setCountry] = useState("");
  const [state, setState] = useState("");
  const [teamCode, setTeamCode] = useState("");
  const [division, setDivision] = useState("");
  const [img, setImg] = useState("");
  const [ofr, setOfr] = useState("");
  const [dfr, setDfr] = useState("");
  const [records, setRecords] = useState("");
  const [champs, setChamps] = useState("");
  const [err, setError] = useState(null);


  const handleSubmit = (event) => {
    event.preventDefault();
    const newTeam = {
      teamName,
      state,
      country,
      teamCode,
      division,
      img,
      ofr,
      dfr,
      champs,
      records,
    };
    fetch("/backend/teams/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newTeam),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log("Success:", data);
        // Redirect to the team page for the newly added team
        const newTeamId = data.id; // assuming the server returns the teamId
        window.location.href(`/team/${newTeamId}`);
        // navigate(`/team/${newTeamId}`);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  };

  return (
    <div>
      <h1>Add a New Team</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="name">Team Name:</label>
          <input
            type="text"
            id="name"
            value={teamName}
            onChange={(event) => setTeamName(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="country">Team Country:</label>
          <input
            type="text"
            id="country"
            value={country}
            onChange={(event) => setCountry(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="state">Team State:</label>
          <input
            type="text"
            id="state"
            value={state}
            onChange={(event) => setState(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="teamCode">Team Code:</label>
          <input
            type="text"
            id="teamCode"
            value={teamCode}
            onChange={(event) => setTeamCode(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="division">Team Division:</label>
          <input
            type="text"
            id="division"
            value={division}
            onChange={(event) => setDivision(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="img">Team Image:</label>
          <input
            type="text"
            id="img"
            value={img}
            onChange={(event) => setImg(event.target.value)}
          />
        </div>
        {/* <div>
          <label htmlFor="img">Team Image:</label>
          <input
            type="text"
            id="img"
            value={img}
            onChange={(event) => setImg(event.target.value)}
          />
        </div> */}
        <div>
          <label htmlFor="ofr">Team Ofr:</label>
          <input
            type="text"
            id="ofr"
            value={ofr}
            onChange={(event) => setOfr(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="dfr">Team Dfr:</label>
          <input
            type="text"
            id="dfr"
            value={dfr}
            onChange={(event) => setDfr(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="champs">Team Total Championships:</label>
          <input
            type="text"
            id="champs"
            value={champs}
            onChange={(event) => setChamps(event.target.value)}
          />
        </div>
        <div>
          <label htmlFor="records">Team Records:</label>
          <input
            type="text"
            id="records"
            value={records}
            onChange={(event) => setRecords(event.target.value)}
          />
        </div>
        <button type="submit">Add Team</button>
      </form>
    </div>
  );
}

export default AddTeam;
