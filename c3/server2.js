// Express
const express = require("express")
const app = express();

// Define Port
const port =  3001

// Send to Test
app.get("/", (req,res) => {
    res.send("<h1>I AM SERVER B</h1>")
})

// Listen to Port
app.listen(port, () => console.log(`PORT: ${port}`))