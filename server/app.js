const express = require('express');
const articles = require("./controllers/article.controller"); 
const user = require("./controllers/user.controller"); 


const app = express();

//JSON-Parser
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

//Register User
app.post('/auth/createUser', user.newUser)
//Login Checker
app.post('/auth/login', user.checkUser)
//Find All Articles
app.get('/getUser', articles.findAll)
//Get a Specific Writer
app.get('/getWriter', articles.findWriter)
//Get Categories
app.get('/getCategories', articles.findCategories)
//Get Category's Posts
app.get('/getCategoryPosts', articles.findCategoryPosts)
//Get Writer's Popular Posts
app.get('/getWriterPopularPosts', articles.findWriterPopularPosts)
//Get Writer's Latest Posts
app.get('/getWriterLatestPosts', articles.findWriterLatestPosts)
//Get Post's Comments
app.get('/getComments', articles.findComments)
//insert Post's Comment
app.post('/postComment', articles.createComment)

app.listen(3000);

module.exports = app;