const sql = require("../server/db");
jwt = require("jsonwebtoken");
var crypto = require('crypto');
// not really that good as a secret key
const KEY = "m yincredibl y(!!1!11!)<'SECRET>)Key'!";
// constructor
const User = function(user) {
  this.username = user.username;
  this.email = user.email;
  this.password = user.password;
  this.readTime = user.readTime;
  this.date = user.date;
};


//Login Proccess
User.findUser = (email,password,res,result) => {
    console.log(email+ " attempted login");
    var passwordCrypted = crypto.createHash('sha256').update(password).digest('hex');
    sql.query("SELECT * FROM users WHERE userEmail='"+email+"' AND userPassword='"+passwordCrypted+"'", (err, row) => {
      if(row != undefined ) {
        var payload = {
          userEmail: email,
        };

  var token = jwt.sign(payload, KEY, {algorithm: 'HS256', expiresIn: "15d"});

  console.log("Token Success");
 // res.send(token);

      }

      if (err) {
        console.log("error: ", err);
        res(err, null);
        return;
      }
  
      console.log(email+" LoggedIn ");
      res(null, {email,token});
    });
  };



  //Create user
  User.createUser = (username,email,password,res, result) => {
    console.log(email+ " attempted login, And Name is " +username);
    var ImageURL = "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"
    var passwordCrypted = crypto.createHash('sha256').update(password).digest('hex');
    sql.query("INSERT INTO users (userName,userImage,userEmail,userPassword) VALUES ('"+username+"','"+ImageURL+"','"+email+"','"+passwordCrypted+"')", (err, row) => {
        if(row != undefined ) {
            var payload = {
              userName: username,
            };

      var token = jwt.sign(payload, KEY, {algorithm: 'HS256', expiresIn: "15d"});
    
      console.log("Token Success");
     // res.send(token);
    
        }if (err) {
        console.log("error: ", err);
        console.error("Failure");
        res.status(401)
        res.send("There's no user matching that");
        return;
      }
      result(null, {username,email,token});
   });
  };
  module.exports = User;