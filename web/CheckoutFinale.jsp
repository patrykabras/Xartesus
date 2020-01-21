<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Xartesus - Checkout</title>
    <jsp:include page="HeaderTemp.jsp"/>
</head>
<body>
<jsp:include page="ErrorMessage.jsp"/>
<jsp:include page="TopTemp.jsp"/>
<jsp:include page="MenuTemp.jsp"/>
<div class="row">
    <div class="col-xl-1"></div>
    <div class="col-xl my-3 p-2 bg-light d-flex justify-content-center">
        <%if (session.getAttribute("user") != null) {%>
        <div class="col-md-7">
            <h2>Payment Method:</h2>
            <label for="payment">Choose:</label>
            <select id="payment" name="publisher" class="form-control">
                <option value="0">PayPal</option>
            </select>
        </div>
        <div class="col-md-4">
            <div class="row">
                <h2>Summary:</h2>
                <c:forEach var="type" items="${sessionScope.shopingCart}">
                    <div class="card mb-3 w-100">
                        <div class="row no-gutters">
                            <div class="col-md-2">
                                <img src="img/${type.value.getPicture()}" class="card-img" alt="...">
                            </div>
                            <div class="col-md">
                                <div class="card-body">
                                    <h5 class="card-title">${type.value.getProductName()}</h5>
                                    <p class="card-text"><small class="text-muted">
                                        <fmt:formatNumber type="number" maxFractionDigits="2"
                                                          value="${type.value.getPrice()}"/>
                                        zl</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <p class="card-text">Price: <fmt:formatNumber type="number" maxFractionDigits="2"
                                                              value="${sessionScope.shopingCartPrice}"/> zl</p>
            </div>
            <div class="row">
                <form action="CheckoutPay" method="post">
                    <button type="submit" class="btn btn-warning btn-block">
                        Buy
                    </button>
                </form>
            </div>
        </div>

        <%} else { %>
        <div class="row">
            <div class="d-flex justify-content-center col-md-5">
                <div class="modal-body">
                    <p class="navbar-text text-warning">Please log in if you want to buy products from your
                        shopping cart. </p>
                    <div class="container">

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
                                <input type="submit" value="Login" class="btn btn-success btn-block">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center col-md-2"></div>
            <div class="d-flex justify-content-center col-md-5">

                <form class="p-2" action="RegisterForm" method="post">
                    <p class="navbar-text text-warning"> Don't have account? Create here. </p>
                    <div id="login" class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                        </div>
                        <input name="login" class="form-control" placeholder="Login" type="text" required>
                    </div>
                    <div id="password" class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                        </div>
                        <input name="password" class="form-control" placeholder="Create password" type="password"
                               required>
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                        </div>
                        <input name="email" type="email" class="form-control" id="exampleInputEmail1"
                               aria-describedby="emailHelp" placeholder="Enter email" required>
                    </div>
                    <hr class="separator">
                    <div id="name" class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fas fa-address-card"></i> </span>
                        </div>
                        <input name="name" class="form-control" placeholder="Name" type="text" required>
                    </div>
                    <div id="surname" class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fas fa-address-card"></i> </span>
                        </div>
                        <input name="surname" class="form-control" placeholder="Surname" type="text" required>
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="far fa-calendar-alt"></i> </span>
                        </div>
                        <input name="birth_date" class="form-control" type="date" id="example-date-input" required>
                    </div>

                    <hr class="separator">

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block"> Create Account</button>
                    </div> <!-- form-group// -->
                </form>


            </div>
        </div>
        <%} %>
    </div>
    <div class="col-xl-1"></div>
</div>
<jsp:include page="FooterTemp.jsp"/>

<!-- Modal -->
<jsp:include page="ModalLogin.jsp"/>
<%--<jsp:include page="ModalShopCart.jsp"/>--%>
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
                    <div class="d-flex flex-column col-xs-12">
                        <%
                            if (session.getAttribute("shopingCart") != null) {

                        %>
                        <c:forEach var="type" items="${sessionScope.shopingCart}">
                            <%--                            Key is ${type.key}--%>
                            <%--                            Value is ${type.value}--%>
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img src="img/${type.value.getPicture()}" class="card-img" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">${type.value.getProductName()}</h5>
                                            <p class="card-text"><small class="text-muted"><fmt:formatNumber
                                                    type="number" maxFractionDigits="2"
                                                    value="${type.value.getPrice()}"/>
                                                zl</small></p>
                                            <form action="RemoveFromCart" method="get">
                                                <button class="btn btn-danger btn-block" type="submit"
                                                        value="${type.value.getWarehouseId()}" name="warehosueItemID">
                                                    Remove
                                                    Product
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <%}%>
                    </div>
                </div>
                <div class="modal-footer row ">
                    <form class="w-100" action="GoToShopCartFullPage" method="get">
                        <button class="btn btn-primary btn-block" type="submit">Checkout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- JS Scripts ---%>
<jsp:include page="ScriptsTemp.jsp"/>
<%-- JS Scripts ---%>


</body>
</html>
