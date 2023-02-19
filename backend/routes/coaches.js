//this is the route file for the teams.js
import express from "express";
import {
  getCoaches,
  getCoach,
  addCoach,
  deleteCoach,
  updateCoach,
} from "../controllers/coaches.js";

const router = express.Router();

router.get("/", getCoaches);
router.get("/:id", getCoach);
router.post("/", addCoach);
router.delete("/:id", deleteCoach);
router.put("/:id", updateCoach);

export default router;
