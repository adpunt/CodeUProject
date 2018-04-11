<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<!DOCTYPE html>
<html>
<head>
  <title>CodeU Chat App</title>
  <link rel="stylesheet" href="/css/index.css" type="text/css">
</head>
<body>

  <%-- <nav>
    <a id="navTitle" href="/">Home</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <a href="/conversations">Conversations</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/about.jsp">About</a>
    <%-- <a href="/testdata">Load Test Data</a> --%>
  </nav>

  <div id="container">
      <p>Welcome to ToadBlue</p>
      <form action="/login" method="POST">
        <label for="username">USERNAME</label>
        <br/>
        <input type="text" class="text-line" name="username" id="username">
        <br/>
        <label for="password">PASSWORD</label>
        <input type="password" class="text-line" name="password" id="password">
        <br/><br/>
        <button type="submit">Login</button>
      </form>
  </div>
</body>
</html>
