<html>
<head>
    <meta name="layout" content="headerfooter" />
    <asset:stylesheet src="userapplication.css"/>
    <title>My Restaurant</title>
</head>


<div class="content page1"><div class="ic"></div>
    <div class="container_12">

        <div class="grid_7">
            <h2>Welcome ${session.getAttribute("user_email")}</h2>

            <g:if test="${myrestaurant.size() ==0}">


                <h4>Lets promote your restaurant</h4>
                </br>
                <a href="${createLink(controller:'owner', action:'owner_insert')}" class="btn">Insert Restaurant</a>
            </g:if>
            <g:else>

            <div class="page1_block col1">
                %{--<img src="${assetPath(src: 'welcome_img.png')}">--}%
                <img src="${resource(dir:'images',file:'iuser.png')} " width="150" height="140" />

                <div class="extra_wrapper">
                    <p>  You can view ratings !</p>

                    <br>
                    %{--<a href="${createLink(controller:'Recommender', action:'recommendRestaurant')}" class="btn">Recommend me</a>--}%
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
                <h2>Here is your Restaurant</h2>
                <div class="clear"></div>

                <ul >
                    <g:each in="${myrestaurant}" var ="restaurants">



                        <li>
                            <div id="${restaurants["id"]}" class="page1_block col1">
                                %{--<img src="${assetPath(src: 'welcome_img.png')}">--}%
                                <img src="${resource(dir:'images',file:restaurants["photo"])} " width="250" height="200" />

                                <div class="extra_wrapper">
                                    <div class="col1 upp"> <a href="#"><h3>${restaurants["name"]}</h3></a></div>
                                    <br/>
                                    <p> ${restaurants["description"]}</p>
                                    <p> ${restaurants["location"]}</p>
                                    <p> ${restaurants["contactno"]}</p>

                                    <br>
                                    %{--<a href="${createLink(controller:'Recommender', action:'recommendRestaurant')}" class="btn">Recommend me</a>--}%
                                </div>
                                <div class="clear"></div>
                            </div>

                        </li>
                        <br/>
                        <a href="${createLink(controller:'owner', action:'edit')}" class="btn">Edit Restaurant</a>
                    </g:each>




                </ul>
            </div>
        </div>

        <div class="clear"></div>
        <div class="bottom_block"></div>
        <div class="clear"></div>
    </div>
            </g:else>
</div>
</div>




</body>
<div class="clear"></div>
<div class="clear"></div>
<div class="clear"></div>

</html>