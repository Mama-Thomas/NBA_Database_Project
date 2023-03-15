//awards controller

import { db } from "../db.js";

export const getAwards = (req, res) => {
  const q =
    "SELECT PLAYER.*, AWARD.*  FROM PLAYER JOIN AWARD ON PLAYER.playerId = AWARD.awardPlayerId";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};

