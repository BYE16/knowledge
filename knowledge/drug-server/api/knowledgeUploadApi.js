//musicUploadApi.js是http请求路由为’ /api/musicUpload’时的js处理文件
const express = require('express');
const router = express.Router();
const sql_Knowledge = require('../sqlMap_Knowledge');
const DBHelper_Knowledge = require('../utils/DBHelper_Knowledge');
const app = express()
const multer = require('multer')
const upload = multer({ dest: __dirname + '/../file' })
    // 该中间件将文件赋值到req.file
router.post('/updateknowledgefile', upload.single('file'), async(req, res) => {
    const file = req.file
    let id = req.query.id;
    console.log("enter normal")
    console.log(id)
    console.log(req.file.originalname)
    console.log(file.filename)
    let f = "/file/" + file.filename;
    console.log(f)
    let sqlStr = sql_Knowledge.knowledge.updateknowledgefile;
    let conn = new DBHelper_Knowledge().getConn();
    conn.query(sqlStr, [file, id], (err, result) => {
        if (err) {
            res.json(sqlStr + " " + err);
        } else {
            res.json(result)
        }
    });
    conn.end();
})
module.exports = router;