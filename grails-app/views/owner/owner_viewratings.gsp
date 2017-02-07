<html>
<head>
    <meta name="layout" content="headerfooter" />
    <asset:stylesheet src="userapplication.css"/>
    <title>My Restaurant</title>
</head>

<body>


<div class="clear"></div>

<div class="grid_12">
    <div class="hor_separator"></div>
</div>

<div class="grid_12">
    <div class="car_wrap">
        <h2>Users That Have Rated Your Restaurants</h2>
        <div class="clear"></div>


            <table class="table">
                <thead>
                <tr>
                    <th>Users</th>
                    <th>Stars</th>
                </tr>
                </thead>
                <tbody>
        <g:each in="${user_rate}" var ="user" >
                <tr>
                    <td>${user["email"]} </td>
                    <td>${user["star"]}</td>

                </tr>
        </g:each>
                <tr>
                    <td>Average </td>
                    <td>${average}</td>

                </tr>

                </tbody>
            </table>





    </div>
</div>

<div class="clear"></div>
<div class="bottom_block"></div>
<div class="clear"></div>



</body>
<div class="clear"></div>
<div class="clear"></div>
<div class="clear"></div>

</html>