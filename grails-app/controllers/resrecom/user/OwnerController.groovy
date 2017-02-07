package resrecom.user

import groovy.sql.Sql
import resrecom.Restaurant

class OwnerController {
    def OwnerService
    def RestaurantService
    def dataSource

    def index() { }

    def myrestaurant(){
        //render(view: "owner_insert.gsp")
        def user_id = session.user_id
        println("THe user id "+ user_id)
        def restaurantrow =RestaurantService.returnOneRestaurantforOwner(user_id)
        render(view:"owner_viewmyrestaurant", model: ['myrestaurant':restaurantrow]);
    }

    def owner_insert(){

    }


    def insertrestaurant(){

       def restaurantInstance = new Restaurant(params)
        def restaurantImage = request.getFile("phototemp")
        restaurantInstance.photo = restaurantImage.originalFilename
        restaurantInstance.owner_id = session.user_id // This perfectly works thoug intellij can't resolve
        def result =  restaurantInstance.save(flush: true, failOnError: true)
        if(result){
            println "Success"

            if(!restaurantImage.isEmpty()){
                restaurantInstance.photo = OwnerService.uploadFile(restaurantImage,restaurantImage.originalFilename)
                println "Success"
                redirect(action:'myrestaurant')
            }

        }
        else {
            println restaurantInstance.errors.allErrors()
        }

    }
    def owner_viewratings(){
        def db = new Sql(dataSource)
        // def temp = db.rows("Select * from restaurant order by rand() limit 5 ")
        def temp = db.rows("SELECT id FROM restaurant WHERE  owner_id=${session.user_id}")
        def id =  temp[0]['id']

        def db1 = db.rows("Select user_id, rating from  rating where restaurant_id=${id}")
        println db1

        def idname = [];
        def name =[];
        def rating =[];
        db1.each {d->
            idname.add(d['user_id'])
            def dbuname =db.rows("Select emailaddress from user where id= ${d['user_id']}")
            name.add(dbuname,)
            rating.add(d['rating'])
        }
        println idname
        println name
        println rating

        def namelist =[]
        name.each {n->
            println n[0]["emailaddress"]
            namelist.add(n[0]["emailaddress"])
        }

       def list =[]
        for( int i= 0; i<name.size();i++){

            def map1 =[:]

            map1.put('email',namelist[i])
            map1.put('star',rating[i])

            list.add(map1)


        }

        def average =0 ;
        def sum = 0;
        def n = 0;
        for(int i = 0; i < rating.size(); i++){
            sum = sum + rating[i]
            n++;
        }
        average = sum/n
        println list

        ['average':average,'user_rate':list]



    }
    def edit(){
        println session.user_id
        def db = new Sql(dataSource)
        // def temp = db.rows("Select * from restaurant order by rand() limit 5 ")
        def temp = db.rows("SELECT * FROM restaurant WHERE  owner_id=${session.user_id}")
        ['restaurant': temp, 'a':5]

    }

}
