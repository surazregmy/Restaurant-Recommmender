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
                <a class="navbar-brand" href="#">Restaurant</a>
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

    <g:form method="post" action="insertrestaurant" controller="owner" enctype="multipart/form-data">
        <!-- Left Inputs -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-6 col-xs-12">
                    <div class="row">

                        <div class="col-lg-6 col-md-6 col-xs-6">
                            <h2 >My Restaurant</h2>
                            <h3>Insert Your Restaurant's Information</h3>
                            <!-- Name -->
                            Name<input type="text" name="name"  required="required" class="form"  />
                            Address<input type="text" name="location"  required="required" class="form"  />
                            Contact No:<input type="text" name="contactno"   class="form"  />
                            Photo<input type="file" name="phototemp"  required="required" class="form"  />

                            <div class="col-xs-6 ">
                                <!-- Send Button -->
                                <button type="submit" id="submit" name="submit" class="text-center form-btn form-btn">INSERT</button>
                            </div>


                        </div>



                    </div>
                </div>


            </div>
        </div>
        <!-- Clear -->
        <div class="clear"></div>
    </g:form>


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


</body>

</html>
