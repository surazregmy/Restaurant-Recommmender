<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="headerfooter" />

    <title>Show </title>
</head>

<body>
<div class="clear"></div>



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
                        <g:each in="${restaurant}" var ="restaurantk">


                        Restaurant Name<input type="text" name="name" value="${restaurantk['name']}" required="required" class="form"  />
                        Restaurant Location<input type="text" name="location" value="${restaurantk['location']}" required="required" class="form"  />
                        Contact No:<input type="text" name="contactno" value="${restaurantk['contactno']}"  class="form"  />
                        Description<input type="text" name="description" value="${restaurantk['description']}" class="form"  />
                        Photo<input type="file" name="phototemp"  required="required" class="form"  />

                        </g:each>
                        <div class="col-xs-6 ">
                            <!-- Send Button -->
                            <button type="submit" id="submit" name="submit" class="text-center form-btn form-btn">Update</button>
                        </div>


                    </div>



                </div>
            </div>


        </div>
    </div>
    <!-- Clear -->
    <div class="clear"></div>

</g:form>


<div class="clear"></div>


</body>

</html>
