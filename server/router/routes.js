const express = require('express');
const router = express.Router();
const {createdb,createtb, createusr} = require('../logic/queries');

router.get('/createdb', createdb);
router.get('/createTable', createtb);
router.get('/createUser', createusr)


module.exports = router;
