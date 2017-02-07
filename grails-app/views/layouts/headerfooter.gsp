<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <title>Restaurant</title>

    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

    <g:layoutHead/>
</head>
<body>
<header style="margin-bottom: 0px">
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
                <a class="navbar-brand" href="${createLink(controller:'owner', action:'myrestaurant')}">Restaurant</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav main-nav  clear navbar-right ">
                    <li><g:link class="navactive color_animation"  action="myrestaurant" controller="Owner">MY RESTAURANT</g:link></li>
                    <li><g:link class="color_animation"  action="owner_viewratings" controller="owner">VIEW RATINGS</g:link></li>
                    <li><g:link class="color_animation"  action="logout" controller="user" >LOG OUT</g:link></li>

                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </div><!-- /.container-fluid -->
</nav>
</header>

<g:layoutBody/>


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





<asset:javascript src="application.js"/>

</body>
</html>
