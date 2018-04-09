<%--



Need to add stuff for our profile page
Currently this is just exactly the same as login.jsp-- need to go through and
change all the things that don't relate to the profile (logging in, etc)
and add the things we do need (changing picture, bio)
See User.java for all the methods to call -Michelle

	- Limit biography to only 180 characters long (changeable in User.java)
	- Need to create a new class to parse the image to store in the picture
	- Grad year is limited to 2018 <= year <= 2024 (changeable in User.java)

	private String bio;
  	private byte[] pic; // pictures can be stored as byte arrays
 	private String school; // name of their school
 	private int gradYear; // year they'll graduate




--%>

<!DOCTYPE html>
<html>
<head>
 <title>Login</title>
 <link rel="stylesheet" href="/css/main.css">
 <style>
   label {
     display: inline-block;
     width: 100px;
   }
 </style>
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <a href="/users/<%=request.getSession().getAttribute("user")%>">My Profile</a>
  </nav>


 <div id="container">
   <h1><%= request.getSession().getAttribute("user") %>'s Profile Page</h1>
   <hr>

   <h4>About <%= request.getSession().getAttribute("user") %></h4>
   <output form="about_form"></output>
   </br>
   <form action="/users/<%=request.getSession().getAttribute("user")%>" id="about_form" method="POST">
     <textarea name="about_text" cols="120" rows="5"></textarea>
     </br>
     <button type="submit">Submit</button>
   </form>
   <hr>
   <h4><%= request.getSession().getAttribute("user") %>'s sent messages</h4>
 </div>
</body>
</html>
