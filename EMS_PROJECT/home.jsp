<%@ page import="java.sql.*" %>
  <% 
   if (request.getParameter("i")!=null)
{
   int id=Integer.parseInt(request.getParameter("i"));
try{
   DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
   String url="jdbc:mysql://localhost:3306/EMS_PROJECT";
   Connection con=DriverManager.getConnection(url,"root","abc456"); 
   String sql="delete from employee where id=?";  
   PreparedStatement pst=con.prepareStatement(sql);
   pst.setInt(1,id);
   pst.executeUpdate();
con.close();
}catch(SQLException err)
{out.println("issue "+  err);}

}
%>


<html>
 <head>
  <title>employee mS System</title>
  <Style> 
  *{font-size:50px}
   .nav{background-color:black;font-size:50px;}
   .nav a{color:white;text-decoration:none; margin:2%; text-align:left;}
   .nav1{font-size:40px;text-align:right;margin-top:-555px;}
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

<h1><b>Employee Information</b></h1>

<br/> 

  <table border="3" style="width:50%">
     <tr>
           <th>ID</th>
           <th>Name</th>
           <th>Department</th>
           <th>salary</th>
           <th>Delete</th>
           <th>Update</th> 
     </tr>   

<%
    try{
   DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
   String url="jdbc:mysql://localhost:3306/EMS_PROJECT";
   Connection con=DriverManager.getConnection(url,"root","abc456"); 
   String sql="select * from employee " ;
  Statement stmt=con.createStatement();
   ResultSet rs=stmt.executeQuery(sql);

    while(rs.next())
{
    int id=rs.getInt(1);
    String name=rs.getString(2);
    String dept=rs.getString(3);
    int salary=rs.getInt(4);
%>
    <tr style="text-align:center;">
       <td> <%=id%> </td>
        <td> <%=name %> </td>
       <td> <%=dept %> </td>
       <td> <%=salary%> </td>
       <td> <a href="?i=<%=id %>" onclick="return confirm('r u sure??')" style="text-decoration:none";>delete</a> </td>
      <td> <a href="update.jsp?u=<%=id %>" style="text-decoration:none";>update</a> </td> 
    
 </tr>  
<%

}
  

}catch(SQLException err)
{out.println("issue "+  err);}


%>

</table>
<div class="nav1">
<form>
   <input type="submit" value="logout" name="btn">
</form>
<% 
  if(request.getParameter("btn")!=null)
{   request.getSession().invalidate();
   response.sendRedirect("index.jsp");
}
%> 
</div>
     
   </center>
 </body>

</html>