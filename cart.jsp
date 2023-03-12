<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <link href="footer.css" rel="stylesheet"> 
        <link href="styles.css" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css"> 
        <style> ul
            {
                list-style-type: none;
                padding: 0;
                overflow:
                    hidden;
                background-color:
                    #000000;
            }
            li {
                float: left;
            }
            li a {
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
            table ,tr ,td ,th {
                border-collapse: collapse;
                text-align:
                    center;
            }
            .wellcome{
                font-size: x-large;
                color: crimson;
                background-color: yellow;
                text-align: center;
            }
            .footer1{
                padding: 25px
                    16px;
                background-color:
                    #000000;
            }
            .total{
                position: absolute;
                right: 0px;
                max-width:
                    500px;
                padding: 16px;
                margin-right: 50px;
                border:
                    1px solid #000000;
                text-align: left;
            }
            .total h3{
                text-decoration: underline;
                text-align: center;
            }
            input {
                border-top-style:
                    hidden;
                border-right-style:
                    hidden;
                border-left-style:
                    hidden;
                border-bottom-style:
                    groove;
            }
        </style> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head> <body> 
        <a href="home.html"><img src="logo2.jpg" alt="Car Parts Retailer" style=" height: 68px; width:
                                 200px;float: left;"></a> 
        <ul> 
            <li><a href="home.jsp">Home</a></li> 
            <li><a href="about.html">About</a></li> 
            <li><a href="history.jsp">History</a></li> 
            <li><a href="logout.jsp">Logout</a></li> 
            <li style=" float: right;"><form action="search.jsp" style="padding: 20px 16px"> 
                    <input type="text" placeholder="search..."> 
                    <input type="submit" value="search"> 
                </form></li> 
        </ul> 
        <% 
       try{ 
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

        <% 
        HttpSession se=request.getSession(); 
        String a=se.getAttribute("uname").toString(); 
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/cart","root",""); 
        PreparedStatement ps = c.prepareCall("select * from cart where user_id='"+a+"' "); 
       ResultSet rs = ps.executeQuery(); 
        %> 
        <br> 
        <br> 
        <table border="1" align="center" style="height: 100%;width: 100%" > 
            <div> 
                <th>Product</th> 
                <th>Name</th> 
                <th>Price</th> 
                <th>Quantity</th> 
                <th>Option</th> 
            </div> 
            <% int 
            total=0; 
             while(rs.next()) 
             { 
            %> 
            <tr> 
                <td><img src="pics/<%=rs.getString(1)%>" height="150px" width="300px" style=" padding: 10px
                         30px;margin: auto;"></td> 
                <td><%=rs.getString(2)%></td> 
                <td>₹ <%=rs.getString(4)%></td> 
                <td><input type="number" value="<%=rs.getString(5)%>" name="pr"></td> 
                <td><a href="removecart.jsp?removeval=<%=rs.getString(3)%>"> 
                        <button style="width: 100px ;height:30px; background-color: orange;
                                font-size: 20px; text-decoration: none; color: black;border:1px solid #000000"> 
                            Remove</button></a></td> 
            </tr> 
            <% 
             total = total + Integer.parseInt(rs.getString(6).trim()); 
             } 
            %> 
            <tr> 
                <td colspan="4" style=" margin:10px 20px;padding: 5px 40px">Total</td> 
                <td>₹ <%=total%></td> 
            </tr> 
        </table> 
        <br> 
        <br> 
        <div class="total"> 
            <h3>Cart Total</h3> 
            <table> 
                <form action="buy.jsp"> 
                    <tr><td>Subtotal : </td><td>₹<input type="text" name="subtotal" value="<%=total%>"></td></tr> 
                    <tr><td>Total:</td><td>₹<input type="text" name="total" value="<%=total%>"></td></tr> 
                    <tr><td><input type="submit" value="Place Order" style="width: 100% ;height:30px; backgroundcolor: orange;
                                   font-size: 20px; text-decoration: none; color: black; border:1px solid #000000"></td></tr> 
                </form> 
            </table> 
        </div> 
        <% 
        rs.close(); 
        %> 
        <br><br><br><br><br><br> 
        <br><br><br><br><br><br> 
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
                   none;color: red">prasadgagare@gmail.com</a></p> 
                <p style="font-weight: bold;font-size: 20px;text-decoration: none;color: blue">© Copyright 2021 -
                    All Rights Reserved</p> 
            </div> 
        </footer> 
    </body> 
</html>