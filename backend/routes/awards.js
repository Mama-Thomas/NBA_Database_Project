//this is the route file for the awards.js
import express from "express";
import {
  getAwards,


} from "../controllers/awards.js";

const router = express.Router();

router.get("/", getAwards);


export default router;
