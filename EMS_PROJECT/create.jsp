<%@ page import="java.sql.*" %>

<html>
 <head>
  <title>Employee mS System</title>
  <Style> 
  *{font-size:50px}
  .nav{background-color:black;font-size:50px;}
   .nav a{color:white;text-decoration:none; margin:2%; text-align:left;}
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
 <h1>Add employee</h1>
<br/>
     <form>
      <input type="number" name="id" placeholder="enter emp id" required >
     <br/><br/>
      <input type="text" name="name" placeholder="enter emp name" required >
      <br/><br/>
      <input type="text" name="dept" placeholder="enter emp dept" required >
      <br/><br/>
      <input type="number" name="salary" placeholder="enter emp salary" required >
         <br/><br/>  
      <input type="submit" value="submit" name="btn" >
       
</form>

  <%
     if(request.getParameter("btn")!=null)
   {
    int id=Integer.parseInt(request.getParameter("id"));
    String name=request.getParameter("name");
    String dept=request.getParameter("dept");
    int salary=Integer.parseInt(request.getParameter("salary"));   
try{
   DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
   String url="jdbc:mysql://localhost:3306/EMS_PROJECT";
   Connection con=DriverManager.getConnection(url,"root","abc456"); 
   String sql="insert into employee values(?,?,?,?)";  
   PreparedStatement pst=con.prepareStatement(sql);
   pst.setInt(1,id);
   pst.setString(2,name);
   pst.setString(3,dept);
   pst.setInt(4,salary);
   pst.executeUpdate();
    out.println("record created");
  response.sendRedirect("index.jsp");
con.close();
}catch(SQLException err)
{out.println("issue "+  err);}
}

%>

   </center>
 </body>

</html>