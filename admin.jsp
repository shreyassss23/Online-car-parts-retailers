<%-- 
 Document : admin 
 Created on : 06-Sep-2021, 21:38:54 
 Author : PC 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <style>
            ul{
                list-style-type: none;
                padding: 0;
                overflow: hidden;
                background-color: #000000;
                text-align: center;
            }
            li{
                float: right;
            }
            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 25px 16px;
                text-decoration: none;
            }
            table, td, th{
                text-align: center;
                border: 1px solid black;
                padding: 5px;
            }
            table{
                border-spacing: 15px;
            }
        </style> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Admin Page</title> 
    </head> 
    <body> 
        <ul> 
            <li style="float: left; font-size: large;padding: 25px 16px;color: azure"> Welcome Admin </li> 
            <li><a href="login.html">Login </a></li> 
            <li><a href="addpr.html">Add Product</a></li> 
            <li><a href="admin.jsp">Admin Page</a></li> 
        </ul> 
    </body> 
    <% 
    try { 
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/product", "root", ""); 
    Statement st=conn.createStatement(); 
    ResultSet rs=st.executeQuery("select * from prd"); 
    %> 
    <br> 
    <br> 
    <table border="1" align="center" style="height: 100%;width: 100%" > 
        <div style=" "> 
            <th>product_ID</th> 
            <th>Name</th> 
            <th>Price</th> 
            <th>category</th>
            <th>Description</th> 
            <th>image</th> 
            <th>Options</th> 
                <% 
                while(rs.next()) 
                { 
                %> 
            <tr> 
                <td><%=rs.getString(1)%></td> 
                <td><%=rs.getString(2)%></td> 
                <td><%=rs.getString(3)%></td> 
                <td><%=rs.getString(4)%></td> 
                <td><%=rs.getString(5)%></td> 
                <td><img src="pics/<%=rs.getString(6)%>" style=" height: 250px; width: 300px;"></td> 
                <td><a href="removeprd.jsp?removeval=<%=rs.getString(1)%>"> 
                        <button class="button button1" style="width: 100% ;height:30px; background-color: orange;
                                font-size: 20px; text-decoration: none; color: black; border:1px solid
                                #000000">Remove</button></a><br><br> 
                    <a href="edit.jsp?edit=<%=rs.getString(1)%>"><button class="button2" style="width: 100%
                                                                         ;height:30px; background-color: orange;
                                                                         font-size: 20px; text-decoration: none; color: black; border:1px solid
                                                                         #000000">Edit</button></a></td> 
            </tr> 
            <% 
            } 
            } 
            catch(Exception e) 
            { 
            out.print(e); 
            } 
            %> 
            </html>