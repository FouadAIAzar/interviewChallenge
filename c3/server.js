const express = require("express")
const app = express();

const mongoose = require("mongoose")
const cors = require("cors")
app.set('view engine', 'ejs')

const {
    MONGO_USER,
    MONGO_PASSWORD,
    MONGO_IP,
    MONGO_PORT,
} = require("./config");

const postRouter = require("./routes/postRoutes")

const mongoURL = `mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`;


const tryAgain = () => {
    mongoose
        .connect(mongoURL)
        .then(() => console.log(`succesfully connected to ${MONGO_IP} database`))
        .catch((e) => {
        console.log(e);
        setTimeout(connectWithRetry, 5000);
    });
};

tryAgain();
app.enable("trust proxy")
app.use(cors({}));
app.use(express.json())

app.get("/", (req,res) => {
    res.send("<h1>I AM SERVER A</h1>")
})

//localhost:${MONGO_IP}
app.use(`/${MONGO_IP}`, postRouter)

const health = require('express-ping');
app.use(health.ping());

const port = process.env.PORT || 3000

app.listen(port, () => console.log(`PORT: ${port}`))