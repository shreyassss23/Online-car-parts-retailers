<%-- 
 Document : pay 
 Created on : 30-Aug-2021, 20:59:09 
 Author : PC 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Pay Page</title> 
        <link href="footer.css" rel="stylesheet"> 
        <link href="styles.css" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/fontawesome.min.css"> 
        <style>
            table ,tr ,td ,th {
                border-collapse: collapse;
                text-align: center;
                margin:
                    30px;
            }
            tr ,td
            ,th{
                padding:
                    20px;
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
            .mob{
                margin: 50px;
                border: 1px solid #000000;
                padding: 40px;
                padding-left: 70px;
            }
            h1{
                text-align: center;
                color: #ff0000;
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
        HttpSession se=request.getSession(); 
        String a=se.getAttribute("uname").toString(); 
        String mob=request.getParameter("mob"); 
        String add=request.getParameter("add1"); 
        String trans_id=request.getParameter("trans_id"); 
        //String trans_id="1"; 
        %> 
        <div class="mob"> 
            <% 
            out.println("<h1>Welcome "+a+"</h1><br>"); out.println("Your Mobile Number is : +91 <b 
           style='color: #000000'>" +mob+"</b><br><br><br>"); out.println("<b style='color:red'>Please use 
           Your Mobile Number for further transactions.</b>"); 
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/buy","root",""); 
            PreparedStatement ps = c.prepareCall("select * from buy where trans_id='"+trans_id+"'"); 
            ResultSet rs = ps.executeQuery(); 
            if(rs.next()) 
            { 
            String total=rs.getString(8); 
            %> 
            <table> 
                <form action="payment.jsp"> 
                    <input type="hidden" name="trans_id" value="<%=trans_id%>"> 
                    <tr><td>Total Amount :</td><td><input type="text" name="total" 
                                                          value="<%=total%>"></td></tr> 
                    <tr> 
                        <td colspan=2> 
                            <!--Designing the radio buttons for the payment mode in the Payment Method form. --> 
                    <tr><td><input name=optPaymentType onClick="return checkpayment(this)" type="radio" 
                                   value="cash"required=>Cash On Delivery</td><td> 
                            <input name=optPaymentType onClick="return checkpayment(this)" type="radio" value="card" 
                                   readonly>Credit/Debit Card 
                        </td><tr> 
                        </table> 
                    <input type="submit" value="Pay Now" style="width: 300px ;height:30px; background-color:
                           #3399ff;
                           font-size: 20px; text-decoration: none; color: black;border:1px solid #000000;margin: 30px;"> 
                </form> 
                <p>Product will Delivered at <%=add%></p> 
        </div> 
        <% 
        } 
        %> 

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