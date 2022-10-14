const express = require("express")
const { post } = require("request")
const postController = require("../controllers/postController")
const router = express.Router()

//localhost:${PORT}
router.route("/").get(postController.getAllPosts).post(postController.createPost).purge()

router.route("/:id").get(postController.getOnePost).patch(postController.updatePost).delete(postController.deletePost)

module.exports = router;