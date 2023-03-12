<%-- 
 Document : category 
 Created on : 11-Aug-2021, 20:00:31 
 Author : PC 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Product Page</title> 
        <link href="footer.css" rel="stylesheet"> 
        <link href="styles.css" rel="stylesheet"> 
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
                float:
                    left;
            }
            li a,i {
                display: block;
                color: white;
                text-align: center;
                padding: 25px 16px;
                text-decoration: none;
            }
            li
            a:hover {
                background-color:
                    #cccccc;
            }
            .tab{
                display: table;
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
            <li style=" float: right;"><form action="search.jsp" style="padding: 20px 16px"> 
                    <input type="text" placeholder="search..."> 
                    <input type="submit" value="search"> 
                </form></li> 
        </ul> 
        <div class="tab"> 
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
           try { 
            String cate=request.getParameter("cat"),category; 
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/product", "root", ""); 
            Statement st=conn.createStatement(); 
            ResultSet rs=st.executeQuery("select * from prd"); 
            %> 
            <br> 
            <br> 
            <% 
            while(rs.next()) 
            { 
             category=(rs.getString(4)); 
            if(cate.equals(category)) 
             { 
            %> 
            <table style="padding: 20px 20px;border: solid #000000;margin: 20px 20px;float: left" > 
                <th><a href="getproduct.jsp?pr_id=<%=rs.getString(1)%>"><img src="pics/<%=rs.getString(6)%>" 
                                                                             style=" height: 250px; width: 300px;"></a><br> 
                    Product_name:<%=rs.getString(2)%><br> 

                </th> 
            </table> 
            <% 
            } 
            } 
            } 
            catch(Exception e) 
            { 
            out.print(e); 
            } 
            %> 
        </div> 
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