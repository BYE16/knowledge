//knowledgeApi.js是http请求路由为’ /api/knowledge’时的js处理文件
const express = require('express');
const router = express.Router();
const sql_Knowledge = require('../sqlMap_Knowledge');
const DBHelper_Knowledge = require('../utils/DBHelper_Knowledge');
// 查询所有知识
router.post('/getallknowledgetext', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.getknowledgetext;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    console.log(params.name);
    conn.query(sqlStr, [params.name], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// 查询所有知识
router.post('/getallknowledgefile', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.getknowledgefile;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    console.log(params.name);
    conn.query(sqlStr, [params.name], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// 删除一条知识文本信息
router.post('/deleteknowledgetext', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.deleteknowledgetext;
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
// 删除一条知识文件信息
router.post('/deleteknowledgefile', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.deleteknowledgefile;
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
//添加一条知识文本信息
router.post('/addknowledgetext', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.addknowledgetext;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    console.log(params);
    //name,text
    conn.query(sqlStr, [params.name, params.text], (err, result) => {
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// //添加一条知识文件信息
// router.post('/addknowledgefile', (req, res) => {
//     let sqlStr = sql_Knowledge.knowledge.addknowledgefile;
//     let conn = new DBHelper_Knowledge().getConn();
//     let params = req.body;
//     console.log(params);
//     //name,file
//     conn.query(sqlStr, [params.name, params.file], (err, result) => {
//         if (err) {
//             res.json(sqlStr + " " + err);
//         } else {
//             res.json(result)
//         }
//     });
//     conn.end();
// });
router.post('/updateknowledge', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.updateknowledge;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    console.log(params);
    //text,id    
    conn.query(sqlStr, [params.text, params.id], (err, result) => {
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// router.post('/updateknowledgefile', (req, res) => {
//     let sqlStr = sql_Knowledge.knowledge.updateknowledgefile;
//     let conn = new DBHelper_Knowledge().getConn();
//     let params = req.body;
//     console.log(params);
//     //file,id    
//     conn.query(sqlStr, [params.file, params.id], (err, result) => {
//         if (err) {
//             res.json(sqlStr + " " + err);
//         } else {
//             res.json(result)
//         }
//     });
//     conn.end();
// });

// 查询当前用户所有的待办事项
router.post('/getallthings', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.getthings;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    console.log(params.name);
    conn.query(sqlStr, [params.name], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// 改变text的收藏状态
router.post('/updatetextflag', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.updateknowledgetextflag;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    conn.query(sqlStr, [params.text_flag, params.id], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// 改变file的收藏状态
router.post('/updatefileflag', (req, res) => {
    let sqlStr = sql_Knowledge.knowledge.updateknowledgefileflag;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    conn.query(sqlStr, [params.file_flag, params.id], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});

// 登录
router.post('/login', (req, res) => {
    let sqlStr = sql_Knowledge.user.login;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    conn.query(sqlStr, [params.name, params.password], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
// 注册
router.post('/adduser', (req, res) => {
    let sqlStr = sql_Knowledge.user.adduser;
    let conn = new DBHelper_Knowledge().getConn();
    let params = req.body;
    conn.query(sqlStr, [params.name, params.email, params.password], (err, result) => {
        if (err) {
            res.json(err);
        } else {
            res.json(result)
        }
    });
    conn.end();
});
module.exports = router;