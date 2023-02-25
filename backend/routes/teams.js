//this is the route file for the teams.js
import express from "express";
import {
  getTeams,
  getTeam,
  getTeamPlayers,
  addTeam,
  // deleteTeam,
  // updateTeam,
  hppgPlayer,
  hChamps,
  hOffrt,
  hiddenGemTopTeam,
  defPlayerDefTeam,
} from "../controllers/teams.js";

const router = express.Router();

router.get("/", getTeams);
router.get("/h5offrt", hOffrt);// the 5 teams with the highest offensive ratings
router.get("/hgtt", hiddenGemTopTeam);
router.get("/hchamps", hChamps);// the team with the highest number of championships
router.get("/dfpdft", defPlayerDefTeam);// the player with highest stl and blocks in the highest deffensive team.
router.get("/:id", getTeam);
router.get("/:id/players", getTeamPlayers);// Route for getting all players of a team
router.get("/:id/hppg", hppgPlayer);//atlanta hawks player with the highest ppg




router.post("/", addTeam);
// router.delete("/:id", deleteTeam);
// router.put("/:id", updateTeam);

export default router;
