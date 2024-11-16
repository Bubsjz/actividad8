const mysql = require('mysql2');
require('dotenv').config();


// const pool = mysql.createPool({
//     host: process.env.HOST,
//     user: process.env.USER,
//     password: process.env.PASSWORD,
//     port: process.env.PORT,
//     database: process.env.DATABASE,
// });

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_USER,
    database: process.env.DB_DATABASE,
});


module.exports = pool.promise();