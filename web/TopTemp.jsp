<%--<%@ page import="java.util.Map" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<div class="container-fluid">--%>
<%--    <div class="row mt-3 ">--%>
<%--        <div class="col-md-2 text-center ">--%>
<%--            <h1>Xartesus</h1>--%>
<%--        </div>--%>
<%--        <div class="col-md-3 align-self-center">--%>
<%--&lt;%&ndash;            <form action="SearchProduct" method="get">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="row">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="col">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input name="searchProductName" class="form-control mr-md-2" type="search" placeholder="Search"&ndash;%&gt;--%>
<%--&lt;%&ndash;                               aria-label="Search">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="col">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button class="btn btn-outline-success" type="submit"><i class="fas fa-search"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </form>&ndash;%&gt;--%>
<%--            <form class="navbar-form" role="search" action="SearchProduct" method="get">--%>
<%--                <div class="input-group add-on">--%>
<%--                    <input class="form-control" placeholder="Search" name="searchProductName" id="srch-term" type="search">--%>
<%--                    <div class="input-group-btn">--%>
<%--                        <button class="btn btn-outline-success h-100" type="submit"><i class="fas fa-search"></i></button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <div class="col"></div>--%>
<%--        <div class="col-md-3 align-self-center row">--%>
<%--            <div class="col-xs-2 m-2">--%>
<%--                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#shopingCart">--%>
<%--                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> Shop--%>
<%--                    Cart <% if (session.getAttribute("shopingCart") != null) {--%>
<%--                    Map shoppingCartTemp = (Map) session.getAttribute("shopingCart");--%>
<%--                    out.print("( " + shoppingCartTemp.size() + " )");--%>
<%--                } else {--%>
<%--                    out.print("( 0 )");--%>
<%--                }%>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="col-xs-2 m-2">--%>
<%--                <!-- Button trigger modal -->--%>
<%--                <% String username = null;--%>
<%--                    if (session.getAttribute("user") != null) {%>--%>
<%--                <form action="Logout" method="post">--%>
<%--                    <button type="submit" class="btn btn-danger">--%>
<%--                        <i class="fas fa-user-cog"></i> Logout--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--                <%} else { %>--%>
<%--                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter">--%>
<%--                    <i class="fa fa-user" aria-hidden="true"></i> Login--%>
<%--                </button>--%>
<%--                <%} %>--%>
<%--            </div>--%>
<%--            <%--%>
<%--                if (session.getAttribute("role") != null) {--%>
<%--                    if (session.getAttribute("role").equals("0")) {%>--%>
<%--            <div class="col-xs-2 m-2">--%>
<%--                <form action="ProductManagment" method="post">--%>
<%--                    <button type="submit" class="btn btn-warning">--%>
<%--                        <i class="fas fa-user-cog"></i> Admin--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <%} else { %>--%>
<%--            <div class="col-xs-2 m-2">--%>
<%--                <form action="Profile" method="get">--%>
<%--                    <button type="submit" class="btn btn-danger">--%>
<%--                        <i class="fas fa-user-cog"></i> Profile--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <%--%>
<%--                    }--%>
<%--                }--%>
<%--            %>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
