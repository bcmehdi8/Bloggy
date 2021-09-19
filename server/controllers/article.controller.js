const article = require("../logic/article.model");


// Retrieve all Customers from the database.
exports.findAll = (req, res) => {
    article.getAll((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving articles."
        });
      else {
          res.send(data);}
    });
  };

  // Retrieve all Customers from the database.
exports.findWriter = (req, res) => {
  article.getWriter(req.query.writerID,(err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving writer."
      });   
    else {
      let array = data;

      let object = array.reduce((prev, curr) => ({ ...prev, ...curr }), {});
      
      console.log(object);

        res.send(object);}
  });
};