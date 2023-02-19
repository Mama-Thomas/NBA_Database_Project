//this is database.js file

import mysql from "mysql2"

export const db = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"CSS47501",
    database:"nba"

})