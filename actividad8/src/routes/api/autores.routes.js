const router = require('express').Router();

const { getAllAuthors, createAuthors } = require('../../controllers/autores.controller');


router.get("/", getAllAuthors)
router.post("/", createAuthors)


module.exports = router;