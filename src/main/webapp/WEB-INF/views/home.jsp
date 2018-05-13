<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${contextPath}/resources/css/welcome.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
    <title>Home</title>

</head>
<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</c:if>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />
<div class="container">
    <div class="row" id="cont">
        <div class="col-2">

        <nav class="nav flex-column " id="nav_left">
    <input type="button" class="btn btn-sm btn-primary btn-block " value="all" id="all"/>
            <input type="button"  class="btn btn-sm btn-primary btn-block" value="transistor" id="transistor"/>
            <input type="button" class="btn btn-sm btn-primary btn-block " value="capacitor" id="capacitor"/>
            <input type="button" class="btn btn-sm btn-primary btn-block " value="resistor" id="resistor"/>
            <input type="button" class="btn btn-sm btn-primary btn-block " value="diode" id="diode"/>
            <input type="button" class="btn btn-sm btn-primary btn-block " value="led" id="led"/>




        </nav>
        </div>
    <div class="col-10">
<table id="tableClient" class="table table-hover table-condensed">
    <thead>
    <tr>
            <th style="width:82%">Product</th>
            <th style="width:5%">Price</th>
            <th style="width:8%">Quantity</th>

            <th style="width:5%"></th>
    </tr>
    </thead>
</table>
    </div>
</div>

</div>


<script src="${contextPath}/resources/js/home.js"></script>
<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>