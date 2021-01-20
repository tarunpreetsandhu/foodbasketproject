<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="vmm.DBLoader" %>


<!DOCTYPE html>
<html lang="zxx">

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

        </script>



        <script>

            var otp;
            var username;
            function forgotpassword()
            {
                //write logic here to send ajax request
                //write logic here to send ajax request

                username = document.getElementById("fusername").value;

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
                                document.getElementById("changepasswordresult").innerHTML = "Merchant Id invalid";
                            } else
                            {
                                document.getElementById("sec2").style.display = "block";
                                document.getElementById("changepasswordresult").innerHTML = "OTP has been sent to your phoneno";

                                otp = res;
                                console.log(otp);
                            }

                        }
                    };

                    var querystring = "mid=" + username;
                    xhr.open("GET", "mfp?" + querystring, true);
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

                        document.getElementById("changepasswordresult").innerHTML = "";

                    } else
                    {
                        document.getElementById("changepasswordresult").innerHTML = "Wrong OTP";

                    }
                }

            }


            function gotologin()
            {
                location.href = "index.jsp?";
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
                                location.href = "index.jsp";
                            } else
                            {
                                alert("Some error occurred");
                            }

                        }
                    };

                    var querystring = "mid=" + username + "&np=" + np + "&cp=" + cp;
                    xhr.open("GET", "mfp1?" + querystring, true);
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
<div class="header-most-top">
        <p>FOOD BASKET</p>
    </div>
    </head>

    <body>
      

        <br>
        <div class="container">
            <div class="row">
                <h3 class="tittle-w3l">Forgot Password
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
            </div>

            <br>


            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <form id="changepassword">


                        <div id="mainsec">

                            <div class="form-group">
                                <label for="fusername">Enter Merchant ID</label>
                                <input type="text" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter Merchant ID" name="fusername" id="fusername" required="" >
                            </div>

                            <div class="form-group" style="text-align: center">

                                <input type="button" onclick="forgotpassword()" class="btn btn-primary" name="change" value="Submit">
                            </div>

                            <div id="sec2">

                                <div class="form-group">
                                    <label for="otp">Enter OTP</label>
                                    <input type="number" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter OTP" name="otp" id="otp" required="" >
                                </div>

                                <div class="form-group" style="text-align: center">

                                    <input type="button" onclick="checkotp()" class="btn btn-primary" name="change" value="Check">
                                </div>

                            </div>
                        </div>

                        <div id="changepasssec">
                            <div class="form-group">
                                <label for="np">Enter New Password:</label>
                                <input type="password" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter New Password" name="np" id="np" required="">
                            </div>
                            <div class="form-group">
                                <label for="cp">Enter Confirm Password:</label>
                                <input type="password" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter Confirm Password" name="cp" id="cp" required="">
                            </div>
                            <br>

                            <div class="form-group" style="text-align: center">

                                <input type="button" onclick="changepass()" class="btn btn-primary" name="change" value="Change Password">
                            </div>
                        </div>

                        <h4 id="changepasswordresult"></h4>


                        <br>
                        <div class="loginresult" id="loginresult"></div>
                    </form>
                    <br>
                </div>


            </div>
        </div>

        <br>
       <div class="footer-top">
    <div class="container-fluid">
        <div class="col-xs-8 agile-leftmk">
            <h2>Get your Groceries delivered from local stores</h2>
            <p>Free Delivery on your first order!</p>
            <div class="newsform-w3l">
                <span class="fa fa-envelope-o" aria-hidden="true"></span>
            </div>
        </div>
        <div class="col-xs-4 w3l-rightmk">
            <img src="images/tab3.png" alt=" ">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
    </body>

</html>
