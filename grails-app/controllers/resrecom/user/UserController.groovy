package resrecom.user

import resrecom.User

class UserController {

    def UserService

    def index() { }

    def login(){

        params.password = params.password.encodeAsMD5();
        User user = new User(params);
        println user.emailaddress;
        println user.password;


        def status = UserService.returnUser(user,"login")

        if(status){
            if(status=="owner"){
                session["user_id"] = UserService.returnUser(user,"session")
                session["user_name"] = user.username;
                session["user_email"] = user.emailaddress;

                println("THe email address "+ user.emailaddress)

                //render(view: "ownerhome.gsp")
                redirect(controller: 'owner', action: 'myrestaurant')
            }

            else {

                session["user_id"] = UserService.returnUser(user,"session")
                session["user_name"] = user.username;
                session["user_email"] = user.emailaddress;
                println("The user name  is "+session["user_name"])
                println "THe user id in session is "+session["user_id"]
                redirect(controller: 'Restaurant',action: 'rateRestaurants')



            }
        }
        else {

            render(view: "/index.gsp")

        }
    }
    def editProfile(){
            render(view: "user_editprofile.gsp")
    }

    def signup(){

        def hashcontent = params.password.encodeAsMD5();
        println("Hascontent is "+ hashcontent);
        def temp = UserService.insertUser(params.emailaddress,hashcontent, params.typeofuser)
        render(view: "/index.gsp")



    }

    def logout(){
        session.invalidate();
        redirect(action: 'login');
        //render(view: "/index.gsp")
    }

}
