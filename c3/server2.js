const express = require("express")
const app = express();

app.get("/", (req,res) => {
    res.send("<h1>I AM SERVER B</h1>")
})

const port =  3001

import isPortReachable from './node_modules/is-port-reachable.js';

console.log(await isPortReachable(80, {host: 'google.com'}));


app.listen(port, () => console.log(`PORT: ${port}`))