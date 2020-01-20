<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Fake PayPal</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            background: #2980B9;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #FFFFFF, #6DD5FA, #2980B9);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #FFFFFF, #6DD5FA, #2980B9); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <h1> From Xartesus:   </h1>
        </div>
        <div class="col-md-8 d-flex justify-content-center">
            <div class="row">
                <h1>Payment Information</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <p> To Pay:  <fmt:formatNumber type="number" maxFractionDigits="2" value="${shopingCartPrice}"/> zl</p>
        </div>
        <div class="col-md-8 d-flex justify-content-center">
            <div class="row">
                <form action="PayCard" method="post">
                    <div class="form-row">
                        <label for="cardNumber">Card Nubmer</label>
                        <input id="cardNumber" type="text" class="input-group" placeholder="card number">
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="expire">Expiration (mm/yy)</label>
                            <input id="expire" type="text" class="input-group" placeholder="Expiration (mm/yy)">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cardNumber">Security Code</label>
                            <input id="Security Code" type="text" class="input-group" placeholder="Security Code">
                        </div>
                    </div>
                    <div class="form-row">
                        <button class="btn btn-warning btn-block" type="submit"> <fmt:formatNumber type="number" maxFractionDigits="2" value="${shopingCartPrice}"/> zl</p> </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--Scripts--%>
<jsp:include page="ScriptsTemp.jsp"/>

</body>
</html>
