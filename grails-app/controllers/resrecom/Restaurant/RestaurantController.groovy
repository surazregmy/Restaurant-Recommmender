package resrecom.Restaurant

import grails.converters.JSON

class RestaurantController {

    def RestaurantService
    def index() { }

    def rateRestaurants(){
        def restaraunt = RestaurantService.returnListOfRestaurant(session.user_id);
        println("The list of restaurant is as follows ---->")
        println restaraunt

        render(view: '../user/userhome.gsp',model: ['restaurant':restaraunt])

    }

    def getJson(){
       // println("hello i am inside getJson called by Ajax");

//        def restaraunt2 = RestaurantService.returnOneRestaurant();
//        println "REstauarant 2 is--------------------------------"
//        println restaraunt2
//        render restaraunt2 as JSON

       // render template: 'returnRestaurants', model:[user:restaraunt]
        //render(view: '../user/userhome.gsp',model: ['user':restaraunt]);
//        println(params.rname);
//        println(params.star);
//
        //def restaraunt = RestaurantService.returnListOfRestaurant();
       // render(view: '../user/userhome.gsp',model: ['restaurant':restaraunt])

        //This is the place where AJAX Is called and now I have to save the ratings using Services in this controller

        def star = params.star
        def rid = params.rid

        println(rid+"----"+star+"-----"+session.user_id);
        def temp = RestaurantService.storeRatingByuser(rid,session.user_id,star)

        def restaraunt2 = RestaurantService.returnOneRestaurant(session.user_id);
        println "REstauarant 2 is--------------------------------"
        println restaraunt2
        render restaraunt2 as JSON

    }
}
