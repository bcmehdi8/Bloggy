const mysql = require("mysql");
  // Create Connection
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "blogging"
  });
  
  // Connect DB
  connection.connect(function(err) {
    if (err) throw err;
    console.log("MySQL Connected!");
  });
  module.exports = connection;