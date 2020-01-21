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
    <title>Xartesus</title>
    <jsp:include page="HeaderTemp.jsp"/>
</head>
<body>
<jsp:include page="ErrorMessage.jsp"/>
<jsp:include page="TopTemp.jsp"/>
<jsp:include page="MenuTemp.jsp"/>
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
                                    value="${warehouseItem.getProduct().getIdProduct()}" name="productID">See
                                product
                            </button>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </form>
    </div>
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
                                            <p class="card-text"><small class="text-muted"><fmt:formatNumber type="number" maxFractionDigits="2" value="${type.value.getPrice()}"/>
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
