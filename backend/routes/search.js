import express from "express";

import { searchNames } from "../controllers/search.js";

const router = express.Router();

router.get("/", searchNames);

export default router;

