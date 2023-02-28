//awards controller

import { db } from "../db.js";

export const getAwards = (req, res) => {
  const q =
    "SELECT awards.*, players2.* FROM awards LEFT JOIN players2 ON awards.award_player_id = players2.pid";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
export const getAward = (req, res) => {
  const awardId = req.params.id; // Get the awards ID from the request parameters
  const q =
    "SELECT awards.*, players2.*  FROM awards JOIN players2 ON players2.pid = awards.award_player_id  WHERE awards.id_awards = ?";

  db.query(q, [awardId], (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    if (data.length === 0) {
      // If no player was found with the given ID, return a 404 error
      return res.status(404).json({ error: "Award not found" });
    }

    return res.status(200).json(data[0]); // Return the first (and only) player from the result set
  });
};

