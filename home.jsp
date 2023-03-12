<!DOCTYPE html> 
<!--
To change this license header, choose License Headers in Project Properties. 
To change this template file, choose Tools | Templates and open the 
template in the editor. 
--> 
<html> 
    <head> 
        <title>Home Page</title> 
        <link href="footer.css" rel="stylesheet"> 
        <link href="styles.css" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css"> 
        <style> ul
            {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #000000;
            }
            li {
                float: left;
            }
            li a,i{
                display:
                    block;
                color: white;
                text-align: center;
                padding: 25px 16px;
                text-decoration: none;
            }
            li a:hover {
                background-color: #cccccc;
            }
            table, tr, th, td{
                border:
                    solid #000000;
                border-collapse: collapse;
            }
            .wellcome{
                font-size: x-large;
                color: crimson;
                background-color: yellow;
                text-align: center;
            }
            .footer1{
                padding: 20px
                    16px;
                background-color:
                    #000000;
            }
            .nav{

            }
        </style> 
        <meta charset="UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    </head> 
    <body> 
        <div class="nav"> 
            <a href="home.html"><img src="logo2.jpg" alt="Car Parts Retailer" style=" height: 69px; width:
                                     200px;float: left;"></a> 
            <ul> 
                <li><a href="home.jsp">Home</a></li> 
                <li><a href="about.html">About</a></li> 
                <li><a href="history.jsp">History</a></li> 
                <li><a href="logout.jsp">Logout</a></li> 
                <a href="cart.jsp"><i class="fa fa-cart-plus fa-2x" aria-hidden="true"></i></a> 
                <li style=" float: right;"><form action="search.jsp" style="padding: 20px 16px"> 
                        <input type="text" placeholder="search..."> 
                        <input type="submit" value="search"> 
                    </form></li> 
            </ul> 
        </div> 
        <% try{ 
         out.println("<script>\n" + 
         "\n" + 
         " if(!!window.performance && window.performance.navigation.type == 2)\n" + 
         " {\n" + 
         " window.location.reload(true);\n" + 
         " // object.reload(forcedReload);\n" + 
         " //window.location = window.location; \n" + 
         " }\n" + 
         " </script> "); 
         HttpSession se=request.getSession(); 
        if(session.getAttribute("uname")==null) 
         { 
         response.sendRedirect("login.html"); 
         } 
        else 
         { 
         String a=se.getAttribute("uname").toString(); 
         } 
         } 
         catch(Exception e) 
         { 
         out.println(e); 
         } 
        %> 
        <table style="width: 100%;height: 300px;margin-top: 20px"> 
            <tr> 
                <th><a href="category.jsp?cat=body"><img src="pics/body.jpg" height="150px" 
                                                         width="300px"></a><br><br> 
                    Body</th> 
                <th><a href="category.jsp?cat=engine"><img src="pics/engine.jpg" height="150px" 
                                                           width="300px"></a><br><br> 
                    Engine</th> 
                <th><a href="category.jsp?cat=wheels"><img src="pics/wheels.jpg" height="150px" 
                                                           width="300px"></a><br><br> 
                    Wheels</th> 
                <th><a href="category.jsp?cat=dashboard"><img src="pics/dashboard.jpg" height="150px" 
                                                              width="300px"></a><br><br> 
                    Dashboard</th> 
            </tr> 
        </table><br> 
        <br><br><br><br> 
        <footer> 
            <div class="footer1"> 
                <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none; color: white">About 
                    us</a>&nbsp;&nbsp;&nbsp; 
                <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none; color:
                   white">Contact</a>&nbsp;&nbsp;&nbsp; 
                <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none; color: white" 
                   >Services</a>&nbsp;&nbsp;&nbsp; 
                <a href="#" style="font-weight: bold;font-size: 20px;text-decoration: none;color: white">Need 
                    Help?</a>&nbsp;&nbsp;&nbsp; 

                <br> 

                <br> 

                <a href="#" class="fa fa-facebook" ></a> 
                <a href="#" class="fa fa-youtube"></a> 
                <a href="#" class="fa fa-instagram"></a> 
                <a href="#" class="fa fa-twitter"></a><br> 
                <a href="mailto:prasad@example.com" style="font-weight: bold;font-size: 20px;text-decoration:
                   none;color: red">Sgcars@gmail.com</a></p> 
                <p style="font-weight: bold;font-size: 20px;text-decoration: none;color: blue">© Copyright 2021 -
                    All Rights Reserved</p> 
            </div> 
        </footer> 
    </body> 
</html>