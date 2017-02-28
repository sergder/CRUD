<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users</title>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
    <style>
        h1.header {
            text-align: center;
        }

        a:link{
            text-decoration: none;
        }

        a:hover {
            color: red;
        }

        .current {
            background-color: gray;
            text-align: center;
            color: aliceblue;
        }

        a.current {
            color: aliceblue;
        }

        .mainTable {
            width: 75%;
        }
    </style>
</head>

<body>

<header class="w3-container w3-teal">
    <h1 class="header">User Manager - CRUD App for JavaRush</h1>
</header>
<br />

<div class="w3-container">
<h1>Users</h1>

<c:if test="${usersCount == 0}">
    <br />
    <p>No users found</p>
    <br />
</c:if>
<c:if test="${!empty listUsers}">
    <form action="<c:url value="/users/search"/>" method="post">
        <input type="text" name="criterion" value="${search.criterion}" />
        <input type="submit" name="search" id="1" value="Search" />
        <c:if test="${!empty search.criterion}">
            <a href="<c:url value="/users/1"/>"><input type="button" name="clear" id="2" value="Clear filter" /></a>
        </c:if>
    </form>
</c:if>
    <br />
</div>

<div class="w3-container mainTable">
    <c:if test="${!empty listUsers}">
        <table class="w3-table w3-striped w3-border">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Admin</th>
                <th>Creation Date</th>
                <th colspan="2"></th>
            </tr>
            <c:forEach items="${listUsers}" var="users">
            <tr>
                <td>${users.id}</td>
                <td>${users.name}</td>
                <td>${users.age}</td>
                <td>
                    <c:choose>
                    <c:when test="${users.admin == true}">YES</c:when>
                    <c:otherwise>NO</c:otherwise>
                    </c:choose>
                </td>
                <td>${users.createdDate}</td>
                <td><a href="<c:url value="/edit/${users.id}"/>">Edit</a></td>
                <td><a href="<c:url value="/delete/${users.id}"/>">Delete</a></td>
            </tr>
            </c:forEach>
        </table>
    </c:if>
    <br />
    <div class="w3-container">
        <c:if test="${usersCount > 0}">
            <center>
                <table>
                    <tr>
                        <td>Page:</td>
                        <c:forEach begin="${1}" end="${(usersCount/10) + (usersCount%10==0?0:1)}" var="i">
                            <td <c:if test="${page == i}"> class="current" </c:if>>
                                <a href="<c:url value="/users/${i}" />" <c:if test="${page == i}"> class="current" </c:if>> ${i} </a>
                            </td>
                        </c:forEach>
                    </tr>
                </table>
            </center>
        </c:if>
    </div>
</div>

<div class="w3-container">

    <c:if test="${empty search.criterion}">

        <c:if test="${!empty user.name}">
            <h2>Edit user:</h2>
        </c:if>
        <c:if test="${empty user.name}">
            <h2>Add user:</h2>
        </c:if>

        <c:url var="addAction" value="/users/add" />
        <form:form action="${addAction}" commandName="user">
            <table class="w3-border" style="padding: 5px">
                <c:if test="${!empty user.name}">
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="ID" />
                            </form:label>
                        </td>
                        <td>
                            <form:input path="id" readonly="true" cssStyle="background-color: lightgrey; color: gray" />
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td>
                        <form:label path="name">
                            <spring:message text="Name" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="name"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="age">
                            <spring:message text="Age" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="age" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="admin">
                            <spring:message text="Admin" />
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="admin" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <center>
                            <c:if test="${!empty user.name}">
                                <input type="submit" value="<spring:message text="Edit user" />"
                            </c:if>
                            <c:if test="${empty user.name}">
                                <input type="submit" value="<spring:message text="Add user" />"
                            </c:if>
                        </center>
                    </td>
                </tr>
            </table>
        </form:form>
    </c:if>

    <hr />
    <a href="<c:url value="/"/>">Main page</a>
    <br />

</div>

</body>
</html>
