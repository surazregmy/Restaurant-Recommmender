package Recommender

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class RecommenderService {
    def dataSource
    def similarity_table =[]

    def serviceMethod() {

    }

    def calculateRestaurantSimilarity(){
        println("I am in Restaurant Similarity--->")



        def db = new Sql(dataSource)
        // def temp = db.rows("Select * from restaurant order by rand() limit 5 ")
        def restaurant_name_list = db.rows("SELECT id,name from restaurant ")
        println("The name of restaurant is ===>"+ restaurant_name_list)

        for(int i =0 ; i <restaurant_name_list.size(); i++){
            for(int j = 0 ; j <restaurant_name_list.size(); j++){
                if(restaurant_name_list[i]['id'] != restaurant_name_list[j]['id']){

                   // println(restaurant_name_list[i]['name']+"----"+ restaurant_name_list[j]['name'])
                    def users_restaurant1 = db.rows("Select user_id from rating where restaurant_id =${restaurant_name_list[i]['id']} ")
                    def users_restaurant2 = db.rows("Select user_id from rating where restaurant_id =${restaurant_name_list[j]['id']} ")

                    def intersect_users = users_restaurant1.intersect(users_restaurant2)

                    def x =[]
                    def y =[]

                   // println(intersect_users)

                    for(int k =0; k<intersect_users.size(); k++){
                        def rating_for_restaurant1 = db.rows("Select rating from rating where user_id=${intersect_users[k]['user_id']} and restaurant_id=${restaurant_name_list[i]['id']}")
                        def rating_for_restaurant2 = db.rows("Select rating from rating where user_id=${intersect_users[k]['user_id']} and restaurant_id=${restaurant_name_list[j]['id']}")
                        x.add(rating_for_restaurant1[0]['rating']);
                        y.add(rating_for_restaurant2[0]['rating']);
                    }
                  //  println "x is "+ x
                  //  println "y is "+ y


                    int  sum_x = 0
                    int sum_y = 0
                    int sum_xy = 0
                    int sum_square_x =0
                    int sum_square_y = 0
                    int n = 0

                    for(int l = 0; l< x.size(); l++){
                        sum_x = sum_x + x[l]
                        sum_y = sum_y + y[l]
                        n++
                        sum_xy = sum_xy+ x[l]*y[l]
                        sum_square_x = sum_square_x + x[l]*x[l]
                        sum_square_y = sum_square_y + y[l]*y[l]

                    }
//                    println sum_x
//                    println sum_y
//                    println n
//                    println sum_xy
//                    println sum_square_x
//                    println sum_square_y

                    int a = n* sum_xy - sum_x*sum_y
                    int b = (n*sum_square_x - sum_x * sum_x) * (n*sum_square_y - sum_y * sum_y)
                    double under = Math.sqrt(b)
                    double r = a/under
                 //   println "Finally Correlation Coefficient is "+ r
                    def name1 = restaurant_name_list[i]['name']
                    def name2 = restaurant_name_list[j]['name']



                    similarity_table.add([(name1+"-"+name2):r])

                }
            }
        }
        return similarity_table
    }


    def calculatetheWeigthedMatrix(user){

        println("The Similarity Table With Map is "+similarity_table)
        println("The session of user is " + user)
        println("I ma inside the WeigtedMatrix Calculations! Its gonna be tough Night Bear with me !!!")


        def db = new Sql(dataSource)

        def visited_list=[]
        def rating_visited_list =[]
        def not_visited_list =[]
        def similarity_not_visited_list =[]
        def similarity_not_visited_list_after_multiplied =[]


        def visited_restaurants = db.rows("Select name from restaurant where id IN (select restaurant_id from rating where user_id =${user})")

        visited_restaurants.each{v->
            visited_list.add(v['name'])
            def rating = db.rows("Select rating from rating where user_id =${user} and restaurant_id=(select id from restaurant where name =${v['name']})")
            rating_visited_list.add(rating[0]['rating'])
        }


        def not_visited_restaurants = db.rows("Select name from restaurant where id NOT IN (select restaurant_id from rating where user_id =${user})")

        not_visited_restaurants.each {n->
            not_visited_list.add(n['name'])
        }


        println("Rating------------"+"Simikarity---------"+"multiplied value")
        for(int i = 0; i < visited_list.size();i ++){
            def templist =[]
            def mul_templist =[]
            for(int j = 0; j < not_visited_list.size(); j++){
                def key = visited_list[i]+'-'+not_visited_list[j]
                def temp = returnthesimilarityfromtable(key)
                def mul_temp = temp * rating_visited_list[i]
                    templist.add(temp)
                    mul_templist.add(mul_temp)

              //  println(rating_visited_list[i]+"----"+temp+"-------"+mul_temp)

            }
            similarity_not_visited_list.add(templist)
            similarity_not_visited_list_after_multiplied.add(mul_templist)
        }

        println("Visited List"+ visited_list)
        println("Visited List Rating"+ rating_visited_list)
        println("Not visited List is "+ not_visited_list)
        println("Not visited List Similarity is "+ similarity_not_visited_list)
        println("Not visited List Similarity After multiplied is "+ similarity_not_visited_list_after_multiplied)

        println("Here is the way to access the list")
        println("O elemetn "+ similarity_not_visited_list_after_multiplied[0])
        println("09 elemetn "+ similarity_not_visited_list_after_multiplied[0][0])

        def sum_nvlist =[]
        def sum_nvlist_after_multiplied =[]
        def average_list = []

        for(int i= 0; i < similarity_not_visited_list_after_multiplied[0].size(); i++){
            def sum_mul = 0
            def sum = 0
            def average = 0;
            for(int j= 0; j< similarity_not_visited_list_after_multiplied.size(); j++) {

               // println("The added numbers are for similarity" +similarity_not_visited_list[j][i] )
               // println("The added numbers are for similarity multiplied" +similarity_not_visited_list_after_multiplied[j][i] )
                sum = sum + similarity_not_visited_list[j][i]
                sum_mul = sum_mul + similarity_not_visited_list_after_multiplied[j][i]
                average = sum_mul / sum

                println(similarity_not_visited_list[j][i]+'====='+similarity_not_visited_list_after_multiplied[j][i] )


            }
            sum_nvlist.add(sum)
            sum_nvlist_after_multiplied.add(sum_mul)
            average_list.add(average)


        }

        println "Sum for not visited list is "+ sum_nvlist
        println "Sum for not visited list multiplied is "+ sum_nvlist_after_multiplied
        println "Hence the average divided is obtained as "+average_list

        int  status=1
        def largest = average_list.max();
        def normalizedaveragelist =[]
        def map_restaurant_possibility =[:]

        for(int i =0; i <average_list.size(); i++){
            if(average_list[i] > 5){
                status = 0;
            }
        }

        if(status == 0){
            for(int i =0; i < average_list.size(); i++){
                def temp = (average_list[i]/largest)*5
                normalizedaveragelist.add(temp)
            }
        }else {
            for(int i =0; i < average_list.size(); i++){
                normalizedaveragelist.add(average_list[i])
            }

        }
        println("The normalized list is-->"+normalizedaveragelist)

        //Mapper between Restaurant Name and Normalized values
        println("Finally the value we have is =====>")
        for(int i =0; i<not_visited_list.size(); i++){
            println(not_visited_list[i]+"Rating Probability: "+ normalizedaveragelist[i])

            map_restaurant_possibility.put(not_visited_list[i],normalizedaveragelist[i])
        }

        return map_restaurant_possibility;





    }
    def returnthesimilarityfromtable(key){
        for(int i = 0; i <similarity_table.size(); i ++){
           if(similarity_table[i].containsKey(key)){
             //  println(similarity_table[i])
            //   println("Hi the value is "+ similarity_table[i][key])
               return  similarity_table[i][key]
           }
        }
    }

    def returnlistofnotvisitedrestaurant(def map_notvisited_poss){


        def map_notvisited_poss_sort = map_notvisited_poss.sort{a->a.value}

        def not_visited_rest_sort=[]
        def not_visited_poss_sort =[]

        map_notvisited_poss_sort.each{m->
            not_visited_rest_sort.add(m.key)
            not_visited_poss_sort.add(m.value)
        }
        println(not_visited_rest_sort)
        println(not_visited_poss_sort)

        def db = new Sql(dataSource)
        def listofrestaurants=[];
        def listofpossibilities =[];
        for(int i = not_visited_rest_sort.size()-1; i >not_visited_rest_sort.size()-5 ; i--){
            def restaurant_information = db.rows("Select * from restaurant where name=${not_visited_rest_sort[i]}")

            listofrestaurants.add(restaurant_information)
            listofpossibilities.add(not_visited_poss_sort[i])

        }
        println("Finally the information of the restaurants are ===>")
        println listofrestaurants
        println listofpossibilities

        return listofrestaurants

    }
}
