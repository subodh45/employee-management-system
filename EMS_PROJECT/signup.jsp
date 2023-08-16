<%@ page import="java.sql.*" %>

<html>
  <head>
   <title>Authentication </title>  
  <style>
   *{font-size: 50px;}
    a{text-decoration:none;}
</style>
  </head>
   <body>
     <center>
    <h1>Login Page</h1>
     <form method="POST">
       <input type="text" name="un" placeholder="enter your username" required/> <br/> <br/>
       <input type="password" name="pswd" placeholder="enter your password" required/> <br/> <br/>
        <input type="password" name="pswd2" placeholder=" confirm password" required/> <br/> <br/>
        <input type="submit" name="btn" value="Signup"/> <br/> <br/>
       <a href="index.jsp">Login page</a>
       </form>
       
        <%  if(request.getParameter("btn")!=null)
         {
             String un=request.getParameter("un");
             String pswd=request.getParameter("pswd");
             String pswd2=request.getParameter("pswd2");
           
          if(!pswd.equals(pswd2))
            {out.println("password didn not match ");
              return;     }

           if(pswd.length()<8)
            {out.println("min 8 character plzz ");
              return;}
           
          try{
 
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
              String url="jdbc:mysql://localhost:3306/EMS_PROJECT";
              Connection con=DriverManager.getConnection(url,"root","abc456");
              String sql="insert into users values(?,?)";
              PreparedStatement pst=con.prepareStatement(sql);
              pst.setString(1,un);
              pst.setString(2,pswd);
              pst.executeUpdate();
              con.close();
              response.sendRedirect("index.jsp");
         }catch(SQLException er )
          {
            out.println("isuue" + er);
         }
            

          }
         
        %> 
    
    </center>
   </body>

</html>