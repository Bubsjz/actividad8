// Creation and configuration of the Express APP
const express = require('express');

const app = express();
app.use(express.json());

// Route configuration
app.use("/api", require("./routes/api.routes"));


// Error handler
app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).json(err);
})

module.exports = app;