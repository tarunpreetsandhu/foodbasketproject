<%@page import="java.sql.ResultSet"%>
<%@page import="vmm.DBLoader"%>
<style>
    .lidesign{
        width: 24%;
    }
</style>
<script>
    function signuplogic()
    {
        var ans = "";
        var formdata = new FormData();

        var controls = document.getElementById("signupform").elements;
        var flag = 0;

        for (var i = 0; i < controls.length; i++)
        {
            if (controls[i].name == "" || controls[i].name == null)
            {
                flag = 1;
            }
            if (controls[i].type == "file")
            {
                if (controls[i].files.length > 0)
                {
                    formdata.append(controls[i].name, controls[i].files[0]);
                } else
                {
                    flag = 2;
                }

            } else
            {
                formdata.append(controls[i].name, controls[i].value);
            }
        }
        if (flag == 1)
        {
            alert("CHECK: --> Give name attribute to all controls in form");
        } else if (flag == 2)
        {
            alert("CHECK: --> Select Files for file controls");
        } else
        {
            var xhr = new XMLHttpRequest;

            xhr.onreadystatechange = function ()
            {
                if (xhr.readyState === 4 && xhr.status == 200)
                {
                    var res = xhr.responseText;
                    alert(res);
                    console.log(res);
                    res = res.trim();
                    if (res == "success")
                    {
                        document.getElementById("signupresult").innerHTML = "Added Successfully";
                    } else
                    {
                        document.getElementById("signupresult").innerHTML = "User already exists";
                    }
                }
            };
            xhr.open("POST", "signupresponse", true);
            xhr.send(formdata);
        }
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
                    setTimeout("go2()", 2000);
                } else
                {
                    document.getElementById("loginresult").className = "alert alert-danger";
                    document.getElementById("loginresult").innerHTML = "Login Failed!!!";
                }
            }
        };
        xhttp.open("GET", "./signin?username=" + username + "&password=" + password, true);
        xhttp.send();
    }
    function go2()
    {
        window.location.href = "index.jsp";
    }
    function gotoviewcart()
    {
        window.location.href = "viewcart.jsp";
    }
    function forgotpasswordfn()
    {
        window.location.href = "forgotpassworduser.jsp";
    }

    function searchfn()
    {
        var keyword = document.getElementById("searchkeyword").value;
        if (keyword != "")
        {

            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function ()
            {
                if (xhr.readyState === 4 && xhr.status == 200)
                {
                    var res = xhr.responseText.trim();

                    var jsonobj = JSON.parse(res);

                    var jsonarr = jsonobj["ans"];

                    var content = "";

                    for (var i = 0; i < jsonarr.length; i++)
                    {
                        var obj = jsonarr[i];
                        content += "<h4 class ='searchlinks' onclick=\"gotoproductdetails('" + obj.pid + "','" + obj.categoryname + "')\">" + obj.name + "</h4>";

                    }
                    document.getElementById("searchresults").innerHTML = content;
                }
            };
            xhr.open("GET", "./searchlogic?keyword=" + keyword, true);
            xhr.send();


        }
    }

    function gotoproductdetails(pid, categoryname)
    {
        location.href = "productdetail.jsp?pid=" + pid + "&categoryname=" + categoryname;
    }

    function removedata()
    {
        document.getElementById("searchresults").innerHTML = "";

    }
</script>	
<style>

    #searchresults{
        position: absolute;
        background: windowframe;
        z-index: 100;
        width: 500px;
        margin-top: 45px;
        max-height: 300px;
        overflow-y: scroll;

    }
    .searchlinks{
        margin: 10px 5px;
        cursor: pointer;
    }
    .searchlinks:hover{
        color: #ffffff;
    }
</style>

<!-- top-header -->
<div class="header-most-top">
    <p>Grocery Offer Zone Top Deals & Discounts</p>
