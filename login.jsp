<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <style>
            .disp{
                background-color: #ffffff;
                text-align: center;
                font-size:
                    x-large;
            }
        </style> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head> 
    <body> 
        <div class="disp"> 
            <% 
            pageContext.setAttribute("variable",5,PageContext.SESSION_SCOPE); 
            String user_id = request.getParameter("userid"); 
            String pass = request.getParameter("password"); 
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/registration","root",""); 
           Statement st= c.createStatement(); 
            ResultSet rs=st.executeQuery("select * from reg where userid='"+user_id+"'"); 
           try{ rs.next(); int x=0; 
 
            if(rs.getString("password").equals(pass)&&rs.getString("userid").equals(user_id)) 
            { 
            if(rs.getString("utype").equals("admin")) 
            { 
           x=1; } 
           else{ 
           x=2; 
            } 
           } 
           if(x==1) 
            { 
            String red = "admin.jsp"; 
           response.sendRedirect(red); 
            } 
            else if(x==2) 
            { 
            HttpSession se=request.getSession(); 
           se.setAttribute("uname",user_id); String home = "home.jsp"; 
            response.sendRedirect(home); 
            } 
           else 
            { 
            out.println("<script>alert('Invalid Password.');</script>"); 
            %> 
            <jsp:include page="login.html"/> 
            <% 
            } 
            } 
            catch (java.sql.SQLException e) 
            { 
            out.println("<script>alert('Invalid Username.');</script>"); 
            %> 
            <jsp:include page="login.html"/> 
            <% 
            } 
            catch (Exception e) { 
           out.print(e); 
            } 
            %> 
        </div> 
    </body> 
</html>