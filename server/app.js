const express = require('express');
//const queryRoute = require('./router/routes');
const {getLatestPosts} = require('./logic/queries');
const routing = require('./router/article.routes')
const articles = require("./controllers/article.controller"); 


const app = express();

//JSON-Parser
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

//Create User
app.get('/getUser', articles.findAll)
//Create User
app.get('/getWriter', articles.findWriter)

app.listen(3000);

module.exports = app;