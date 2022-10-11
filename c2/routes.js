const express = require("express")
const router = express.Router()

router.get("/foo", (req, res) =>{
    res.json({ response: "Hello" })
})

router.get("/bar", (req, res) =>{
    res.json({ response: "World" })
})

router.get("/foobar", (req, res) =>{
    res.json({ response: "Hello World" })
})

module.exports = router