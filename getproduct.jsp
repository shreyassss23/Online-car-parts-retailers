<%--
 Document : getproduct 
 Created on : 12 Aug, 2021, 5:57:37 PM 
 Author : saurabh 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %> 
<%@page import="java.util.*" %> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>JSP Page</title> 
        <link href="styles.css" rel="stylesheet"> 
        <link href="footer.css" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css"> 
        <style>
            ul {
                list-style-type: none;
                padding: 0;
                overflow:
                    hidden;
                background-color: #000000;
            }
            li {
                float: left;
            }
            li a,i {
                display: block;
                color:
                    white;
                text-align:
                    center;
                padding: 25px
                    16px;
                text-decoration: none;
            }
            li
            a:hover {
                background-color: #cccccc;
            }
            .image{
                text-decoration: none;
                border-color: black;
                border-style: inset;
                width :auto;
                height:auto;
            }
            .image:hover {
                transform: scale(1.5);
            }
            p{
                font-weight: bold;
                color: red;
            }
            .col-2{
                font-size: 20px;
                font-weight: bold;
                foont-name:arial;
                height: 300px;
                width: 400px;
                text-align: center;
                float: left;
            }
            .wellcome{
                font-size: x-large;
                color:
                    crimson;
                background-color: yellow;
                text-align:
                    center;
            }
            .footer1{
                margin-bottom: auto;
                background-color: #000000;
            }
            table{
                left: 0;
            }
            input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
        </style> 
    </head> 
    <body> 
        <a href="home.html"><img src="logo2.jpg" alt="Car Parts Retailer" style=" height: 68px; width:
                                 200px;float: left;"></a> 
        <ul> 
            <li><a href="home.jsp">Home</a></li> 
            <li><a href="about.html">About</a></li> 
            <li><a href="history.jsp">History</a></li> 
            <li><a href="logout.jsp">Logout</a></li> 
            <a href="cart.jsp"><i class="fa fa-cart-plus fa-2x" aria-hidden="true"></i></a> 
            <li style=" float: right;"><form style="padding: 20px 16px"> 
                    <input type="text" placeholder="search..."> 
                    <input type="submit" value="search"> 
                </form> 
            </li> 
        </ul> 
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
    </div> 
    <% 
    String PID = request.getParameter("pr_id"); 
   try { 
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/product","root",""); 
    PreparedStatement ps = con.prepareStatement("select * from prd where pr_id='"+PID+"'"); 
   ResultSet rs = ps.executeQuery(); 
    while(rs.next()) 
    { 
    %> 
    <h2 style=" padding-bottom:20px; text-align: center;font-size:30px">Product Details</h2> 
    <div class="col-2"> 
        <img src="pics/<%=rs.getString(6)%>" style="width:50% ; height: 80%" > 

        <h1 style="font-size: 20px;font-style: normal; font-name:calibri;fontweight:normal"><%=rs.getString(5)%></h1> 
    </div> 
    <form action="tocart.jsp"> 
        <table height="300px"> 
            <tr> 
                <td><input type="hidden" value="<%=rs.getString(1)%>" name="pid" readonly></td> 
            </tr> 
            <tr> 
                <td> product name: &nbsp;&nbsp;&nbsp;</td> 
                <td> <input type="text" value="<%=rs.getString(2)%>" name="name" readonly></td> 
            </tr> 
            <tr> 
                <td>Product type: &nbsp;&nbsp;&nbsp;</td> 
                <td> <input type="text" value="<%=rs.getString(4)%>" name="typ" readonly></td> 
            </tr> 


            <tr> 
                <td>price ₹&nbsp;&nbsp;&nbsp;</td> 
                <td><input type="text" value="<%=rs.getString(3)%>" name="pr" readonly></td> 
            </tr> 
            <tr> 
                <td> Product quantity&nbsp;&nbsp;&nbsp;</td> 
                <td><input type="text" value="1" name="qty" ></td> 
            </tr> 
            <tr> 
                <td><input type="hidden" value="<%=rs.getString(6)%>" name="img" ></td> 
            </tr> 
            <tr > 
                <td colspan="2"><input type="submit" value="Add to Cart" 
                                       style="width: 300px ;height:40px; background-color: orange;
                                       font-size: 20px; text-decoration: none; color: black;border-style: solid "></td> 
            </tr> 
        </table> 
    </form> 
    <% 
    } 
    } 
    catch(Exception e) 
    { 
    out.print(e); 
    } 
    %> 

</body> 
</html>