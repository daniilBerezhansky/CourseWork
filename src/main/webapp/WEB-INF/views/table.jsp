<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 01.05.2018
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Table</title>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>

<table id="tableClient" class="table table-bordered table-striped">
    <thead>
    <tr>
        <th data-field="id">Id</th>
        <th class="" data-field="name">Name</th>
        <th class="" data-field="description">Description</th>
        <th class="" data-field="quantity">Quantity</th>
        <th class="" data-field="price">Price</th>
        <th class="" data-field="image">Image</th>
        <th class="" data-field="category">Category</th>
        <th class="" >Delete</th>

    </tr>
    </thead>
</table>

<div class="container">
    <form>

            <div class="form-group">
                <label for="name">Name</label>
                <input  type="text" id="name" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="desc">Description</label>
                <textarea class="form-control"  id="desc" rows="3"></textarea>
            </div>
            <div class="form-group">
                <label for="quant">Quantity</label>
                <input  type="number" id="quant" class="form-control" />
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input  type="number" id="price" class="form-control" />
            </div>
            <div class="form-group">
                <label for="img">Image src</label>
                <input  type="text" id="img" class="form-control" />
            </div>
            <div class="form-group">
                <label for="categories">Category</label>
                <select class="custom-select form-control" id="categories">

                    <option value="transistor">Transistor</option>
                    <option value="capacitor">Capacitor</option>
                    <option value="resistor">Resistor</option>
                    <option value="diode">Diode</option>
                    <option value="led">LED</option>
                </select>
            </div>

            <input type="button" id="addBtn" value="Add" class="btn btn-primary" />
    </form>

</div>


<script src="${contextPath}/resources/js/table.js"></script>
</body>
</html>
