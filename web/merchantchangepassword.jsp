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
        <%
            String user_change = "";
            if (session.getAttribute("mid") == null) {
                response.sendRedirect("index.jsp");
            } else {
                user_change = session.getAttribute("mid").toString();
            }
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
            function passwordlogic()
            {

                var name = document.getElementById("name").value;
                var opassword = document.getElementById("opassword").value;
                var npassword = document.getElementById("npassword").value;
                var cpassword = document.getElementById("cpassword").value;
                alert(name);
                if (name == "" || opassword == "" || npassword == "" || cpassword == "")
                {
                    alert("All Fields are required");
                } 
                else if (npassword === cpassword)
                {
                    var xhttp = new XMLHttpRequest();

                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText.trim();

                            if (res == "success")
                            {
                                alert("Your Password has been changed");

                                setTimeout("go2()", 2000);

                            } else
                            {
                                alert("Wrong old password");

                            }
                        }
                    };
                    xhttp.open("GET", "./merchantchangepassword?name=" + name + "&opassword=" + opassword + "&npassword=" + npassword, true);
                    xhttp.send();
                } else
                {
                    alert("New Password and Confirm Password must be same");
                }
            }
            function go2()
            {
                window.location.href = "index.jsp";
            }
        </script>

    </head>

    <body>
        <%@include file ="header.jsp" %>

        <br>
        <div class="container">
            <div class="row">
                <h3 class="tittle-w3l">Change Password
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

                        <div class="form-group">
                            <label for="name">Enter name</label>
                            <input type="text" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter name" name="name" id="name" disabled required="" value="<%=user_change%>">
                        </div>

                        <div class="form-group">
                            <label for="opassword">Enter Old Password:</label>
                            <input type="password" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter Old Password" name="opassword" id="opassword" required="">
                        </div>
                        <div class="form-group">
                            <label for="npassword">Enter New Password:</label>
                            <input type="password" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter New Password" name="npassword" id="npassword" required="">
                        </div>
                        <div class="form-group">
                            <label for="cpassword">Enter Confirm Password:</label>
                            <input type="password" class="form-control" style="width: 700px; align-content: center; " placeholder="Enter Confirm Password" name="cpassword" id="cpassword" required="">
                        </div>
                        <br>

                        <div class="form-group" style="text-align: center">

                            <input type="button" onclick="passwordlogic()" class="btn btn-primary" name="change" value="Change Password">
                        </div>
                        <br>
                        <div class="loginresult" id="loginresult"></div>
                    </form>
                    <br>
                </div>


            </div>
        </div>

        <br>
        <%@include file ="footer.jsp" %>
    </body>

</html>
