<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12.11.2019
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin - Product Manager</title>
</head>
<body>
    <label>genre :</label>
    <select name="genre">
        <c:forEach items="${genre}" var="entry">
            <option value="${entry.key}">${entry.value}</option>
        </c:forEach>
    </select>
    <label>graphics :</label>
    <select name="graphics">
        <c:forEach items="${graphics}" var="entry">
            <option value="${entry.key}">${entry.value}</option>
        </c:forEach>
    </select>
    <label>pegi :</label>
    <select name="pegi">
        <c:forEach items="${pegi}" var="entry">
            <option value="${entry.key}">${entry.value}</option>
        </c:forEach>
    </select>
    <label>producer :</label>
    <select name="producer">
        <c:forEach items="${producer}" var="entry">
            <option value="${entry.key}">${entry.value}</option>
        </c:forEach>
    </select>
    <label>publisher :</label>
    <select name="publisher">
        <c:forEach items="${publisher}" var="entry">
            <option value="${entry.key}">${entry.value}</option>
        </c:forEach>
    </select>
    <label>type :</label>
    <select name="type">
        <c:forEach items="${type}" var="entry">
            <option value="${entry.key}">${entry.value}</option>
        </c:forEach>
    </select>
</body>
</html>
