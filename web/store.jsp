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
    <title>Xartesus - Store</title>
    <jsp:include page="HeaderTemp.jsp"/>
</head>
<body>
<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i
        class="fas fa-chevron-up"></i></a>

<jsp:include page="ErrorMessage.jsp"/>
<jsp:include page="TopTemp.jsp"/>
<jsp:include page="MenuTemp.jsp"/>
<div class="row">
    <div class="col-1 my-3"></div>
    <div class="col my-3">
        <div class="d-flex flex-wrap justify-content-center bg-light p-4">
            <div class="row">
                <div class="col-md"><h1>Filter:</h1></div>
            </div>
            <div class="row">
                <div class="col-md">
                    <form action="Filter" method="get" id="filter" style="max-width: 300px;">
                        <%--                <div class="form-row">--%>
                        <%--                    <div class="form-group col-md-6">--%>
                        <%--                        <label for="inputPriceFrom">Price:</label>--%>
                        <%--                        <input type="number" name="priceFrom" class="form-control" id="inputPriceFrom" placeholder="from:">--%>
                        <%--                    </div>--%>
                        <%--                    <div class="form-group col-md-6">--%>
                        <%--                        <label for="inputPriceTo"> &nbsp; </label>--%>
                        <%--                        <input type="number" name="priceTo" class="form-control" id="inputPriceTo" placeholder="to:">--%>
                        <%--                    </div>--%>
                        <%--                    <hr>--%>
                        <%--                </div>--%>
                        <div class="form-group">
                            <label for="type">Type</label>
                            <select name="type" id="type" class="form-control selectpicker" data-live-search="true"
                                    multiple>
                                <c:forEach items="${type}" var="entry">
                                    <option value="${entry.key}">${entry.value}</option>
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
                            <select id="graphics" name="graphics" class="form-control selectpicker"
                                    data-live-search="true"
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
                            <select id="producer" name="producer" class="form-control selectpicker"
                                    data-live-search="true"
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
        </div>
    </div>
    <div class="col-7 mt-3 mb-5 py-2 bg-light">
        <form action="ProductInfo" method="get">
            <div class="d-flex flex-column justify-content-center">
                <h4>Products amount: <c:out value="${productList.getProductList().size()}"/></h4>
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
    <div class="col-1 my-3"></div>
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
