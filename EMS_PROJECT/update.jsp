<%@ page import="java.sql.*" %>

<html>
 <head>
  <title>Student mS System</title>
  <Style> 
  *{font-size:50px}
   .nav{background-color:black;font-size:50px;}
   .nav a{color:white;text-decoration:none;  margin:2%; text-align:left;}
  </Style>
 </head>
 <body>
  <%
    if(session.getAttribute("user")!=null)
     {
      
}else
  {  response.sendRedirect("index.jsp");}
%> 

     <div class="nav">
         <a href="home.jsp";>Home</a>
         <a href="create.jsp";>Create</a>
        <a href="update.jsp";>Update</a>
      </div>
 <center>
<h1>Update Page</h1>
<br/>
     <form>
      <input type="number" name="id" placeholder="enter emp id  to be chnge " required >
     <br/>    <br/>
      <input type="text" name="name" placeholder="enter change name " required >
     <br/>    <br/>
       <input type="text" name="dept" placeholder="enter change dept " required >
     <br/>    <br/>
      <input type="number" name="salary" placeholder="enter change salary" required >
     <br/>    <br/>
      <input type="submit" value="update" name="btn" >
       
</form>
<%

if (request.getParameter("btn")!=null)
 {      int id=Integer.parseInt(request.getParameter("id"));
          String name=request.getParameter("name");
           String dept=request.getParameter("dept");
          int salary=Integer.parseInt(request.getParameter("salary"));  
   try
    {     
          DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
          String url="jdbc:mysql://localhost:3306/EMS_PROJECT";
          Connection con=DriverManager.getConnection(url,"root","abc456"); 
          String sql="update employee set name=? ,dept=?,salary=? where id=?";  
          String sqll="select * from employee where id=?";
          PreparedStatement pst=con.prepareStatement(sql);
          PreparedStatement pstt=con.prepareStatement(sqll);
          
          pst.setString(1,name);
          pst.setString(2,dept);
          pst.setInt(3,salary);
          pst.setInt(4,id);
          pstt.setInt(1,id);

          ResultSet rs=pstt.executeQuery();
          if(rs.next())
            {    pst.executeUpdate();
                          out.println("record updated");
                 response.sendRedirect("home.jsp");
          } else   {out.println("invalid rno");}
             
    
       
          con.close();
   

   }catch(SQLException er)
     {out.println("issue "+  er);}
 }

%>

   </center>
 </body>

</html>