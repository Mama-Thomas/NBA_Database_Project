//this is the route file for the teams.js
import express from "express";
import {
  getGMs
} from "../controllers/gms.js";

const router = express.Router();

router.get("/", getGMs);

export default router;
