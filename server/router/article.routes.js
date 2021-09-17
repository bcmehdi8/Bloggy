module.exports = app => {
    const articles = require("../controllers/article.controller"); 
    // Retrieve all Customers
    app.get("/getUser", articles.findAll);

  };