//DBHelper_Music.js用来连接MySQL数据库
// 数据库连接助手
const mysql = require('mysql');
class DBHelper_Knowledge {
    // 获取数据库连接
    getConn() {
        let conn = mysql.createConnection({
            // 数据库连接配置
            host: 'localhost',
            port: '3306',
            user: 'root',
            password: 'root',
            database: 'knowledge' // 数据库名
        });
        conn.connect();
        return conn;
    }
}
module.exports = DBHelper_Knowledge;