const router = require('express').Router();

const { getAllPosts, createPosts, getPostById } = require('../../controllers/posts.controller');


router.get("/", getAllPosts)
router.get("/author/:authorId", getPostById)
router.post("/", createPosts)


module.exports = router;