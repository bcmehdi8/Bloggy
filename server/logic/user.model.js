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
    var username;
    var passwordCrypted = crypto.createHash('sha256').update(password).digest('hex');


    sql.query("SELECT * FROM users WHERE userEmail='"+email+"'", (err, rez) => {
      console.log("1st Result Length type is : "+rez.length)
      if(err) {
        console.log(err);
       };
       if(rez.length>0){
       
        sql.query("SELECT * FROM users WHERE userEmail='"+email+"' AND userPassword='"+passwordCrypted+"'", (err, rezz) => {
          console.log("The FULL EMAIL : "+email+" , RAW Password : "+password+", CTYPTED Password : "+passwordCrypted)
          console.log("2nd Result Length type is : "+rezz.length)
          if(rezz.length == 0) {
           return  res(null, {message:'PWD_ISSUE'});
          }
          else if(rezz.length > 0) {
            username = rezz[0]['userName'];
            var payload = {
             // userName: username,
              userEmail: email,
            };
                  var token = jwt.sign(payload, KEY, {algorithm: 'HS256', expiresIn: "15d"});
                  console.log("Token Success");
                  console.log("username : "+username+", email : "+email+" LoggedIn With following Token : "+token);
                  res(null, {username,email,token, message:'DONE'});
                 // res.send(token);
          }
          else if (err) {
            console.log("error: ", err);
            res(err, null);
            return;
          }
          
        });

       }else if(rez.length ==0){
         res(null, {message:'EMAIL_ISSUE'});
       }})

  };



  //Create user
  User.createUser = (username,email,password,res, result) => {

    console.log(email+ " attempted login, And Name is " +username);
    var ImageURL = "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"
    var passwordCrypted = crypto.createHash('sha256').update(password).digest('hex');

    sql.query("SELECT * FROM users WHERE userEmail='"+email+"'", (err, res) => {
      if(err) {
        console.log(err);
       };
       if(res.length>0){
         return result(null, {message:'OLD'});
       }else{

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
      result(null, {username,email,token,message:'NEW'});
   });

  }}
  
  )};

  module.exports = User;