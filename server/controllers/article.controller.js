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

  // Retrieve a Writer
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
  // Retrieve all categories
  exports.findCategories = (req, res) => {
    article.getCategories((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving writer."
        });   
      else {

      //  let array = data; 
      // let object = array.reduce((prev, curr) => ({ ...prev, ...curr }), {}); 
          res.send(data);}
    });
  };
    // Retrieve Category Posts
    exports.findCategoryPosts = (req, res) => {
      article.getCategoryPosts(req.query.categoryID,(err, data) => {
        if (err)
          res.status(500).send({
            message:
              err.message || "Some error occurred while retrieving writer."
          });   
        else {
  
        //  let array = data; 
        // let object = array.reduce((prev, curr) => ({ ...prev, ...curr }), {}); 
            res.send(data);}
      });
    };
    // Retrieve all writer's popular posts
    exports.findWriterPopularPosts = (req, res) => {
      article.getWriterPopularPosts(req.query.writerID,(err, data) => {
        if (err)
          res.status(500).send({
            message:
              err.message || "Some error occurred while retrieving writer."
          });   
        else {
            res.send(data);}
      });
    };
        // Retrieve all writer's Latest posts
        exports.findWriterLatestPosts = (req, res) => {
          article.getWriterLatestPosts(req.query.writerID,(err, data) => {
            if (err)
              res.status(500).send({
                message:
                  err.message || "Some error occurred while retrieving writer."
              });   
            else {
                res.send(data);}
          });
        };
        // Retrieve all comments
        exports.findComments = (req, res) => {
          article.getComments(req.query.articleID,(err, data) => {
            if (err)
              res.status(500).send({
                message:
                  err.message || "Some error occurred while retrieving writer."
              });   
            else {
                res.send(data);}
          });
        };
                //Create a comment
                exports.createComment = (req, res) => {
                  article.newComment(
                    req.body.articleID,
                    req.body.userID,
                    req.body.commentContent,
                    (err, data) => {
                    if (err)
                      res.status(500).send({
                        message:
                          err.message || "Some error occurred while retrieving writer."
                      });   
                    else {
                      console.log('record inserted');
                     
                        res.send(data);}
                  });
                };