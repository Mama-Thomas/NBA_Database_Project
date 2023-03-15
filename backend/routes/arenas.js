//this is the route file for the arenas.js
import express from "express";
import { getArenas } from "../controllers/arenas.js";

const router = express.Router();

router.get("/", getArenas);



export default router;
