//this is the route file for the teams.js
import express from "express";
import {
  getGMs,
  getGM,
  addGM,
  deleteGM,
  updateGM,
} from "../controllers/gms.js";

const router = express.Router();

router.get("/", getGMs);
router.get("/:id", getGM);
router.post("/", addGM);
router.delete("/:id", deleteGM);
router.put("/:id", updateGM);

export default router;
