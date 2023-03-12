<%-- 
 Document : register 
 Created on : Aug 1, 2021, 9:39:27 PM 
 Author : PC 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%> <!DOCTYPE 
    html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Reg Page</title> 
    </head> 

    <% 
    String Name= request.getParameter("t1"); 
    String Age= request.getParameter("t2"); 
    String Email= request.getParameter("emid"); 
    String User_Name= request.getParameter("t4"); 
   String password= request.getParameter("t5"); try 
   { 
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/registration", "root", ""); 
    Statement st=conn.createStatement(); 
   int i=st.executeUpdate("INSERT INTO 
   reg(name,age,email,userid,password)VALUES('"+Name+"','"+Age+"','"+Email+"','"+User_Name+"','"+passwor 
   d+"')"); 
    } 
    catch(Exception e) 
    { 
    out.print(e); 
    } 
    String red = "login.html"; 
   response.sendRedirect(red); 
    %> 

</html>