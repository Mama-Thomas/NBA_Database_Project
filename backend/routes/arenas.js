//this is the route file for the arenas.js
import express from "express";
import { getArenas, getArena, addArena } from "../controllers/arenas.js";

const router = express.Router();

router.get("/", getArenas);
router.get("/:id", getArena);
router.post("/", addArena);


export default router;
