const sql = require("../server/db");

// constructor
const Article = function(article) {
  this.id = article.id;
  this.image = article.image;
  this.title = article.title;
  this.readTime = article.readTime;
  this.date = article.date;
};

Article.getAll = result => {
  sql.query("SELECT  id, image, title, readTime, date FROM articles ", (err, res) => {
   // SELECT JSON_ARRAY('Hot', 'Warm', 'Cold') AS 'Result';
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("articles : ", res);
    result(null, res);
  });
};



module.exports = Article;