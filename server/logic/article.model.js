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
  sql.query("SELECT * FROM articles ", (err, res) => {
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

Article.getWriter = (writerID,result) => {
  sqla = "SELECT * FROM writer WHERE writerID ='"+writerID+"' LIMIT 1";
  sql.query(sqla, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    console.log("The writer ID info is :"+ writerID);
    result(null, res);
  });
};

Article.getCategories = (result) => {
  sql.query("SELECT * FROM category ", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    result(null, res);
  });
};

Article.getWriterPopularPosts = (writerID,result) => {
  sqla = "SELECT * FROM articles WHERE writerID ='"+writerID+"' ORDER BY views DESC LIMIT 3;";
  sql.query(sqla, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    result(null, res);
  });
};

Article.getComments = (articleID,result) => {
  sqla = "SELECT `commentID`, `articleID`, `userName`,`userImage`, `commentContent`, `commentDate`, `commentLikes`, `commentReplies` FROM comment INNER JOIN users ON comment.userID = users.userID WHERE articleID='"+articleID+"' ";
  sql.query(sqla, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    result(null, res);
  });
};


Article.newComment = (articleID, userID, commentContent, result) => {
  sql.query("INSERT INTO comment(articleID, userID, commentContent, commentLikes, commentReplies) VALUES('"+articleID+"','"+userID+"','"+commentContent+"',0,0) ", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("created comment ");
    result(null, { result});
  });
};



module.exports = Article;