const sqlserver = require("../server/db");
const express = require('express');
const app = express();
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

module.exports = {

      getLatestPosts : async (req, res, next)=>{
        let sql = "SELECT * FROM articles";
        // execute query
        const articles = await sqlserver.query(sql, (err, result)=>{
        if(err) {throw err};
          //console.log(result);
          res.json({message :"articles"})
          next();
        });
      }
}