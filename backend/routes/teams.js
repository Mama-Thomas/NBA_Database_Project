//this is the route file for the teams.js
import express from "express";
import {
  getTeams,
  getTeam,
  getTeamPlayers,
  
  hppgPlayer,
  hChamps,
  hOffrt,
  hiddenGemTopTeam,
  defPlayerDefTeam,
} from "../controllers/teams.js";

const router = express.Router();

router.get("/", getTeams);
router.get("/hppg", hppgPlayer);//atlanta hawks player with the highest ppg
router.get("/h5offrt", hOffrt);// the 5 teams with the highest offensive ratings
router.get("/hgtt", hiddenGemTopTeam);
router.get("/hchamps", hChamps);// the team with the highest number of championships
router.get("/dfpdft", defPlayerDefTeam);// the player with highest stl and blocks in the highest deffensive team.
router.get("/:id", getTeam);
router.get("/:name/players", getTeamPlayers);// Route for getting all players of a team
// router.get("/:id/hppg", hppgPlayer);//atlanta hawks player with the highest ppg





export default router;
