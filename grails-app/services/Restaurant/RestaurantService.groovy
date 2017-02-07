package Restaurant

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class RestaurantService {
    def dataSource
    def serviceMethod() {

    }
    def returnListOfRestaurant(user_id){

        def db = new Sql(dataSource)
       // def temp = db.rows("Select * from restaurant order by rand() limit 5 ")
        def temp = db.rows("SELECT * FROM restaurant WHERE id NOT IN(SELECT restaurant_id from rating WHERE user_id=${user_id}) order by rand() limit 5 ")
        return temp

    }
    def returnOneRestaurant(user_id){

        def db = new Sql(dataSource)
        def temp = db.rows("SELECT * FROM restaurant WHERE id NOT IN(SELECT restaurant_id from rating WHERE user_id=${user_id}) order by rand() limit 1")
        return temp

    }
    def returnOneRestaurantforOwner(def owner_id){
        def db = new Sql(dataSource)
        def temp = db.rows("Select * from restaurant where owner_id = ${owner_id}")
        println("The Restaurant of Owner "+ owner_id);
        println(temp)
        return temp
    }

    def storeRatingByuser(rid,userid,star){
        def db = new Sql(dataSource)
        def temp = db.execute("insert into rating(user_id,restaurant_id,rating,comments) values(${userid},${rid},${star},'')")
        println("It is inserted")
    }
}
