const article = require("../logic/article.model");


// Retrieve all Customers from the database.
exports.findAll = (req, res) => {
    article.getAll((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving customers."
        });
      else {
          res.send(data);}
    });
  };

  // Retrieve all Customers from the database.
exports.findArticle = (req, res) => {
  article.getAll((err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving customers."
      });
    else {
        res.send(data);}
  });
};