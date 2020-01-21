<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xartesus - Admin Product Manager</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <link href="img/css/all.css" rel="stylesheet"/>
    <style>
        .flyBtn{
            position:fixed;
            width:60px;
            height:60px;
            bottom:40px;
            right:40px;
            background-color:#0C9;
            color:#FFF;
            border-radius:50px;
            text-align:center;
            box-shadow: 2px 2px 3px #999;
        }
    </style>
</head>
<body>
<form action="GoBackToIndex" method="get">
    <button type="submit" class="btn btn-primary flyBtn"  data-toggle="tooltip" data-placement="left" title="Go back to main page"><i class="fas fa-home"></i></button>
</form>
<ul class="nav nav-pills mb-3 sticky-top bg-light" id="pills-tab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#home" role="tab"
           aria-controls="pills-home" aria-selected="true">Product List</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#addProduct" role="tab"
           aria-controls="pills-profile" aria-selected="false">Add Product</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#addDictionaryTable" role="tab"
           aria-controls="pills-contact" aria-selected="false">Directionary Table</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-warehouse-tab" data-toggle="pill" href="#warehouse" role="tab"
           aria-controls="pills-contact" aria-selected="false"> Warehouse </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-add-product-to-warehouse-tab" data-toggle="pill" href="#addProdcutToWarehouse"
           role="tab"
           aria-controls="pills-contact" aria-selected="false"> Add product to Warehouse </a>
    </li>
</ul>

