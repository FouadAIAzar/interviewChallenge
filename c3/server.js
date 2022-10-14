const express = require("express")
const app = express();

const mongoose = require("mongoose")

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
        .then(() => console.log(`succesfully connected to ${MONGO_IP}`))
        .catch((e) => {
        console.log(e);
        setTimeout(connectWithRetry, 5000);
    });
};

tryAgain();
app.enable("trust proxy")

app.use(express.json())

app.get("/", (req,res) => {
    res.send("<h1>NGINX</h1>")
})

//localhost:${MONGO_IP}
app.use(`/${MONGO_IP}`, postRouter)

function logger(req,res,next){
    console.log(req.originalUrl)
    next()
}

const port = process.env.PORT || 3000

app.listen(port, () => console.log(`PORT: ${port}`))