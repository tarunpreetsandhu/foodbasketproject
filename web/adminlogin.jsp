<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            Admin Login
        </title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet">
        <!--pop-up-box-->
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!--//pop-up-box-->
        <!-- price range -->
        <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
            function signlogic()
    {
        var username = document.getElementById("lusername").value;
        var password = document.getElementById("lpassword").value;

        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function ()
        {
            if (this.readyState == 4 && this.status == 200)
            {
                var res = this.responseText.trim();

                if (res == "success")
                {
                    document.getElementById("loginresult").className = "alert alert-success";
                    document.getElementById("loginresult").innerHTML = "Login Successfully!!!";
                   setTimeout("go2()",1000);
                } else
                {
                    document.getElementById("loginresult").className = "alert alert-danger";
                    document.getElementById("loginresult").innerHTML = "Login Failed!!!";
                }
            }
        };
        xhttp.open("GET", "./adminloginresponse?username=" + username + "&password=" + password, true);
        xhttp.send();
    }
    function go2(){
        location.href="adminhome.jsp";
    }
    
        </script>
   
    <div class="header-most-top">
        <p>FOOD BASKET</p>
    </div>

</head>
<body>

        <br>
        <br>
        <div class="container">

            <h3 class="tittle-w3l">Admin Login
                <span class="heading-style">
                    <i></i>
                    <i></i>
                    <i></i>
                </span>
            </h3>

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <form id="signinform">
                    <div class="form-group">
                        <label for="lusername">Enter User Name:</label>
                        <input type="text" class="form-control" style="width: 500px; align-content: center;" placeholder="Enter User Name" name="lusername" id="lusername" required="">
                    </div>
                    <div class="form-group">
                        <label for="lpassword">Enter Password:</label>
                        <input type="password" class="form-control" style="width: 500px; align-content: center; " placeholder="Enter Password" name="lpassword" id="lpassword" required="">
                    </div>
                    <div class="form-group" style="text-align: center">

                        <input type="button" onclick="signlogic()" class="btn btn-primary" name="signinbutton" value="Sign In">
                    </div>

                    <div class="loginresult" id="loginresult"  ></div>

                </form>

            </div>


        </div>
    </div>

</div>
</body>    
</html>
