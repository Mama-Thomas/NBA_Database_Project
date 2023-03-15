//arenas controller

import { db } from "../db.js";

export const getArenas = (req, res) => {
  const q =
    "SELECT TEAM.*, ARENA.*  FROM TEAM  JOIN ARENA ON TEAM.teamArena = ARENA.arenaName  ";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
