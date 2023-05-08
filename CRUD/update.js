var express = require('express');
var api = express.Router();
var config = require('./config.js')
api.get('/:id/:memo', function (req, res) {
    var sql = 'update pokemon set memo =?, pokedate=now() where id =?;'
    config.query(sql, [req.params.memo, req.params.id],
        function (err, result, fields) {
            // console.log(err);
            // console.log(result.insertId);
            // console.log(result.affectedRows);
            // console.log(fields);
        })
    res.send("修改成功");
})
api.put('/', function (req, res) {
    var sql = 'UPDATE pokemon SET memo=? where id =?;'    
    config.query(sql, [req.body.memo, req.body.id],
        function (err, results, fields) {
            if (err) {
                res.send("修改失敗" + JSON.stringify(err))
            } else {
                res.send("修改成功")
            }
        })
})
module.exports = api;