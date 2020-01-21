<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05.11.2019
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Xartesus - ${product.getName()}</title>
    <jsp:include page="HeaderTemp.jsp"/>
</head>
<body>
<jsp:include page="ErrorMessage.jsp"/>
<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i
        class="fas fa-chevron-up"></i></a>

<jsp:include page="TopTemp.jsp"/>
<jsp:include page="MenuTemp.jsp"/>
<div class="row">
    <div class="col-xl-1"></div>
    <div class="col-xl my-3">
        <div class="d-flex flex-column justify-content-center">

            <div class="card">
                <div class="row">
                    <div class="col-sm-5 d-flex justify-content-center">
                        <img class="d-block w-50"
                             src="${pageContext.request.contextPath}/img/${product.getPicture()}"
                             alt="...">
                    </div>
                    <div class="col-sm-7">
                        <div class="card-block">
                            <h5 class="card-title">${product.getName()}</h5>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Producer: ${product.getProducer()}</li>
                                <li class="list-group-item">Publisher: ${product.getPublisher()}</li>
                                <li class="list-group-item">Pegi: ${product.getPegi()}</li>
                                <li class="list-group-item">Graphic: ${product.getGraphic()}</li>
                                <li class="list-group-item">
                                    ReleaseDate: ${product.getReleaseDate()}</li>
                                <li class="list-group-item">Genres: ${product.getGenres()}</li>
                                <li class="list-group-item">Types: ${product.getTypes()}</li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div class="bg-light mt-3">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Product Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Add to Shop</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${warehouseProducts}" var="warehouseItem">
                        <tr class="active">
                            <td>${warehouseItem.getProduct().getName()}</td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="2"
                                                  value="${warehouseItem.getPrice()}"/> zl
                            </td>
                            <td>
                                <form action="AddToCart" method="post">
                                    <button class="btn btn-primary btn-block" type="submit"
                                            value="${warehouseItem.getId()}" name="warehouseID">Add to Cart
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
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
