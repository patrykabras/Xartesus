<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div aria-live="polite" aria-atomic="true">
    <!-- Position it -->
    <div style="position: absolute; top: 5px; right: 50%;z-index:500">

        <c:if test="${sessionScope.errorMessageList != null}">
            <c:forEach items="${sessionScope.errorMessageList}" var="errorMessage">
                <div class="toast <c:out value="${errorMessage.getErrorType()}" />" role="alert" aria-live="assertive"
                     aria-atomic="true" data-autohide="false">
                    <div class="toast-header">
                        <strong class="mr-auto"><c:out value="${errorMessage.getTitle()}"/></strong>
                        <small class="text-muted">just now</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="toast-body">
                        <c:out value="${errorMessage.getDescription()}"/>
                    </div>
                </div>
            </c:forEach>
            <c:remove var="errorMessageList" scope="session"/>
        </c:if>
    </div>
</div>