<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <title>CRUD JavaRush App</title>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
    <style>
        h1.header {
            text-align: center;
        }
        a:link {
            text-decoration: underline;
        }

        a:hover {
            text-decoration: underline;
            color: red;
        }

        p {
            font-size: larger;
        }
    </style>
</head>
<body>
  <header class="w3-container w3-teal">
      <h1 class="header">User Manager - CRUD App for JavaRush</h1>
  </header>
  <br />
  <div class="w3-container" align="center">
      <h1>Welcome!</h1>
      <p>This is the test task for entering JavaRush internship.</p>
      <p>To proceed to user management page click here: <a class="index" href="<c:url value="/users/1"/>">User Manager</a>.</p>
      <p>Enjoy!</p>
  </div>
</body>
</html>
