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
api.put('/membermoney', function (req, res) {
    var sql = 'SELECT member_money  FROM member WHERE member_id=?;'    
    var sql1 = 'UPDATE member SET member_money=? where member_id=?;'   
    
    config.query(sql, [req.body.id],
        function (err, results, fields) {
            if (err) {
                console.log(err)
                res.send("修改失敗" + JSON.stringify(err))
            } else {
                var x = parseInt(results[0].member_money)+parseInt(req.body.money)
                config.query(sql1, [x,req.body.id],function(err, results, fields){
                    console.log(results)
                    res.send(results)
                })
                
            }
        })
        // console.log(x)
})
module.exports = api;