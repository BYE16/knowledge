//index.js是Express服务器入口文件
const http = require('http');
const badyParser = require('body-parser');
const express = require('express');
const drugApi = require('./api/drugApi');
const knowledgeApi = require('./api/knowledgeApi');
const knowledgeUploadApi = require('./api/knowledgeUploadApi')

let app = express();
let server = http.createServer(app);
// 解析body数据
app.use(express.json())

app.use('/img', express.static(__dirname + '/img'))
    //下面是为了接受http请求服务器本地文件做的设置！重要！
app.get('/img/*', function(req, res) {
    res.sendFile(__dirname + "/" + req.url);
    console.log("Request for " + req.url + " received.");
})

app.use('/file', express.static(__dirname + '/file'))
    //下面是为了接受http请求服务器本地文件做的设置！重要！
app.get('/file/*', function(req, res) {
    res.sendFile(__dirname + "/" + req.url);
    console.log("Request for " + req.url + " received.");
})

app.use(badyParser.json());
app.use(badyParser.urlencoded({
    extended: false
}));


// 后端api路由
app.use('/api/drug', drugApi);
app.use('/api/knowledge', knowledgeApi);
app.use('/api/knowledgeUpload', knowledgeUploadApi);

// 启动监听8888端口。
server.listen(3300, () => {
    console.log(' success!! port:3300')
})