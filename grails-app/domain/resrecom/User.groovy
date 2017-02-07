package resrecom

class User {


    String username
    String password
    String emailaddress
    String address
    String image
    String typeofuser

    static constraints = {
        emailaddress email: true, unique: true, blank: false;
        password size:1..15, blank:false;
        typeofuser inList: ["user","owner","admin"];

    }

}
