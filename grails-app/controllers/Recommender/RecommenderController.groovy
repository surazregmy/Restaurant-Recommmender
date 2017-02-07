package Recommender

class RecommenderController {

    def RecommenderService

  //  def restaurantSimilarityTable = RecommenderService.calculateRestaurantSimilarity();

    def index() { }

    def CalculateSimilarityOfRestaurants(){

    }
    def recommendRestaurant(){
        def user_id = session.user_id
        println(user_id)
        println("Hello I am inside recommendRestaurant")

        //It is used to calculate the Similar Restaurants
        def tempservice_call = RecommenderService.calculateRestaurantSimilarity();

        println tempservice_call

        // It is used to calculate the weighted matrix and then return map containing not visited Restaurants and possiility of reating
        def map_notvisited_poss = RecommenderService.calculatetheWeigthedMatrix(session.user_id)
        println("Weighted Matrix in RecommedRestaurant Controller is --->")
        println(map_notvisited_poss)



        def notvisitedrestaurant = RecommenderService.returnlistofnotvisitedrestaurant(map_notvisited_poss)
        println "The not visited Restaurants in Recommender that i have to pass through model is "
        println notvisitedrestaurant

        ['recommendedrestaurant': notvisitedrestaurant]



    }


}
