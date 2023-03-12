<%-- 
 Document : order_detail 
 Created on : 01-Sep-2021, 20:39:23 
 Author : PC 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Order Details Page</title> 
        <link href="footer.css" rel="stylesheet"> 
        <link href="styles.css" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css"> 
        <style>
            table ,tr ,td ,th {
                border-collapse: collapse;
                text-align: center;
                margin: 20px;
            }
            ul {
                list-style-type: none;
                margin: 0;
                padding:
                    0;
                overflow: hidden;
                background-color: #000000;
            }
            li {
                float: left;
            }
            li a,i{
                display: block;
                color: white;
                text-align: center;
                padding: 25px 16px;
                text-decoration: none;
            }
            li
            a:hover {
                background-color: #cccccc;
            }
            .total{
                font-size:large;
                color: #ff0000;
                float: right;
            }
        </style> 
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
        <% 
        String tid= request.getParameter("tid"); 
        HttpSession se=request.getSession(); 
        String a=se.getAttribute("uname").toString(); 
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/buy","root",""); 
        PreparedStatement ps = c.prepareCall("select * from buy where user_id='"+a+"' and trans_id='"+tid+"'"); 
       ResultSet rs = ps.executeQuery(); 
        %> 
        <table border="1" align="center" style="height: 100%;width: 100%" > 
            <div> 
                <th>Product</th> 
                <th>Price</th> 
                <th>Quantity</th> 
                <th>Amount</th> 
            </div> 
            <% 
             while(rs.next()) 
             { 
             int amount=Integer.parseInt(rs.getString(6))*Integer.parseInt(rs.getString(7)); 
            %> 
            <tr> 
                <td><img src="pics/<%=rs.getString(4)%>" height="150px" width="300px" style=" padding: 10px
                         30px;margin: auto;"></td> 
                <td><%=rs.getString(6)%></td> 
                <td><%=rs.getString(7)%></td> 
                <td><%=amount %></td> 

            </tr> 
            <% 
            } 
            %> 
        </table> 
        <% 
        PreparedStatement ps1 = c.prepareCall("select * from buy where user_id='"+a+"' and 
       trans_id='"+tid+"'"); 
        ResultSet rs1 = ps1.executeQuery(); 
       rs1.next(); 
        if(rs1.getString(10).equals("Confirmed")) 
        { 
        %> 
        <p class="total">Total amount :<%=rs1.getString(8)%></p> 
        <a href="cancel_order.jsp?trans_id=<%=rs1.getString(1)%>"> <button style="width: 300px
                                                                           ;height:30px; background-color: orange; font-size: 20px; text-decoration: none; color: black;
                                                                           border:1px solid #000000;margin : 10px; float: right;"> 
                Cancel Order</button></a> 
                <% 
               } 
               else 
               { 
                %> 
        <p class="total">Total :<%=rs1.getString(8)%></p> 
        <a href="add.jsp?trans_id=<%=rs1.getString(1)%>"> 
            <button style="width: 300px ;height:30px; background-color: orange; font-size: 20px;
                    text-decoration: none; color: black; border:1px solid #000000;margin : 10px; float:
                    right;"> 
                Buy Now</button></a> 
                <% 
                } 
                %> 
        <br><br><br> 
        <br><br><br> 
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