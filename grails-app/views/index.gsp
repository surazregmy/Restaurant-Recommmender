<!DOCTYPE html>
<html>

<head>
    <asset:stylesheet src="application.css"/>
    %{--<asset:image src="images" />--}%
    <title>Restaurant</title>

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
                <a class="navbar-brand" href="#top">Restaurant</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav main-nav  clear navbar-right ">
                    <li><a class="navactive color_animation" href="#top">WELCOME</a></li>
                    <li><a class="color_animation" href="#story">ABOUT</a></li>


                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </div><!-- /.container-fluid -->
</nav>

<div id="top" class="starter_container bg">
    <div class="follow_container">
        <div class="col-md-6 col-md-offset-3">
            <h2 class="top-title"> Restaurant</h2>
            <h2 class="white second-title">"Recommender"</h2>
            <hr>
            <a class="btn btn-success btn-lg" href="#signup" >Sign Up</a>
            <a class=" btn btn-success btn-lg" href="#login" >Login</a>

        </div>
    </div>
</div>

<!-- ============ About Us ============= -->

<section id="story" class="description_content">
    <div class="text-content container">
        <div class="col-md-6">
            <h1>About us</h1>
            %{--<div class="fa fa-cutlery fa-2x"></div>--}%
            <br/>
            <br/>
            <p class="desc-text">Restaurant is a place for simplicity. Good food, good beer, and good service. Simple is the name of the game, and we’re good at finding it in all the right places, even in your dining experience. We’re a small group from Denver, Colorado who make simple food possible. Come join us and see what simplicity tastes like.</p>
        </div>
        <div class="col-md-6">
            <div class="img-section">
                <img src="${resource(dir:'images',file:'Yak and yeti.jpg')}" width="250" height="220">
                <img src="${resource(dir:'images',file:'fusion kitchen restaurant.jpg')}" width="250" height="220">
                <div class="img-section-space"></div>
                <img src="${resource(dir:'images',file:'Kathmandu Steak House.jpg')}"  width="250" height="220">
                <img src="${resource(dir:'images',file:'Maya.jpg')}"  width="250" height="220">
            </div>
        </div>
    </div>
</section>


<!-- ============ Reservation  ============= -->

<section  id="login"  class="description_content">
    <div class="text-content container">
        <div class="inner contact">
            <!-- Form Area -->
            <div class="contact-form">
                <!-- Form -->
                <g:form method="post" action="login" controller="user">
                    <!-- Left Inputs -->
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-6 col-xs-12">
                                <div class="row">

                                    <div class="col-lg-6 col-md-6 col-xs-6">
                                        <h2 >Sign In</h2>
                                        <!-- Name -->
                                        <input type="text" name="emailaddress" id="first_name" required="required" class="form" placeholder="Email Address" />
                                        <input type="password" name="password" id="password" required="required" class="form" placeholder="Password" />

                                        <div class="col-xs-6 ">
                                            <!-- Send Button -->
                                            <button type="submit" id="submit" name="submit" class="text-center form-btn form-btn">Log in</button>
                                        </div>


                                    </div>



                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- Clear -->
                    <div class="clear"></div>
                </g:form>
            </div><!-- End Contact Form Area -->
        </div><!-- End Inner -->
    </div>
</section>

<section  id="signup"  class="description_content">
    <div class="text-content container">
        <div class="inner contact">
            <!-- Form Area -->
            <div class="contact-form">
                <!-- Form -->
                <g:form method="post" action="signup" controller="user">
                    <!-- Left Inputs -->
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-6 col-xs-12">
                                <div class="row">

                                    <div class="col-lg-6 col-md-6 col-xs-6">
                                        <h2 class>Sign Up </h2>
                                        <!-- Name -->
                                        <input type="text" name="emailaddress" id="emailaddress" required="required" class="form" placeholder="email address" />
                                        <input type="password" name="password" id="password" required="required" class="form" placeholder="Password" />
                                        <select name="typeofuser" class="form" >
                                            <option selected disabled >I am a </option>
                                            <option value="user">User</option>
                                            <option value="owner">Restaurant Owner</option>
                                        </select>

                                        <div class="col-xs-6 ">
                                            <!-- Send Button -->
                                            <button type="submit" id="submit" name="submit" class="text-center form-btn form-btn">Sign Up</button>
                                        </div>

                                    </div>



                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- Clear -->
                    <div class="clear"></div>
                </g:form>
            </div><!-- End Contact Form Area -->
        </div><!-- End Inner -->
    </div>
</section>





<!-- ============ Footer Section  ============= -->


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