//Coach controller

import { db } from "../db.js";

export const getCoaches = (req, res) => {
  const q =
    "SELECT coaches.*, teams.* FROM coaches JOIN teams ON coaches.coach_team_id = teams.id";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
export const getCoach = (req, res) => {
  const coachId = req.params.id; // Get the coach ID from the request parameters
  const q =
    "SELECT coaches.*, teams.teamName AS team_name FROM coaches JOIN teams ON coaches.coach_team_id = teams.id WHERE coach_id = ?"; // Define the SQL query to retrieve the coach with the given ID

  db.query(q, [coachId], (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    if (data.length === 0) {
      return res.status(404).json({ error: "coach not found" });
    }

    return res.status(200).json(data[0]);
  });
};
export const addCoach = (req, res) => {
  res.json("from controller");
};
export const deleteCoach = (req, res) => {
  res.json("from controller");
};
export const updateCoach = (req, res) => {
  res.json("from controller");
};
