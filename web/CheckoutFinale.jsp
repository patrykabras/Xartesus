<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Xartesus - Checkout</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="img/css/all.css" rel="stylesheet"/>
    <link href="img/css/xartesus.css" rel="stylesheet"/>
</head>
<body>
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
        <button type="button" class=" btn btn-success btn-block p-2 m-3" data-toggle="modal"
                data-target="#exampleModalCenter">
            <i class="fa fa-user" aria-hidden="true"></i> Login
        </button>
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
