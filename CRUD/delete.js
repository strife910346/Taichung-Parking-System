var express = require('express');
var api = express.Router();
var config = require('./config.js')
api.get('/:id',function(req,res){
    // res.send('123456');
    var sql ='DELETE FROM pokemon WHERE id=?;'
    config.query(sql,[req.params.id],
        function(err,result,fields){
            // console.log(err);
            // console.log(result.insertId);
            // console.log(result.affectedRows);
            // console.log(fields);
    })
    res.send("刪除成功");
})
api.delete('/',function(req,res){
    console.log('delete');
    // res.send('delete');
    console.log(req.body.id)
    var sql ='DELETE FROM pokemon WHERE id=?;'
    config.query(sql,[req.body.id],
        function(err,result,fields){
            if(err){
                res.send("刪除失敗"+ JSON.stringify(err))
            }else{
                res.send("刪除成功")
            }
    })
    // res.send("刪除成功");
})
module.exports = api;