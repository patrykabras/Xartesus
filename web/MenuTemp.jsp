<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<div class="row">
    <div class="col-md">

        <!--Navbar -->
        <nav class="navbar px-2 mb-2 navbar-expand-lg navbar-dark info-color">

            <form action="GoBackToIndex" id="GoBackToIndexFormH" method="post">
                <h1 class="m-3" id="GoBackToLinkH" style="cursor: pointer">Xartesus</h1>
            </form>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
                    aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item mx-3">
                        <form action="GoBackToIndex" id="GoBackToIndexForm" method="get">
                            <a class="nav-item nav-link active" id="GoBackToIndexLink" href="#">Home </a>
                        </form>
                    </li>
                    <li class="nav-item mx-3">
                        <form action="Store" id="Store" method="get">
                            <a class="nav-item nav-link active" id="StoreLink" href="#">Shop </a>
                        </form>
                    </li>
                    <% if (session.getAttribute("user") != null) {%>
                    <li class="nav-item mx-3">
                        <form action="GoToLibrary" id="GoToLibraryForm" method="post">
                            <a class="nav-item nav-link active" id="GoToLibraryLink" href="#">Library </a>
                        </form>
                    </li>
                    <%}%>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item mx-2">
                        <form class="navbar-form" role="search" action="SearchProduct" method="get">
                            <div class="input-group add-on">
                                <input class="form-control" placeholder="Search" name="searchProductName" id="srch-term"
                                       type="search">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary h-100" type="submit"><i
                                            class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </li>
                    <li class="nav-item mx-2">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#shopingCart">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i> Shop
                            Cart <% if (session.getAttribute("shopingCart") != null) {
                            Map shoppingCartTemp = (Map) session.getAttribute("shopingCart");
                            out.print("( " + shoppingCartTemp.size() + " )");
                        } else {
                            out.print("( 0 )");
                        }%>
                        </button>
                    </li>
                    <% if (session.getAttribute("user") != null) {%>
                    <li class="nav-item dropdown mx-2">
                        <a class="btn btn-success dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user"></i> <c:out value="${sessionScope.user}"/> </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-info"
                             aria-labelledby="navbarDropdownMenuLink-4">
                            <form action="Profile" method="get">
                                <button type="submit" class="btn btn-danger dropdown-item">
                                    <i class="fas fa-user-cog"></i> My account
                                </button>
                            </form>
                            <form action="GoToLibrary" method="get">
                                <button type="submit" class="btn btn-success dropdown-item">
                                    <i class="fas fa-gamepad"></i> Library
                                </button>
                            </form>
                            <%
                                if (session.getAttribute("role") != null) {
                                    if (session.getAttribute("role").equals("0")) {%>
                            <form action="ProductManagment" method="post">
                                <button type="submit" class="btn dropdown-item btn-warning bg-warning">
                                    <i class="fas fa-toolbox"></i> Admin
                                </button>
                            </form>
                            <%
                                    }
                                }
                            %>
                            <form action="Logout" method="post">
                                <button type="submit" class="dropdown-item btn-danger btn bg-danger">
                                    <i class="fas fa-sign-out-alt"></i> Log out
                                </button>
                            </form>
                        </div>
                    </li>

                    <%} else { %>
                    <li class="nav-item mx-2">
                        <button type="button" class="btn btn-success" data-toggle="modal"
                                data-target="#exampleModalCenter">
                            <i class="fas fa-sign-in-alt"></i> Log in
                        </button>
                    </li>
                    <%} %>

                </ul>
            </div>
        </nav>
        <!--/.Navbar -->
        <script>
            document.getElementById("GoBackToLinkH").onclick = function (ev) {
                document.getElementById("GoBackToIndexFormH").submit();
            }
            document.getElementById("GoBackToIndexLink").onclick = function (ev) {
                document.getElementById("GoBackToIndexForm").submit();
            }
            document.getElementById("StoreLink").onclick = function (ev) {
                document.getElementById("Store").submit();
            }
            document.getElementById("GoToLibraryLink").onclick = function (ev) {
                document.getElementById("GoToLibraryForm").submit();
            }
        </script>
    </div>
</div>
