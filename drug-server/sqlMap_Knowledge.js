//sqlMap_Knowledge.js文件用于统一设置SQL语句映射，以供http请求处理文件调用使用，这样便于修改维护SQL语句
// sql语句
var sqlMap = {
    knowledge: {
        getknowledgetext: 'select * from text where name=?', //1
        updateknowledgetext: 'update text set text=? where id=?',
        updateknowledgefile: 'update file set file=? where id=?',
        deleteknowledgetext: 'delete from text where id=?',
        deleteknowledgefile: 'delete from file where id=?',
        addknowledgetext: 'insert into text(name,text) values(?,?)', //name为获取当前的用户
        // addknowledgefile: 'insert into file(name,file) values(?,?)' //name为获取当前的用户
        getthings: 'select * from thing where name=?', //1
        getknowledgefile: 'select * from file where name=?', //1
        updateknowledgetextflag: 'update text set text_flag = ? where id=?', //1
        updateknowledgefileflag: 'update file set file_flag = ? where id=?', //1
        updateknowledgethingflag: 'update thing set thing_flag = ? where id=?', //1
    },
    user: {
        login: 'select * from user where name=? and password=?',
        adduser: 'insert into user(name,email,password) values(?,?,?)'
    }
}
module.exports = sqlMap;