<div class="tab-content" id="pills-tabContent">
    <%--  Home  --%>
    <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="pills-home-tab" id="home">
        <div class="d-flex flex-wrap justify-content-center">
            <c:forEach items="${productList.getProductList()}" var="productTest">
                <%--        ${productTest} <br />--%>
                <div class="card m-3 " style="width: 18rem;">
                    <img src="${pageContext.request.contextPath}/img/${productTest.getPicture()}" class="card-img-top"
                         alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${productTest.getName()}</h5>
                        <p class="card-text">...</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Producer: ${productTest.getProducer()}</li>
                        <li class="list-group-item">Publisher: ${productTest.getPublisher()}</li>
                        <li class="list-group-item">Pegi: ${productTest.getPegi()}</li>
                        <li class="list-group-item">Graphic: ${productTest.getGraphic()}</li>
                        <li class="list-group-item">ReleaseDate: ${productTest.getReleaseDate()}</li>
                        <li class="list-group-item">Genres: ${productTest.getGenres()}</li>
                        <li class="list-group-item">Types: ${productTest.getTypes()}</li>
                    </ul>
                    <div class="card-body">
                        <a href="#${productTest.getIdProduct()}" class="card-link">ID
                            : ${productTest.getIdProduct()}</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <%--    Add Product --%>
    <div class="tab-pane fade show  container" role="tabpanel" aria-labelledby="pills-addProduct-tab" id="addProduct">
        <div class="row">
            <div class="col-sm">
                <form action="AddProduct" method="post" enctype="multipart/form-data">
                    <label for="name">name:</label>
                    <input type="text" class="form-control" id="name" placeholder="name" name="name" required>
                    <label for="type">type :</label>
                    <select name="type" id="type" class="form-control selectpicker" data-live-search="true" multiple
                            required>
                        <c:forEach items="${type}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <label for="genre">genre :</label>
                    <select name="genre" id="genre" class="selectpicker form-control" data-live-search="true" multiple
                            required>
                        <c:forEach items="${genre}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <label>graphics :</label>
                    <select name="graphics" class="form-control selectpicker" data-live-search="true" required>
                        <c:forEach items="${graphics}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <label>pegi :</label>
                    <select name="pegi" class="form-control selectpicker" data-live-search="true" required>
                        <c:forEach items="${pegi}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <label>producer :</label>
                    <select name="producer" class="form-control selectpicker" data-live-search="true" required>
                        <c:forEach items="${producer}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <label>publisher :</label>
                    <select name="publisher" class="form-control selectpicker" data-live-search="true" required>
                        <c:forEach items="${publisher}" var="entry">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </select>
                    <label>release date :</label>
                    <input type="date" class="form-control" name="releaseDate" required>
                    <label>single img :</label>
                    <input type="file" class="form-control" name="blob" required>
                    <button type="submit" class="btn btn-primary btn-lg btn-block my-3">Submit</button>
                </form>
            </div>
        </div>
        <%--    Add Product --%>
    </div>
    <%--- Add Directonary Table ---%>
    <div class="tab-pane fade show  container" role="tabpanel" aria-labelledby="pills-dictionary-tab"
         id="addDictionaryTable">
        <div class="row">
            <div class="col-sm">
                <form action="AddGenre" method="post">
                    <label for="genreName">genre name:</label>
                    <input type="text" class="form-control" id="genreName" placeholder="genre name" name="name">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="col-sm">
                <form action="AddGraphics" method="post">
                    <label for="gaphicsName">gaphics name:</label>
                    <input type="text" class="form-control" id="gaphicsName" placeholder="gaphics name" name="name">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="col-sm">
                <form action="AddPegi" method="post">
                    <label for="pegiName">pegi name:</label>
                    <input type="text" class="form-control" id="pegiName" placeholder="pegi name" name="name">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-sm">
                <form action="AddProducer" method="post">
                    <label for="producerName">producer name:</label>
                    <input type="text" class="form-control" id="producerName" placeholder="producer name" name="name">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="col-sm">
                <form action="AddPublisher" method="post">
                    <label for="publisherName">publisher name:</label>
                    <input type="text" class="form-control" id="publisherName" placeholder="publisher name" name="name">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="col-sm">
                <form action="AddType" method="post">
                    <label for="typeName">type name:</label>
                    <input type="text" class="form-control" id="typeName" placeholder="type name" name="name">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>

    <div class="tab-pane fade show " role="tabpanel" aria-labelledby="pills-warehouse-tab" id="warehouse">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Product Name</th>
                <th scope="col">Product ID</th>
                <th scope="col">Price</th>
                <th scope="col">Is Key Purchased</th>
                <th scope="col">Is Key Sold</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${warehouseList.getWarehouseItemsList()}" var="warehouseItem">
                <tr>
                    <th scope="row">${warehouseItem.getId()}</th>
                    <td>${warehouseItem.getProduct().getName()}</td>
                    <td>${warehouseItem.getProduct().getIdProduct()}</td>
                    <td>${warehouseItem.getPrice()}</td>
                    <td>${warehouseItem.getKey_purchased()}</td>
                    <td>${warehouseItem.isIs_sold()}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <div class="tab-pane fade show  container" role="tabpanel" aria-labelledby="pills-add-product-to-warehouse-tab"
         id="addProdcutToWarehouse">
        <form action="AddProductToWarehouse" method="post">
            <label for="id_product">Product :</label>
            <select name="id_product" id="id_product" class="form-control selectpicker" data-live-search="true"
                    required>
                <c:forEach items="${productList.getProductList()}" var="productTest">
                    <option value="${productTest.getIdProduct()}" >${productTest.getName()}</option>
                </c:forEach>
            </select>
            <div class="form-group">
                <label for="price">Price: </label>
                <input type="number" step="0.01" class="form-control" id="price" name="price">
            </div>
<%--            <div class="form-group">--%>
<%--                <label for="key_purchased">Key purchased: </label>--%>
<%--                <input type="text" class="form-control" id="key_purchased" name="key_purchased"--%>
<%--                       placeholder="key_purchased">--%>
<%--            </div>--%>
<%--            <div class="form-check">--%>
<%--                 <input class="form-check-input" name="is_sold" type="checkbox" id="is_sold"--%>
<%--                       value="is_sold"--%>
<%--                       aria-label="...">Is Sold--%>
<%--            </div>--%>
            <div class="form-group">
                <label for="productAmount">Product Amount: </label>
                <input type="number" class="form-control" id="productAmount" name="productAmount"
                       placeholder="product Amount">
            </div>
            <button type="submit" class="btn btn-primary btn-lg btn-block my-3">Submit</button>
        </form>
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
