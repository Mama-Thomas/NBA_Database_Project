//this is the route file for the teams.js
import express from "express";
import {
  getTeams,
  getTeam,
  getTeamPlayers,
  addTeam,
  deleteTeam,
  updateTeam,
} from "../controllers/teams.js";

const router = express.Router();

router.get("/", getTeams);
router.get("/:id", getTeam);
// Route for getting all players of a team
router.get("/:id/players", getTeamPlayers);
router.post("/", addTeam);
router.delete("/:id", deleteTeam);
router.put("/:id", updateTeam);

export default router;
