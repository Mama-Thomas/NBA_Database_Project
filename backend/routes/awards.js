//this is the route file for the awards.js
import express from "express";
import {
  getAwards,
  getAward,

} from "../controllers/awards.js";

const router = express.Router();

router.get("/", getAwards);
router.get("/:id", getAward);


export default router;
