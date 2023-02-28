import { db } from "../db.js";

//search


export const searchNames = (req, res) => {
  // const q = "SELECT * FROM teams";
  const q =
    "SELECT playerName AS name, pid AS id, 'player' AS type FROM players2 UNION SELECT teamName AS name, id AS id,'team' AS type FROM teams UNION SELECT coach_name AS name, coach_id AS id, 'coach' AS type FROM coaches UNION SELECT gm_name AS name, gm_id AS id, 'gm' AS type FROM gms UNION SELECT arena_name AS name, arena_id AS id, 'arena' AS type FROM arenas;";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};


