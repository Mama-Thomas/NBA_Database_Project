//arenas controller

import { db } from "../db.js";

export const getArenas = (req, res) => {
  // const q = "SELECT * FROM Arenas";
  const q =
    "SELECT arenas.*, teams.* FROM arenas LEFT JOIN teams ON arenas.arena_team_id = teams.id";
  //   "SELECT teams.*, stats2.* FROM teams LEFT JOIN stats2 ON teams.id = stats2.player_id";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    return res.status(200).json(data);
  });
};
export const getArena = (req, res) => {
  const arenaId = req.params.id; // Get the arenas ID from the request parameters
  // const q = "SELECT * FROM arenass WHERE id = ?"; // Define the SQL query to retrieve the player with the given ID
  const q =
    "SELECT arenas.*, teams.*  FROM arenas JOIN teams ON arenas.arena_team_id = teams.id  WHERE arenas.arena_id = ?";

  db.query(q, [arenaId], (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }

    if (data.length === 0) {
      // If no player was found with the given ID, return a 404 error
      return res.status(404).json({ error: "Arena not found" });
    }

    return res.status(200).json(data[0]); // Return the first (and only) player from the result set
  });
};

export const addArena = (req, res) => {
  const {
    arena_team_id,
    arena_name,
    arena_img,
    location,
    occupancy
  } = req.body;

  const arenaSql =
    "INSERT INTO arenas (arena_team_id, arena_name,arena_img,location,occupancy) VALUES (?, ?, ?, ?, ?)";

  db.query(
    arenaSql,
    [arena_team_id, arena_name, arena_img, location, occupancy],
    (err, result) => {
      if (err) {
        res.status(500).send("Error adding arena to database.");
      } else {
        res.status(200).send("Arena added to database successfully.");
      }
    }
  );
};
