//this is the route file for the player.js
import express from "express";
import {
  getPlayers,
  getPlayer,
  
  topScorer,
} from "../controllers/players.js";

const router = express.Router();


router.get("/",getPlayers)
router.get("/topscorer", topScorer)//returns the player with the highest sum of (ppg+3%+fg%)
router.get("/:id",getPlayer)





export default router;

// router.get("/test", (req,res)=> {
//     res.json("this is players")
// });

// router.get("/test", addPlayer);