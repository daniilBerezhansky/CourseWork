<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 26.04.2018
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>
    <link href="${contextPath}/resources/css/creditCart.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/shoppingCart.css.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
</head>
<c:set var="price" value="${0}"></c:set>
<c:set var="pr" value="${0}"></c:set>
<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</c:if>

<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />
<div class="container">
<div id="deck">
<div class="card-deck-wrapper py-6">
    <div class="card-columns"> <%--<div class="card-deck">--%>
<c:forEach items="${products}" var="product" varStatus="status">
        <div class="card text-center" style="max-width: 200px;">

            <c:set var="pr" value="${product.price*cart.get(status.index).amount}" />
            <!-- Heading -->
            <div class="card-body">
                <h4 class="card-title">${product.name}</h4>
                <h6 class="card-subtitle text-muted">${cart.get(status.index).amount} units: <fmt:formatNumber type="number" maxFractionDigits="2" value="${pr}" />$</h6>
            </div>

            <!-- Image -->
            <img src="${product.image}" alt="Photo of product">

            <!-- Text Content -->
            <div class="card-body">
                <p class="card-text">${product.description}</p>
                <input type="hidden" value="${product.id}">
                <input id="delBtn" type="button" class="btn btn-primary" value="Delete from cart"/>
            </div>

        </div>
    <c:set var="price" value="${price + pr}" />
</c:forEach>
    </div>
</div>
</div>
    </div>

<input type="hidden" value="${price}" id="amount"/>
<div class="container py-6">

