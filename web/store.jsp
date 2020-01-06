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
    <title>Xartesus - Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <link href="img/css/all.css" rel="stylesheet"/>
    <style>
        body {
            background: radial-gradient(circle, rgb(38, 48, 97), rgb(76, 135, 212));
        }

        .back-to-top {
            position: fixed;
            bottom: 25px;
            right: 25px;
            z-index: 200;
        }

        .no-btn-syle {
            background: none;
            color: inherit;
            border: none;
            font: inherit;
            cursor: pointer;
        }

        .card-block {
            font-size: 1em;
            position: relative;
            margin: 0;
            padding: 1em;
            border: none;
            border-top: 1px solid rgba(34, 36, 38, .1);
            box-shadow: none;

        }

        .card {
            font-size: 1em;
            overflow: hidden;
            padding: 5px;
            border: none;
            border-radius: .28571429rem;
            box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
            margin-top: 20px;
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
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 50) {
                    $('#back-to-top').fadeIn();
                } else {
                    $('#back-to-top').fadeOut();
                }
            });
            // scroll body to 0px on click
            $('#back-to-top').click(function () {
                $('body,html').animate({
                    scrollTop: 0
                }, 400);
                return false;
            });
        });
    </script>
</head>
<body>
<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i
        class="fas fa-chevron-up"></i></a>

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
        <div class="col my-3">
            <div class="d-flex flex-wrap justify-content-center bg-light p-4">
                <h1>Filter:</h1>
                <form action="Filter" method="get" id="filter">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputPriceFrom">Price:</label>
                            <input type="number" class="form-control" id="inputPriceFrom" placeholder="from:">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPriceTo"> &nbsp; </label>
                            <input type="number" class="form-control" id="inputPriceTo" placeholder="to:">
                        </div>
                        <hr>
                    </div>
                    <div class="form-group">
                        <label for="type">Type</label>
                        <select name="type" id="type" class="form-control selectpicker" data-live-search="true"
                                multiple>
                            <c:forEach items="${type}" var="entry">
                                <option value="${entry.value}">${entry.value}</option>
                                <%--                                <option value="${entry.key}">${entry.value}</option>--%>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="genre">Genre</label>
                        <select name="genre" id="genre" class="selectpicker form-control" data-live-search="true"
                                multiple>
                            <c:forEach items="${genre}" var="entry">
                                <option value="${entry.key}">${entry.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="graphics">Graphics</label>
                        <select id="graphics" name="graphics" class="form-control selectpicker" data-live-search="true"
                                multiple>
                            <c:forEach items="${graphics}" var="entry">
                                <option value="${entry.key}">${entry.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="pegi">Pegi</label>
                        <select id="pegi" name="pegi" class="form-control selectpicker" data-live-search="true"
                                multiple>
                            <c:forEach items="${pegi}" var="entry">
                                <option value="${entry.key}">${entry.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="producer">Producer</label>
                        <select id="producer" name="producer" class="form-control selectpicker" data-live-search="true"
                                multiple>
                            <option value="">None</option>
                            <c:forEach items="${producer}" var="entry">
                                <option value="${entry.key}">${entry.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="publisher">Publisher</label>
                        <select id="publisher" name="publisher" class="form-control selectpicker"
                                data-live-search="true" multiple>
                            <c:forEach items="${publisher}" var="entry">
                                <option value="${entry.key}">${entry.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Use filter</button>
                </form>
            </div>
        </div>
        <div class="col-9 my-3 mr-3 py-2 bg-light">
            <form action="ProductInfo" method="get">
                <div class="d-flex flex-column justify-content-center">


                    <%--                    <c:forEach items="${warehouseList.getWarehouseItemsList()}" var="warehouseItem">--%>
                    <%--                        <c:set var="isSold" value="${warehouseItem.isIs_sold()}"></c:set>--%>
                    <%--                        <c:if test="${!isSold}">--%>
                    <%--                            <div class="card rounded float-left m-2" style="width: 17rem;">--%>
                    <%--                                <img src="img/${warehouseItem.getProduct().getPicture()}" class="card-img-top"--%>
                    <%--                                     alt="...">--%>
                    <%--                                <h4 class="card-title">${warehouseItem.getProduct().getName()}</h4>--%>
                    <%--                                <p class="card-text text-right">${warehouseItem.getPrice()} zł</p>--%>
                    <%--                                <button class="btn btn-primary" type="submit"--%>
                    <%--                                        value="${warehouseItem.getId()}" name="warehouseID">See product--%>
                    <%--                                </button>--%>
                    <%--                            </div>--%>
                    <%--                        </c:if>--%>
                    <%--                    </c:forEach>--%>

                    <c:forEach items="${productList.getProductList()}" var="productTest">
                        <div class="card">
                            <div class="row">
                                <div class="col-sm-5 d-flex justify-content-center">
                                    <img class="d-block w-50"
                                         src="${pageContext.request.contextPath}/img/${productTest.getPicture()}"
                                         alt="...">
                                </div>
                                <div class="col-sm-7">
                                    <div class="card-block">
                                        <h5 class="card-title">${productTest.getName()}</h5>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">Producer: ${productTest.getProducer()}</li>
                                            <li class="list-group-item">Publisher: ${productTest.getPublisher()}</li>
                                            <li class="list-group-item">Pegi: ${productTest.getPegi()}</li>
                                            <li class="list-group-item">Graphic: ${productTest.getGraphic()}</li>
                                            <li class="list-group-item">
                                                ReleaseDate: ${productTest.getReleaseDate()}</li>
                                            <li class="list-group-item">Genres: ${productTest.getGenres()}</li>
                                            <li class="list-group-item">Types: ${productTest.getTypes()}</li>
                                        </ul>
                                        <button class="btn btn-primary btn-block" type="submit"
                                                value="${productTest.getIdProduct()}" name="productID">See product
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
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
                        Don't have an account? <a href="#"> Sign Up</a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<%-- JS Scripts ---%>


</body>
</html>