</div>
<!-- //top-header -->
<!-- header-bot-->
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
        <!-- header-bot-->
        <div class="col-md-4 logo_agile">
            <h1>
                <a href="index.jsp">
                    <span>F</span>ood
                    <span>B</span>asket
                    <img src="images/logo2.png" alt=" ">
                </a>
            </h1>
        </div>
        <!-- header-bot -->
        <div class="col-md-8 header">
            <!-- header lists -->
            <ul>

                <li>
                    <span class="fa fa-phone" aria-hidden="true"></span> +91-9988335574
                </li>
                <%
                    if (session.getAttribute("username") == null && session.getAttribute("mid") == null) {
                %>
                <li>
                    <a href="#" data-toggle="modal" data-target="#myModal1">
                        <span class="fa fa-unlock-alt" aria-hidden="true"></span> Sign In </a>
                </li>
                <li>
                    <a href="#" data-toggle="modal" data-target="#myModal2">
                        <span class="fa fa-pencil-square-o" aria-hidden="true"></span> Sign Up </a>
                </li>

                <li class="dropdown">
                    <a class ="nav-stylehead dropdown-toggle" href="#" data-toggle="dropdown">Merchants

                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="merchantsignup.jsp">Sign Up</a>
                        </li><br>
                        <li>
                            <a href="merchantlogin.jsp">Login</a>
                        </li>
                    </ul>
                </li>
                <%} else if (session.getAttribute("mid") != null) {
                    String mid = session.getAttribute("mid").toString();
                    ResultSet rs13 = DBLoader.executequery("select * from merchants where mid='" + mid + "'");
                    if (rs13.next()) {
                %>

                <li style="width: 24%">
                    <a href="index.jsp"><b>Welcome <%=rs13.getString("name")%></b>

                    </a>
                </li>

                <li style="width: 18%">
                    <a href="manageproducts.jsp">Manage Products</a>
                </li>



                <li style="width: 18%">
                    <a href="merchantchangepassword.jsp">Change Password</a>
                </li>

                <li style="width: 15%">
                    <a href="merchantlogout">Logout</a>
                </li>


                <%
                    }
                } else {
                    String username = session.getAttribute("username").toString();
                %>
                <li style="width: 15%">
                    <a href="index.jsp"><b>Welcome <%=username%></b>

                    </a>
                </li>

                <li style="width: 15%">
                    <a href="myorders.jsp">My Orders</a>
                </li>


                <li style="width: 20%">
                    <a href="changepassword.jsp">
                        <span class="fa fa-unlock-alt" aria-hidden="true"></span> Change Password </a>
                </li>
                <li style="width: 15%">
                    <a href="logout"> Logout </a>
                </li>
                <%
                    }
                %>



            </ul>

            <!-- //header lists -->
            <!-- search -->
            <div class="agileits_search">
                <form action="#" method="post">
                    <input name="Search" type="search" placeholder="Search Here" onblur="removedata()" id="searchkeyword" onkeyup="searchfn()" required="" style="border-right: 1px solid #000000;">
                    <div id="searchresults">

                    </div>
                    <div class="clearfix"> </div>
                </form>
            </div>
            <!-- //search -->
            <!-- cart details -->
            <div class="top_nav_right">
                <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                    <form action="#" method="post" class="last">
                        <input type="hidden" name="cmd" value="_cart">
                        <input type="hidden" name="display" value="1">
                        <%
                            if (session.getAttribute("username") != null) {
                        %>
                        <button class="w3view-cart" onclick="gotoviewcart()" type="button" name="submit" value="">
                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                            <%
                                }
                            %>
                        </button>
                    </form>
                </div>
            </div>
            <!-- //cart details -->
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<!-- signin Model -->
<!-- Modal1 -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="main-mailposi">
                    <span class="fa fa-envelope-o" aria-hidden="true"></span>
                </div>
                <div class="modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">Sign In </h3>
                    <p>
                        Sign In now, Let's start your Grocery Shopping. Don't have an account?
                        <a href="#" data-toggle="modal" data-target="#myModal2">
                            Sign Up Now</a>
                    </p>
                    <form id="signinform">
                        <div class="styled-input agile-styled-input-top">
                            <input type="text" placeholder="Enter User Name" name="lusername" id="lusername" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="Enter Password" name="lpassword" id="lpassword" required="">
                        </div>
                        <input type="button" onclick="signlogic()" name="signupbutton" value="Sign Up">
                        <br>
                        <br>
                        <input type="button" onclick="forgotpasswordfn()" value="Forgot Password">
                    </form>
                    <div class="loginresult" id="loginresult" ></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //Modal content-->
</div>

<!-- //Modal1 -->
<!-- //signin Model -->
<!-- signup Model -->
<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="main-mailposi">
                    <span class="fa fa-envelope-o" aria-hidden="true"></span>
                </div>
                <div class="modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">Sign Up</h3>
                    <p>
                        Come join the Grocery Shoppy! Let's set up your Account.
                    </p>
                    <form id="signupform">
                        <div class="styled-input agile-styled-input-top">
                            <input type="text" placeholder="Enter Username" name="username" id="username" required="">
                        </div>
                        <div class="styled-input">
                            <input type="email" placeholder="Enter E-mail" name="email" id="email" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="Enter Password" name="password" id="password" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="Enter Phone Number" name="phoneno" id="phoneno" required="">
                        </div>
                        <div class="styled-input">
                            <input type="file" name="userphoto" id="userphoto">
                        </div>
                        <input type="button" onclick="signuplogic()" name="signupbutton" value="Sign Up">
                    </form>
                    <p>
                        <a href="#">By clicking register, I agree to your terms</a>
                    </p>
                </div>
            </div>

        </div>
        <!-- //Modal content-->
    </div>
</div>
<!-- //Modal2 -->
<!-- //signup Model -->
<!-- //header-bot -->
<!-- navigation -->
<div class="ban-top">
    <div class="container">
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav menu__list">
                            <li class="">
                                <a class="nav-stylehead" href="index.jsp">Home
                                </a>
                            </li>
                            <li class="">
                                <a class="nav-stylehead" href="about.jsp">About Us</a>
                            </li>


                            <li class="">
                                <a class="nav-stylehead" href="help.jsp">Help</a>
                            </li>

                            <li class="">
                                <a class="nav-stylehead" href="faqs.jsp">Faqs</a>
                            </li>

                            <li class="">
                                <a class="nav-stylehead" href="contact.jsp">Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- //navigation -->
<!-- banner -->