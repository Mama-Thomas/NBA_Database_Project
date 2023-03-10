//Coach controller

import { db } from "../db.js";

export const getGMs = (req, res) => {

  const q =
    "SELECT gms.*, teams.* FROM gms JOIN teams ON gms.gm_team_id = teams.id";


  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
export const getGM = (req, res) => {
  const gmId = req.params.id; // Get the gm ID from the request parameters
  const q =
    "SELECT gms.*, teams.teamName AS team_name FROM gms JOIN teams ON gms.gm_team_id = teams.id WHERE gm_id = ?"; // Define the SQL query to retrieve the coach with the given ID

  db.query(q, [gmId], (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    if (data.length === 0) {
      // If no gm was found with the given ID, return a 404 error
      return res.status(404).json({ error: "gm not found" });
    }

    return res.status(200).json(data[0]); // Return the first (and only) coach from the result set
  });
};
export const addGM = (req, res) => {
  res.json("from controller");
};
export const deleteGM = (req, res) => {
  res.json("from controller");
};
export const updateGM = (req, res) => {
  res.json("from controller");
};
