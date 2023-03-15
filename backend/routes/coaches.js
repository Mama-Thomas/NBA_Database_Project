//this is the route file for the teams.js
import express from "express";
import {
  getCoaches
} from "../controllers/coaches.js";

const router = express.Router();

router.get("/", getCoaches);

export default router;
