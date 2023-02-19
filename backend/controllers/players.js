//player controller

import {db} from "../db.js";

export const getPlayers = (req, res) =>{
    // const q = "SELECT * FROM players";
    const q =
      "SELECT players2.*, teams.* FROM players2 LEFT JOIN teams ON players2.player_team_id = teams.id";
    //   "SELECT players2.*, stats2.* FROM players2 LEFT JOIN stats2 ON players2.id = stats2.player_id";

    db.query(q,(err,data) =>{
        if(err)  {
            console.log(err)
            return res.send(err)
        }

        return res.status(200).json(data);
    })
}
export const getPlayer = (req, res) =>{
    const playerId = req.params.id; // Get the player ID from the request parameters
    // const q = "SELECT * FROM players WHERE id = ?"; // Define the SQL query to retrieve the player with the given ID
  const q =
    "SELECT players2.*, stats2.* , teams.teamName AS team_name FROM players2 JOIN stats2 ON players2.pid = stats2.player_id JOIN teams ON players2.player_team_id = teams.id WHERE players2.pid = ?";
    

    db.query(q, [playerId], (err, data) => {
      if (err) {
        console.log(err);
        return res.send(err);
      }

      if (data.length === 0) {
        // If no player was found with the given ID, return a 404 error
        return res.status(404).json({ error: "Player not found" });
      }

      return res.status(200).json(data[0]); // Return the first (and only) player from the result set
    });
}
export const addPlayer = (req, res) =>{
    res.json("from controller")
}
export const deletePlayer = (req, res) =>{
    res.json("from controller")
}
export const updatePlayer = (req, res) =>{
    res.json("from controller")
}