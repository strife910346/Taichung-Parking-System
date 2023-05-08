var express = require('express');
var api = express.Router();
var config = require('./config.js')
api.post('/carstay',function(req,res){
    // res.send('123456');
    var sql ='INSERT INTO carstay (sl_id,cs_name,cs_type,cs_water,cs_toilet,cs_lng,cs_lat) VALUES (?,?,?,?,?,?,?)'
    config.query(sql,[req.body.id,req.body.name,req.body.type,req.body.water,req.body.toilet,req.body.lng,req.body.lat],
        function(err,result,fields){
            // console.log(err);
            // console.log(result.insertId);
            // console.log(result.affectedRows);
            // // console.log(fields);
    })
    res.send("新增成功");
})
module.exports = api;