<form >
    <div class="form-group">
        <label for="inputCity">Address</label>
        <input type="text" class="form-control" id="inputCity" placeholder="Your city">
    </div>
    <div class="form-group">
        <label for="inputDelivery">Delivery method</label>
        <ul class="nav nav-tabs" role="tablist" id = "inputDelivery">
            <li class="nav-item">
                <a class="nav-link active" href="#PickUp" role="tab" data-toggle="tab">Pick Up</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#DeliveryTo" role="tab" data-toggle="tab">Delivery to</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#FedEx" role="tab" data-toggle="tab">FedEx</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="PickUp">
                <div class="form-group">
                    <label for="inputPhone">Phone number</label>
                    <input name="getPhone" type="text" class="form-control" id="inputPhone" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputName">Your name</label>
                    <input type="text" class="form-control" id="inputName" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputSName">Your second name</label>
                    <input type="text" class="form-control" id="inputSName" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputEmail">Your email</label>
                    <input type="text" class="form-control" id="inputEmail" placeholder="">
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="DeliveryTo">
                <div class="form-group">
                    <label for="inputPhone2">Phone number</label>
                    <input name="getPhone" type="text" class="form-control" id="inputPhone2" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputName2">Your name</label>
                    <input type="text" class="form-control" id="inputName2" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputSName2">Your second name</label>
                    <input type="text" class="form-control" id="inputSName2" placeholder="">
                </div>
                <label for="adress">Your address</label>
                <div class="form-row" id = "adress">
                    <div class="col-md-6">

                    <input type="text" class="form-control" id="inputStreet" placeholder="Street">
                    </div>
                    <div class="col-md-3">

                        <input type="text" class="form-control" id="inputHouse" placeholder="House">
                    </div>
                    <div class="col-md-3">

                        <input type="text" class="form-control" id="inputFlat" placeholder="Flat">
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="FedEx">
                <div class="form-group">
                    <label for="inputPhone3">Phone number</label>
                    <input name="getPhone" type="text" class="form-control" id="inputPhone3" name="inputPhone" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputName3">Your name</label>
                    <input type="text" class="form-control" id="inputName3" name="inputName" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputSName3">Your second name</label>
                    <input type="text" class="form-control" id="inputSName3" name="inputSName" placeholder="">
                </div>
                <div class="form-group">
                    <label for="inputBranch">Branch number</label>
                    <input type="text" class="form-control" id="inputBranch" placeholder="">
                </div>

                </div>
        </div>
    </div>

        <div class="form-group">
            <label for="inputPayment">Payment method</label>
            <ul class="nav nav-tabs" role="tablist" id = "inputPayment">
                <li class="nav-item">
                    <a class="nav-link active" href="#Cash" role="tab" data-toggle="tab"><i data-toggle="tooltip" data-placement="top" title="In Cash"  class="far fa-money-bill-alt fa-3x"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Visa" role="tab" data-toggle="tab"><i class="fab fa-cc-visa fa-3x"></i></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#MasterCard" role="tab" data-toggle="tab"><i class="fab fa-cc-mastercard fa-3x"></i></a>
                </li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Cash">
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Visa">

                    <div class="container py-6">
                        <div class="row">
                            <div class="col-6 col-sm-8 col-md-6 mx-auto">
                                <div id="pay-invoice" class="card">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h2 class="text-center">Visa</h2>
                                        </div>
                                        <hr>
                                        <form action="" method="post" novalidate="novalidate">
                                            <input type="hidden" id="x_first_name" name="x_first_name" value="">
                                            <input type="hidden" id="x_last_name" name="x_last_name" value="">
                                            <input type="hidden" id="x_card_num" name="x_card_num" value="">
                                            <input type="hidden" id="x_exp_date" name="x_exp_date" value="">


                                            <div class="form-group">
                                                <label>Payment amount</label>
                                                <h2 id="cc-price"><fmt:formatNumber type="number" maxFractionDigits="2" value="${price}" />$</h2>
                                            </div>
                                            <div class="form-group has-success">
                                                <label for="cc-name" class="control-label">Name on card</label>
                                                <input id="cc-name" name="cc-name" type="text" class="form-control cc-name valid" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name-error">
                                                <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-number" class="control-label">Card number</label>
                                                <input id="cc-number" name="cc-number" type="tel" class="form-control cc-number identified " value="" data-val="true" data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number" autocomplete="cc-number">
                                                <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label for="cc-exp" class="control-label">Expiration</label>
                                                        <input id="cc-exp" name="cc-exp"  class="form-control cc-exp" value="" data-val="true" data-val-required="Please enter the card expiration" data-val-cc-exp="Please enter a valid month and year" placeholder="MM / YY" autocomplete="cc-exp">
                                                        <span class="help-block" data-valmsg-for="cc-exp" data-valmsg-replace="true"></span>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <label for="x_card_code" class="control-label">Security code</label>
                                                    <div class="input-group">
                                                        <input id="x_card_code" name="x_card_code" type="tel" class="form-control cc-cvc" value="" data-val="true" data-val-required="Please enter the security code" data-val-cc-cvc="Please enter a valid security code" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="MasterCard">


                    <div class="container py-6">
                        <div class="row">
                            <div class="col-6 col-sm-8 col-md-6 mx-auto">
                                <div id="pay-invoice2" class="card">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <h2 class="text-center">MasterCard</h2>
                                        </div>
                                        <hr>
                                        <form action="" method="post" novalidate="novalidate">
                                            <input type="hidden" id="x_first_name2" name="x_first_name" value="">
                                            <input type="hidden" id="x_last_name2" name="x_last_name" value="">
                                            <input type="hidden" id="x_card_num2" name="x_card_num" value="">
                                            <input type="hidden" id="x_exp_date2" name="x_exp_date" value="">
                                            <div class="form-group">
                                                <label>Payment amount</label>
                                                <h2 id="cc-price2"><fmt:formatNumber type="number" maxFractionDigits="2" value="${price}" />$</h2>
                                            </div>
                                            <div class="form-group has-success">
                                                <label for="cc-name2" class="control-label">Name on card</label>
                                                <input id="cc-name2" name="cc-name" type="text" class="form-control cc-name valid" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name-error">
                                                <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-number2" class="control-label">Card number</label>
                                                <input id="cc-number2" name="cc-number" type="tel" class="form-control cc-number identified " value="" data-val="true" data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number" autocomplete="cc-number">
                                                <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label for="cc-exp2" class="control-label">Expiration</label>
                                                        <input id="cc-exp2" name="cc-exp"  class="form-control cc-exp" value="" data-val="true" data-val-required="Please enter the card expiration" data-val-cc-exp="Please enter a valid month and year" placeholder="MM / YY" autocomplete="cc-exp">
                                                        <span class="help-block" data-valmsg-for="cc-exp" data-valmsg-replace="true"></span>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <label for="x_card_code2" class="control-label">Security code</label>
                                                    <div class="input-group">
                                                        <input id="x_card_code2" name="x_card_code" type="tel" class="form-control cc-cvc" value="" data-val="true" data-val-required="Please enter the security code" data-val-cc-cvc="Please enter a valid security code" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <div>
        <input type="button"  id="payment-button" class="btn btn-lg btn-success btn-block" value="Submit <fmt:formatNumber type="number" maxFractionDigits="2" value="${price}" />$"/>


    </div>
</form>
</div>








<script src="${contextPath}/resources/js/shoppingCart.js"></script>
<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>
