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
  const {
    playerName,
    country,
    player_team_id,
    height,
    weight,
    age,
    position,
    playerImg,
    personalBio,
    preBio,
    profBio,
    ppg,
    rpg,
    apg,
    tpp,
    fgp
  } = req.body;

  const playerSql =
    "INSERT INTO players2 (playerName,country,player_team_id, height,weight,age,position,playerImg,personalBio, preBio,profBio) VALUES (?, ?, ?, ?, ?, ?,?,?,?,?,?)";

  db.query(
    playerSql,
    [
      playerName,
      country,
      player_team_id,
      height,
      weight,
      age,
      position,
      playerImg,
      personalBio,
      preBio,
      profBio,
    ],
    (err, result) => {
      if (err) {
        res.status(500).send("Error adding team to database.");
      } else {
        // retrieve the teamId of the newly inserted team
        const player_id = result.insertId;

        // insert the ofr into the stats table along with the teamId
        const statsSql =
          "INSERT INTO stats2 (ppg,rpg,apg,tpp,fgp,player_id) VALUES (?, ?,?,?,?,?)";
        db.query(
          statsSql,
          [ppg,rpg,apg,tpp,fgp, player_id],
          (err, result) => {
            if (err) {
              res.status(500).send("Error adding stats to database.");
            } else {
              res.status(200).send("Team and stats added to database.");
            }
          }
        );
      }
    }
  );
}
export const deletePlayer = (req, res) =>{
    res.json("from controller")
}
export const updatePlayer = (req, res) =>{
    res.json("from controller")
}

//returns the player with the highest sum of (ppg+3%+fg%)
export const topScorer = (req, res) => {
  const q =
    "SELECT players2.*, stats2.ppg,stats2.tpp,stats2.fgp,ROUND(stats2.ppg + stats2.tpp + stats2.fgp, 2) AS total FROM players2 JOIN stats2 ON players2.pid = stats2.player_id ORDER BY total DESC LIMIT 1";

  db.query(q, (err, data) => {
    if (err) {
      console.log(err);
      return res.send(err);
    }
    

    return res.status(200).json(data);
  });
};

