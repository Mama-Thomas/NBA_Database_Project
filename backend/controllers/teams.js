//Team controller

import { db } from "../db.js";

export const getTeams = (req, res) => {
  // const q = "SELECT * FROM teams";
  const q =
    "SELECT teams.*, team_history.* FROM teams LEFT JOIN team_history ON teams.id = team_history.team_id";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
export const getTeam = (req, res) => {
  const teamId = req.params.id; // Get the team ID from the request parameters
  // const q = "SELECT * FROM teams WHERE id = ?"; // Define the SQL query to retrieve the team with the given ID
  const q =
    "SELECT teams.*, team_history.* FROM teams JOIN team_history ON teams.id = team_history.team_id WHERE teams.id = ?";

  db.query(q, [teamId], (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    if (data.length === 0) {
      // If no player was found with the given ID, return a 404 error
      return res.status(404).json({ error: "Team not found" });
    }

    return res.status(200).json(data[0]); // Return the first (and only) Team from the result set
  });
};
export const getTeamPlayers = (req, res) => {
  const teamId = req.params.id;
  const q = "SELECT * FROM players2 WHERE player_team_id = ?";

  db.query(q, [teamId], (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
export const addTeam = (req, res) => {
  const { teamName, img, division, teamCode, state, country, ofr, dfr, champs, records } = req.body;

  const teamSql =
    "INSERT INTO teams (teamName, img, division, teamCode,country,state) VALUES (?, ?, ?, ?, ?, ?)";

  db.query(
    teamSql,
    [teamName, img, division, teamCode, country, state],
    (err, result) => {
      if (err) {
        res.status(500).send("Error adding team to database.");
      } else {
        // retrieve the teamId of the newly inserted team
        const team_id = result.insertId;

        // insert the ofr into the stats table along with the teamId
        const historySql =
          "INSERT INTO team_history (ofr, dfr,records, champs,team_id) VALUES (?, ?, ?,?,?)";
        db.query(
          historySql,
          [ofr, dfr, records, champs, team_id],
          (err, result) => {
            if (err) {
              res.status(500).send("Error adding stats to database.");
            } else {
              res.status(200).send("Team and stats added to database.");
            }
          }
        );
      }
    }
  );
};
export const deleteTeam = (req, res) => {
  res.json("from controller");
};
export const updateTeam = (req, res) => {
  res.json("from controller");
};
