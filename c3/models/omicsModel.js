const mongoose = require("mongoose");
const { post } = require("request");

const postSchema = new mongoose.Schema({
    name: {
        type: String,
        require: [true, "Omic must have name"]
    },
    molecularWeight: {
        type: String,
        required: [true, "Omic must have molecularWeight"]
    }
});

const Post = mongoose.model("Post", postSchema);
module.exports = Post;