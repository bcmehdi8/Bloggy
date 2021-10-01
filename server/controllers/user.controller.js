const user = require("../logic/user.model");

         //check user
        exports.checkUser = (req, res) => {
             user.findUser(                
               req.body.email,
               req.body.password,
                (err, data) => {
                    if (err)
                    res.status(500).send({
                      message: err.message || "Some error occurred while retrieving writer."
                          });   
                       else {
                  
                             res.send(data);}
                               });
                                  };




                //Create new user
                exports.newUser = (req, res) => {
                  user.createUser(
                    req.body.username,
                    req.body.email,
                    req.body.password,
                    res,
                    (err, data) => {
                    if (err)
                      res.status(500).send({
                        message:
                          err.message || "Some error occurred while retrieving writer."
                      });   
                    else {
                 
                     
                        res.send(data);}
                  });
                };