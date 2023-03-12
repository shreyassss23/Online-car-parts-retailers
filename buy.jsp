<%--
 Document : buy 
 Created on : 28-Aug-2021, 15:21:38 
 Author : PC 
--%> 
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Buy Page</title> 
    </head> 
    <body> 
        <% 
        String total= request.getParameter("total"); 
        HttpSession se=request.getSession(); 
        String a=se.getAttribute("uname").toString(); 
       try{ 
        int trans_id=0; 
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/buy","root",""); 
        PreparedStatement ps2 = c2.prepareCall("select * from buy order by trans_id desc limit 0,1"); 
        ResultSet rs2 = ps2.executeQuery(); 
       if(rs2.next()) 
        { 
        trans_id=rs2.getInt(1)+1; 
        session.setAttribute("bill_no",trans_id); 
        } 
       else{ 
        trans_id=1; 
        session.setAttribute("bill_no",trans_id); 
        } 
        HttpSession se1=request.getSession(); 
        String tid=se1.getAttribute("bill_no").toString(); 
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/cart","root",""); 
        PreparedStatement ps = c.prepareCall("select * from cart where user_id='"+a+"' "); 
        ResultSet rs = ps.executeQuery(); 
        while(rs.next()) 
        { 
        String pid=rs.getString(3); 
        String img=rs.getString(1); 
        String name=rs.getString(2); 
        String qty=rs.getString(5); 
        String price=rs.getString(4); 
        Connection c1=DriverManager.getConnection("jdbc:mysql://localhost/buy","root",""); 
        PreparedStatement ps1=c1.prepareStatement("INSERT INTO buy( trans_id, user_id, pid, img, pr_name 
       , price, qty, total, date1) VALUES (?,?,?,?,?,?,?,?,?)"); 
       ps1.setString(1,tid); 
        ps1.setString(2,a); 
       ps1.setObject(3,pid); 
       ps1.setObject(4,img); 
       ps1.setObject(5,name); 
       ps1.setObject(6,price); 
       ps1.setObject(7,qty); 
       ps1.setString(8,total); 
        ps1.setString(9,""+new java.util.Date()); 
       ps1.executeUpdate(); 
        } 
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/cart","root",""); 
       PreparedStatement ps1 = c1.prepareCall("delete from cart where user_id='"+a+"' "); int 
       i=ps1.executeUpdate(); 
        %> 
        <script>
            alert('Order Placed Successfully.');
            window.location.href = "add.jsp?trans_id=<%=tid%>";
        </script>"); 
        <% 
        } 
        catch (Exception e) 
        { 
        out.print(e); 
        } 
        %> 
    </body> 
</html>