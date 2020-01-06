<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05.11.2019
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xartesus</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="img/css/all.css" rel="stylesheet"/>
    <style>
        body {
            background: radial-gradient(circle, rgb(38, 48, 97), rgb(76, 135, 212));
        }

        .no-btn-syle {
            background: none;
            color: inherit;
            border: none;
            font: inherit;
            cursor: pointer;
        }
    </style>
    <%
        String role = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("role")) role = cookie.getValue();
            }
        }
    %>
</head>
<body>


<div class="container-fluid">
    <div class="row mt-3 ">
        <div class="col-md-2 text-center ">
            <h1>Xartesus</h1>
        </div>
        <div class="col-md-3 align-self-center">
            <form class="form-inline">
                <input class="form-control mr-md-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fas fa-search"></i>
                </button>
            </form>
        </div>
        <div class="col"></div>
        <div class="col-md-3 align-self-center row">
            <div class="col-xs-2 m-2">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#shopingCart">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> Shop Cart
                </button>
            </div>
            <div class="col-xs-2 m-2">
                <!-- Button trigger modal -->
                <% String username = null;
                    if (session.getAttribute("user") != null) {%>
                <form action="Logout" method="post">
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-user-cog"></i> Logout
                    </button>
                </form>
                <%} else { %>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter">
                    <i class="fa fa-user" aria-hidden="true"></i> Login
                </button>
                <%} %>
            </div>
            <%
                if (session.getAttribute("role") != null) {
                    if (session.getAttribute("role").equals("0")) {%>
            <div class="col-xs-2 m-2">
                <form action="ProductManagment" method="post">
                    <button type="submit" class="btn btn-warning">
                        <i class="fas fa-user-cog"></i> Admin
                    </button>
                </form>
            </div>
            <%
                    }
                }
            %>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12 p-3">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active px-3">
                            <form action="GoBackToIndex" method="get">
                                <button type="submit" class="nav-link no-btn-syle">Home</button>
                            </form>
                        </li>
                        <li class="nav-item px-3">
                            <form action="Store" method="get">
                                <button type="submit" class="nav-link no-btn-syle">Shop</button>
                            </form>
                        </li>
                        <%
                            if (session.getAttribute("user") != null) {%>
                        <li class="nav-item px-3">
                            <form action="Library" method="get">
                                <button type="submit" class="nav-link no-btn-syle">Library</button>
                            </form>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-xl my-3">
            <form action="ProductInfo" method="get">
                <div class="d-flex flex-wrap justify-content-center">
                    <c:forEach items="${warehouseList.getWarehouseItemsList()}" var="warehouseItem">
                        <c:set var="isSold" value="${warehouseItem.isIs_sold()}"></c:set>
                        <c:if test="${!isSold}">
                            <div class="card rounded float-left m-2" style="width: 17rem;">
                                <img src="img/${warehouseItem.getProduct().getPicture()}" class="card-img-top"
                                     alt="...">
                                <h4 class="card-title">${warehouseItem.getProduct().getName()}</h4>
                                <p class="card-text text-right">${warehouseItem.getPrice()} zł</p>
                                <button class="btn btn-primary" type="submit"
                                        value="${warehouseItem.getId()}" name="warehouseID">See product
                                </button>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Sign in</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="d-flex justify-content-center col-xs-12">
                        <form action="LogIn" method="post">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="username" name="name">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="password" name="password">
                            </div>
                            <div class="form-group">
                                <input type="checkbox">Remember Me
                                <input type="submit" value="Login" class="btn btn-success float-right">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer row ">
                    <div class="col-md-12">
                        Don't have an account? <form action="Register" method="get">
                        <button type="submit" class="nav-link no-btn-syle">Sign Up</button>
                    </form>
                    </div>
                    <div class="col-md-12">
                        <a href="#">Forgot your password?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="shopingCart" tabindex="-1" role="dialog"
     aria-labelledby="shopingCartTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="shopingCartTitle">Shop Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="d-flex justify-content-center col-xs-12">

                    </div>
                </div>
                <div class="modal-footer row ">

                </div>
            </div>
        </div>
    </div>
</div>

<%-- JS Scripts ---%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<%-- JS Scripts ---%>


</body>
</html>
