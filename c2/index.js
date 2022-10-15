const express = require("express")
const app = express()

app.get("/", (req,res) => {
    res.send(`<h2>Thank you for this oppertunity! You're now listening to PORT ${port} with BASE_URL: ${baseURL}</h2>`)
})

const port = process.env.PORT || 3333
const baseURL = process.env.BASE_URL || ""

const router = require('./routes')

app.use(`${baseURL}`, router)

app.listen(port, () => console.log(`PORT/BASE_URL: ${port}${baseURL}`))
