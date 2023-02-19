//this is the route file for the player.js
import express from "express";
import {getPlayers,getPlayer,addPlayer,deletePlayer,updatePlayer} from "../controllers/players.js";

const router = express.Router();


router.get("/",getPlayers)
router.get("/:id",getPlayer)
router.post("/", addPlayer)
router.delete("/:id",deletePlayer)
router.put("/:id", updatePlayer);


export default router;

// router.get("/test", (req,res)=> {
//     res.json("this is players")
// });

// router.get("/test", addPlayer);