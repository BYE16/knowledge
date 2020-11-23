//sqlMap_Music.js文件用于统一设置SQL语句映射
// sql语句
var sqlMap = {
    drug: {
        getdrugs: 'select * from book',
        updatedrug: 'update book set name=?,brand=?,introduction=? where id=?',
        deletedrug: 'delete from book where id=?',
        adddrug: 'insert into book(name,brand,introduction) values(?,?,?)'
    }
}
module.exports = sqlMap;