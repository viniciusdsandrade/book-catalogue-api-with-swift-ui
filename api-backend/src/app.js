require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");

const itemRoutes = require("./routes/items");

const app = express();
const PORT = process.env.PORT || 5000;


app.use(bodyParser.json());


app.use("/items", itemRoutes);


app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
