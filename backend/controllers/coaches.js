//Coach controller

import { db } from "../db.js";

export const getCoaches = (req, res) => {
   const q =
     "SELECT TEAM.*, COACH.*  FROM TEAM  JOIN COACH ON TEAM.teamCoach = COACH.coachId  ";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
