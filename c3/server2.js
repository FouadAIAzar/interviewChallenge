const express = require("express")
const app = express();

app.get("/", (req,res) => {
    res.send("<h1>I AM SERVER B</h1>")
})

const port =  3001

app.listen(port, () => console.log(`PORT: ${port}`))