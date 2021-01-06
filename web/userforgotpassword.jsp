


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
       <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>
        <!--/tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <%

%>
        <style>
            .rowdesign{
                background-color: aliceblue;
                margin: 20px;
            }

        </style>
        <!--//tags -->
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

            var otp;
            var username;
            function forgotpassword()
            {
                //write logic here to send ajax request
                //write logic here to send ajax request

                username = document.getElementById("username").value;

                if (username == "")
                {
                    alert("Fill all fields");
                } else
                {
                    var xhr = new XMLHttpRequest();

                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText;


                            console.log(res);
                            res = res.trim();
                            if (res == "fail")
                            {
                                document.getElementById("changepasswordresult").innerHTML = "Username invalid";
                            } else
                            {
                                document.getElementById("sec2").style.display = "block";
                                document.getElementById("changepasswordresult").innerHTML = "OTP has been sent to your phoneno";

                                otp = res;
                                alert(otp);
                            }

                        }
                    };

                    var querystring = "username=" + username;
                    xhr.open("GET", "forgotpassword?" + querystring, true);
                    xhr.send();

                }

            }

            function checkotp()
            {
                var userotp = document.getElementById("otp").value;
                if (userotp == "")
                {
                    alert("Please enter OTP");
                } else
                {
                    if (userotp == otp)
                    {
                        document.getElementById("mainsec").style.display = "none";
                        document.getElementById("changepasssec").style.display = "block";


                    } else
                    {
                        document.getElementById("changepasswordresult").innerHTML = "Wrong OTP";

                    }
                }

            }


            function gotologin()
            {
                location.href = "login.jsp?";
            }

            function changepass()
            {

                var np = document.getElementById("np").value;
                var cp = document.getElementById("cp").value;

                if (np == "" || cp == "")
                {
                    alert("Please enter values");
                } else if (np != cp)
                {
                    alert("new password must be same as confirm password");

                } else
                {

                    var xhr = new XMLHttpRequest();

                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText;


                            console.log(res);
                            res = res.trim();
                            if (res == "success")
                            {
                                alert("Password Changed successfully");
                                location.href="login.jsp";
                            }
                            else
                            {
                                alert("Some error occurred");
                            }

                        }
                    };

                    var querystring = "username="+username+"&np=" + np+"&cp="+cp;
                    xhr.open("GET", "forgotpassword1?" + querystring, true);
                    xhr.send();

                }

            }


        </script>


        <style>

            #sec2{
                display:none;
            }
            #changepasssec
            {
                display:none;
            }

        </style>

        <!-- start-smoth-scrolling -->
    </head>

    <body>

        <%@include file="header.jsp" %>


        <!-- //navigation -->
        <!-- breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Change Password Page</li>
                </ol>
            </div>
        </div>
        <!-- //breadcrumbs -->
        <!-- register -->
        <div class="register">
            <div class="container">
                <h2>Change Password</h2>
                <div class="login-form-grids">
                    <h5>profile information</h5>
                    <form id="signupform">

                        <div id="mainsec">


                            <input type="text" placeholder="Enter Username" name="username" id="username"  value="" required=" " >
                            <br>
                            <input type="button" onclick="forgotpassword()" name="forgotbutton"  value="Submit">
                            <br>

                            <div id="sec2">
                                <br>

                                <input type="number" class="form-control" placeholder="Enter OTP" name="otp" id="otp" required=" " >
                                <br>
                                <br>

                                <input type="button" onclick="checkotp()" name="button"  value="change">
                            </div>

                        </div>
                        <br>

                        <div id="changepasssec">
                            <input type="password" placeholder="Enter New password" name="np" id="np" required=" " >
                            <input type="password" placeholder="Confirm New password" name="cp" id="cp" required=" " >
                            <br>
                            <br>
                            <input type="button" onclick="changepass()"  value="change">

                        </div>
                        <h4 id="changepasswordresult"></h4>

                    </form>

                </div>
                <div class="register-home">

                </div>
            </div>
        </div>
        
            <%@include file ="footer.jsp" %>
    </body>
</html>