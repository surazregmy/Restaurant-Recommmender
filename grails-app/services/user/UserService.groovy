package user

import grails.transaction.Transactional
import groovy.sql.Sql
import resrecom.User

@Transactional
class UserService {
    def dataSource

    def serviceMethod() {

    }

    def returnUser(User user,String staus){

        println user.username
        def currentuser = User.findByEmailaddressAndPassword(user.emailaddress,user.password)

        if(staus.equals("login")) {
            if (currentuser) {
                return currentuser.typeofuser;
            }
        }

        else if(staus.equals("session")){
            return currentuser.id;
        }

    }

    def insertUser(email,password,typeofuser){
        println("Email is "+ email)
        def db = new Sql(dataSource)

        def temp = db.rows("Select * from user where  emailaddress=${email}")
        if (temp.size()==1){
            println("Duplicate User")
            return false

        }
        else {
            println email
            def inserttemp = db.execute("insert into user(emailaddress,password,typeofuser,address,image,username,version) values(${email},${password},${typeofuser},'','','',0)")
            if(inserttemp){
                println(" THe insert is done! COngrats-->")
            }
        }


    }


}
