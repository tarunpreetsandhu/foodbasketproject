<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function signuplogic()
            {

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
                            console.log(res);
                            res = res.trim();
                            if (res == "success")
                            {
                                document.getElementById("signupresult").innerHTML = "Sign up Successfully...You Will get message once admin will approve you and then you are able to login..";
                                
                            }
                            else
                            {
                                document.getElementById("signupresult").innerHTML = "User already exists";
                 
            }
                        }
                    };
                    xhr.open("POST", "merchantsignupresponse?", true);
                    xhr.send(formdata);
                }
            }
            
            
        </script>

    <div class="header-most-top">
        <p>FOOD BASKET</p>
    </div>

</head>
<body>
    <div class="container">

        <h3 class="tittle-w3l">Merchant Sign Up
            <span class="heading-style">
                <i></i>
                <i></i>
                <i></i>
            </span>
        </h3>

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <form id="signupform">
                    <div class="form-group">
                        <label for="name">Enter Name:</label>
                        <input type="text" class="form-control" style="width: 500px; align-content: center;" placeholder="Enter Name" name="name" id="name" required="">
                    </div>

                    <div class="form-group">
                        <label for="email">Enter E-Mail:</label>
                        <input type="text" class="form-control" style="width: 500px; align-content: center; " placeholder="Enter Email" name="email" id="email" required="">
                    </div>

                    <div class="form-group">
                        <label for="password">Enter Password:</label>
                        <input type="password" class="form-control" style="width: 500px; align-content: center; " placeholder="Enter Password" name="password" id="password" required="">
                    </div>

                    <div class="form-group">
                        <label for="phoneno">Enter Phone no:</label>
                        <input type="number" class="form-control" style="width: 500px; align-content: center; " placeholder="Enter Phoneno" name="phoneno" id="phoneno" required="">
                    </div>

                    <div class="form-group">
                        <label for="address">Enter Address:</label>
                        <input type="text" class="form-control" style="width: 500px; align-content: center; " placeholder="Enter Address" name="address" id="address" required="">
                    </div>

                    <div class="form-group">
                        <label for="city">Enter City:</label>
                        <br>
                        <select class="form-control"  style="width: 500px; align-content: center; " id="city" name="city" required="">
                            <option>Select City</option>
                            <option>Ambala</option>
                            <option>Amritsar</option>
                            <option>Ajmer</option>
                            <option>Allahabad</option>
                            <option>Ahmedabad</option>
                            <option>Agra</option>
                            <option>Bangalore</option>
                            <option>Bhopal</option>
                            <option>Chennai</option>
                            <option>Chandigarh</option>
                            <option>Delhi</option>
                            <option>Faridabad</option>
                            <option>Gwalior</option>
                            <option>Gurugram</option>
                            <option>Hyderabad</option>
                            <option>Jalandhar</option>
                            <option>Jodhpur</option>
                            <option>Jammu</option>
                            <option>Jaipur</option>
                            <option>Kanpur</option>
                            <option>Kochi</option>
                            <option>Kolkata</option>
                            <option>Ludhiana</option>
                            <option>Meerut</option>
                            <option>Mumbai</option>
                            <option>Nagpur</option>
                            <option>Noida</option>
                            <option>Pune</option>
                            <option>Patna</option>
                            <option>Rajkot</option>
                            <option>Surat</option>
                            <option>Srinagar</option>
                            <option>Tripura</option>
                            <option>Udaipur</option>
                            <option>Ujjain</option>
                            <option>Varanasi</option>
                            <option>Vadodara</option>

                        </select>
                    </div>


                    <div class="form-group">
                        <label for="myfile">Choose Photo:</label>
                        <input type="file" name="myfile" id="myfile"  />
                    </div>

                    <div class="form-group" style="text-align: center">

                        <input type="button" onclick="signuplogic()" class="btn btn-primary" name="signupbutton" value="Sign up">
                    </div>

                    <div class="signupresult" id="signupresult"></div>
                </form>

            </div>


        </div>
    </div>

  <%@include file ="footer.jsp" %>
</body>
</html>
