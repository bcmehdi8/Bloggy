const mysql = require("mysql");
const dbConfig = require("./db.config.js");
  // Create Connection
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "blogging"
  });
  
  // Connect
  connection.connect(function(err) {
    if (err) throw err;
    console.log("MySQL Connected!");
  });
  module.exports = connection;
  