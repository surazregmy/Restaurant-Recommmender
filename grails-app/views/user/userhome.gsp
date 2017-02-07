<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Restaurant</title>

    <asset:stylesheet src="userapplication.css"/>

    <link rel="icon" type="image/png" href="<img src="${assetPath(src: 'stars.svg')}">
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

</head>

<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="row">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${createLink(controller:'restaurant', action:'rateRestaurants')}">Restaurant</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav main-nav  clear navbar-right ">
                    <li><a class="navactive color_animation" href="${createLink(controller:'restaurant', action:'rateRestaurants')}">WELCOME</a></li>
                    <li><a class="color_animation" href="${createLink(controller:'user', action:'editProfile')}">UPDATE PROFILE </a></li>
                    <li><a class="color_animation" href="${createLink(controller:'user', action:'logout')}">LOG OUT</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </div><!-- /.container-fluid -->
</nav>


<div class="main">


    <div class="content page1"><div class="ic"></div>
        <div class="container_12">

            <div class="grid_7">
                <h2>Welcome ${session.getAttribute("user_email")}!</h2>
                <div class="page1_block col1">
                    %{--<img src="${assetPath(src: 'welcome_img.png')}">--}%
                    <img src="${resource(dir:'images',file:'iuser.png')} " width="150" height="140" />

                    <div class="extra_wrapper">
                        <p> Welcome to Restaurant Recommender! You can rate restaurants and get recommended to restaurants</p>

                         <br>
                        <a href="${createLink(controller:'Recommender', action:'recommendRestaurant')}" class="btn">Recommend me</a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>



            <div class="clear"></div>

            <div class="grid_12">
                <div class="hor_separator"></div>
            </div>

            <div class="grid_12">
                <div class="car_wrap">
                    <h2>Rate Some Restaurants</h2>
                    <div class="clear"></div>
                    <a href="next" class="prev"></a><a href="next" class="next"></a>
                    <ul class="carousel1">


                        <g:each in="${restaurant}" var ="restaurants">
                        <li>
                            <div id="${restaurants["id"]}">
                                <img src="${resource(dir:'images',file:restaurants["photo"])} " width="191" height="179" />
                                <div class="col1 upp"> <a href="#">${restaurants["name"]}</a></div>
                                <div id='${restaurants["name"]}'>
                                    <p>Rate me</p>
                                    <ul class="c-rating"></ul>
                                </div>
                           </div>
                        </li>
                        </g:each>





                    </ul>
                </div>
            </div>

            <div class="clear"></div>
            <div class="bottom_block"></div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<footer class="footer-distributed" style="margin-top:0px">

    <div class="footer-left">

        <h3>Restaurant<span>Recommender</span></h3>

        <p class="footer-links">
            <a href="#">Home</a>
            ·
            <a href="#">About</a>
            ·
            <a href="#">Contact</a>
        </p>

        <p class="footer-company-name">Restaurant Recommender&copy; 2016</p>
    </div>

    <div class="footer-center">

        <div>
            <i class="fa fa-map-marker"></i>
            <p><span>Kathmandu</span> Nepal</p>
        </div>

        <div>
            <i class="fa fa-phone"></i>
            <p>9840012635</p>
        </div>

        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="">suraj.regmi@deerwalk.edu.np</a></p>
        </div>

    </div>

    <div class="footer-right">

        <p class="footer-company-about">
            <span>About the company</span>
            Rate it, get it and enjoy it in Restaurant Recommender!!!
        </p>

        <div class="footer-icons">

            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-github"></i></a>

        </div>

    </div>

</footer>
<asset:javascript src="userapplication.js"/>
<g:javascript>
    (function () {



        var restaurant = "${restaurant.encodeAsJSON()}"; //encoded as the JSON object

        var resobj = eval(restaurant); // THe JSON object is takend

        var callback = function(rating) { alert(rating); }; //It calls the first own dont know why??
        var rE =[];
        var r =[];
        var currentRating = 0;
        var maxRating = 5;


        for (var i = 0; i < resobj.length; i++) {

            var c = document.getElementById(resobj[i].name);
            var rname= resobj[i].name;
            var id = resobj[i].id;
            rE[i] = c.querySelector('.c-rating');
            r[i] = rating(rE[i], currentRating, maxRating,rname, id,callback);


             callback = function(rating) {

            var sess ="${session.getAttribute('user_id')}";
            // alert(sess+"--"+rating);
            // alert("This is wht star"+rating[0]);
            // alert("Thisis rating 1 probably name"+ rating[1]);
            // alert("The restaurant id is "+ rating[2])
            %{--$.ajax({--}%
                     %{--url:"${g.createLink(controller:'Restaurant',action:'getJson')}",--}%
                    %{--dataType: 'json',--}%
                    %{--data: {--}%
                        %{--star: rating[0],--}%
                        %{--rname: rating[1],--}%
                        %{--user: sess--}%
                    %{--},--}%
                    %{--complete: function(data){--}%
                    %{--document.getElementById(rating[2]).innerHTML ="Hello THis is me";--}%
                    %{--alert("Success is Possible");--}%
                    %{--alert("data is "+ data);--}%
                %{--}--}%

            %{--}--}%

            %{--)--}%
    function crossDomainCall(url,data,fnSuccess){
            $.ajax({
            type:'POST',
            url:url,
            //contentType:"application/json",
            dataType:'json',
            crossDomain:true,
            data:data,

           success:fnSuccess,

            });
      }

    function saveratingsfromuser(rating0,rating1,rating2) {
        var url = '${g.createLink(controller:'Restaurant',action:'getJson')}';
        var data={star:rating[0], rname:rating[1], rid:rating[2]}; //I hae sent name of restaurnat in ccase of id! BE careful sometime
        var fnSuccess=function (data) {

                // alert("m is"+ data[0].name); // it workd
                //var m = data[0].name;
                //var p = data[0].photo;
                alert("You have rated Successfully");
                //document.getElemntById(rating2).html = "<h3>"+ You have succcefully rated +"</h3>"
                


        };

        var fnError=function (e) {
        // alert(e+"hi");
        };
        crossDomainCall(url,data,fnSuccess);
        }
        saveratingsfromuser(rating[0],rating[1],rating[2])





    };



};





}
)()

</g:javascript>






</body>

</html>
