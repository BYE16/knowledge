//drugApi.js是http请求路由为’ /api/drug’时的js处理文件
const express = require('express');
const router = express.Router();
const sql_Drug = require('../sqlMap_Drug');
const DBHelper_Knowledge = require('../utils/DBHelper_Knowledge');
// 查询所有歌手
router.post('/getalldrugs', (req, res) => {
    let sqlStr = sql_Drug.drug.getdrugs;
    let conn = new DBHelper_Knowledge().getConn();
    conn.query(sqlStr, (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// 删除一个歌手
router.post('/deletedrug', (req, res) => {
    let sqlStr = sql_Drug.drug.deletedrug;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    conn.query(sqlStr, [params.id], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
//添加一个药品
router.post('/adddrug', (req, res) => {
    let sqlStr = sql_Drug.drug.adddrug;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    console.log(params);
   
conn.query(sqlStr, [params.name, params.brand, params.introduction], (err, result) => {
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});

router.post('/updatedrug', (req, res) => {
    let sqlStr = sql_Drug.drug.updatedrug;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    console.log(params);
     
    conn.query(sqlStr, [params.name, params.brand, params.introduction, params.id], (err, result) => {
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
module.exports = router;