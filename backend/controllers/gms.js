//Coach controller

import { db } from "../db.js";

export const getGMs = (req, res) => {

  const q =
    "SELECT MANAGER.*, TEAM.* FROM MANAGER JOIN TEAM ON MANAGER.gmId = TEAM.teamManager";


  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
