//this is the index.js of the backend

import express from "express";
import playersRoutes from "./routes/players.js";
import teamsRoutes from "./routes/teams.js";
import gmsRoutes from "./routes/gms.js";
import coachesRoutes from "./routes/coaches.js";
import awardsRoutes from "./routes/awards.js";
import arenasRoutes from "./routes/arenas.js";



const app = express()

app.use(express.json())


app.use("/backend/players", playersRoutes);
app.use("/backend/teams", teamsRoutes);
app.use("/backend/gms", gmsRoutes);
app.use("/backend/coaches", coachesRoutes);
app.use("/backend/awards", awardsRoutes);
app.use("/backend/arenas", arenasRoutes);

app.use((req, res, next) => {
    console.error(req);
    res.status(404).send('not found')
})
app.listen(8000,()=>{
    console.log("Connected!")
})

// app.get("/test", (req, res)=> {
//     res.json("Works!")
// })