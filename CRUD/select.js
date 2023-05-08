var express = require('express');
var api = express.Router();
var config = require('./config.js')
api.get('/member/:id', function (req, res) {
    // res.send('123456');
    var sql = 'SELECT *  FROM member WHERE member_id=?;'
    config.query(sql, [req.params.id],
        function (err, result, fields) {
            if (err) {
                console.log(err)
                res.send('完蛋 出錯了' + err)
            } else {
                res.send(JSON.stringify(result));
            }
        })
})
api.get('/carstay', function (req, res) {
    var sql = `SELECT *  FROM carstay;`
    config.query(sql,
        function (err, result, fields) {
            if (err) {
                console.log(err)
                res.send(err + '完蛋 出錯了')
            } else {
                res.send(JSON.stringify(result));
            }
        })

})
api.get('/carstay/:id', function (req, res) {
    var sql = `SELECT *  FROM carstay WHERE sl_id=?;`
    config.query(sql, [req.params.id],
        function (err, result, fields) {
            if (err) {
                console.log(err)
                res.send('完蛋 出錯了' + err)
            } else {
                res.send(JSON.stringify(result));
            }
        })
})
api.get('/traffic/:id', function (req, res) {
    var sql = `SELECT * FROM traffic WHERE parkingLot_id =?`
    config.query(sql, [req.params.id],
        function (err, result, fields) {
            if (err) {
                console.log(err)
                res.send('完蛋 出錯了' + err)
            } else {
                res.send(JSON.stringify(result));
            }
        })
})


module.exports = api;