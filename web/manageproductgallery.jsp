<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
        </script>

        <script>


            var jsonarr;

            function addphototogallery()
            {
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;
                var flag = 0;

                for (var i = 0; i < controls.length; i++)
                {
                    //if name is given to every input type
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }
                    if (controls[i].type == "file")
                    {
                        //if file is selected by user
                        if (controls[i].files.length > 0)
                        {
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    } else
                    {
                        // for input type text ,password, email
                        formdata.append(controls[i].name, controls[i].value);
//                        alert(formdata);
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
                    var xhr = new XMLHttpRequest();

                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText;
                            res = res.trim();
                            if (res == "success")
                            {
                                document.getElementById("status").innerHTML = "Photo added Successfuly";
                                document.getElementById("status").style.color = "green";


                                document.getElementById("caption").value = "";
                                document.getElementById("myfile").value = "";


                                fetchgallery();

                            } else
                            {
                                document.getElementById("status").innerHTML = "Error in adding Photo";
                                document.getElementById("status").style.color = "red";

                            }

                        }
                    };

                    xhr.open("POST", "addproductgallery", true);


                    xhr.send(formdata);

                }

            }


            function fetchgallery()
            {

                var xhr = new XMLHttpRequest();

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var res = xhr.responseText;
                        res = res.trim();

                        var jsonobj = JSON.parse(res);

                        jsonarr = jsonobj["ans"];

                        var ans = "";

                        ans += "<div class=\"row\">";


                        for (var i = 0; i < jsonarr.length; i++)
                        {
                            var o = jsonarr[i];
                            ans += "<div class='col-sm-3'>";

                            ans += "<div class='gimg'>";
                            ans += "<div style='text-align:right;padding:5px;'><span class='fa fa-times' onclick=\"delphoto('"+o.pgid+"')\" style='font-size:25px;'></span></div>"
                            ans += "<img src=\"" + o.photo + "\" class='img-responsive' />";
                            ans += "<h5>" + o.caption + "</h5>";
                            ans += "</div>";
                            ans += "</div>";

                        }

                        ans += "</div>";

                        document.getElementById("sec").innerHTML = ans;

                    }
                };

                var pid = document.getElementById("pid").value;
                xhr.open("GET", "fetchproductgallery?pid=" + pid, true);
                xhr.send();


            }



            function delphoto(pgid)
            {
                var option = confirm("Are you sure you want to delete it?");

                if (option == true)
                {
                    var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText;
                            res = res.trim();
                            if (res == "success")
                            {
                                document.getElementById("status").innerHTML = "Deleted successfuly";
                                fetchgallery();

                            } else
                            {
                                document.getElementById("status").innerHTML = "Error in deletion";

                            }
                        }
                    };

                    xhr.open("GET", "deleteproductgallery?pgid=" + pgid, true);
                    xhr.send();

                }

            }




        </script>
        <style>

            .gimg
            {
                padding: 10px;
                border-bottom: 2px solid brown;
                box-shadow: 1px 1px 11px rgba(0,0,0,0.3);
                border-radius: 3px;
                margin: 10px;
            }
            .gimg h5{
                text-align: center;
                font-weight: bold;
                font-size: 25px;
                margin-top: 10px;
            }
        </style>

    </head>
    <body onload="fetchgallery()">


        <div class="header-most-top">
            <p>FOOD BASKET</p>
        </div>

        <div class="container">

            <h3 class="tittle-w3l">Add Gallery Photo
                <span class="heading-style">
                    <i></i>
                    <i></i>
                    <i></i>
                </span>
            </h3>

            <div class="row">

                <div class="col-sm-8 offset-sm-2" >
                    <br>
                    <div style="margin: 20px;">
                        <form id="form1">

                            <div class="form-group">
                                <label for="caption">Enter Caption:</label>
                                <input type="text" placeholder="Enter Product name" name="caption" id="caption" class="form-control"  />
                            </div> 
                            <input type="text" placeholder="Enter Product id" name="pid" id="pid" class="form-control" hidden="" value="<%=request.getParameter("pid")%>"  />


                            <div class="form-group">
                                <label for="myfile">Choose Photo:</label>
                                <input type="file" name="myfile" id="myfile"  />
                            </div>

                        </form>
                        <input type="button" class="btn btn-success" value="ADD" onclick="addphototogallery()" />

                        <h3 id="status"></h3>
                    </div>
                </div>

            </div>
            <br>

            <div class="container">
                <h3 style="font-size: 22px;" class="tittle-w3l text-center">Already Added Photos
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
            </div>
            <div id="sec"></div>
        </div>

    </body>
</html>

