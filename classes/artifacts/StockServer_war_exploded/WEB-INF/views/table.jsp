<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 31.03.2018
  Time: 0:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Table</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/table.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <meta name="_csrf" th:content="${_csrf.token}"/>
</head>
<body>

<table id="tableClient" class="table table-bordered table-striped">
    <thead>
    <tr>
        <th data-field="id">Id</th>
        <th class="" data-field="productName">Name</th>
        <th class="" data-field="amount">Amount</th>
        <th class="" data-field="dateArrival">Date</th>
        <th class="" data-field="category">Category</th>
        <th class="" >Delete</th>

    </tr>
    </thead>
</table>
<div class="container">
    <nav aria-label="Page navigation">
    <ul class="pagination" id="pagination"></ul>
</nav>
</div>

<div>
    <form>
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="product">Product</label>
        <input  type="text" id="product" class="form-control"/>
            </div>
            <div class="form-group col-md-3">
                <label for="amount">Amount</label>
        <input  type="number" id="amount" class="form-control"/>
            </div>
            <div class="form-group col-md-3">
                <label for="amount">Date</label>
        <input  type="date" id="date" class="form-control" />
            </div>
            <div class="form-group col-md-3">
                <label for="categories">Category</label>
        <select class="custom-select form-control" id="categories">

            <option value="food">Food</option>
            <option value="house_hold">House hold</option>
            <option value="clothes">Clothes</option>
            <option value="appliances">Appliances</option>
        </select>
            </div>

        <input type="button" id="addBtn" value="Add" class="btn btn-primary" />
        </div>
    </form>

</div>



<script>
    $(document).ready(function () {
        const url = 'http://localhost:8080/products';
        var tableClient = $('#tableClient').DataTable({
            "autoWidth": false,

            "columnDefs": [
                {"targets": [ 0 ],
                    "className" : "id"

                }
            ],
            "ajax": {
                "url": "http://localhost:8080/products",
                "type": "GET",
                "success" :  function(data){
                    $.each(data, function(ind, obj){

                        tableClient.row.add([
                            obj.id,
                            obj.productName,
                            obj.amount,

                            new Date( obj.dateArrival).toDateString(),
                            obj.category,
                            "<input type='image' src='../../resources/images/clear.svg' id='delBtn1'/>"
                        ]).draw();
                    });
                }
            },
        });

        function formToJSON() {
            return JSON.stringify({
                "productName": $('#product').val(),
                "amount": parseInt($('#amount').val()),
                "dateArrival" : new Date($('#date').val()).getTime(),
                "category" : $('#categories').val()
            });
        }




        $('#addBtn').click(function () {
            console.log('addProduct');
            $.ajax({
                type: 'POST',
                url: url,
                dataType: "json",
                data: formToJSON(),
                success: function(data, textStatus, jqXHR){
                    alert('Product added successfully');
                    location.reload();
                },
                error: function(jqXHR, textStatus, errorThrown){
                    alert('addProduct error: ' + textStatus);
                }
            });
        });
        $('#delBtn').click(function () {
            let id = $('#id').val();
            $.ajax({
                type: 'DELETE',
                url: url+"/"+id,
                success: function(data, textStatus, jqXHR){
                    alert('Product deleted successfully');
                    location.reload();
                },
                error: function(jqXHR, textStatus, errorThrown){
                    alert('Delete product error: ' + textStatus);
                }
            });
        });
        var b = 1;

        $('body').on("click","#delBtn1",function () {
            let $item = $(this).closest("tr")
                .find(".id").text();
            $.ajax({
                type: 'DELETE',
                url: "http://localhost:8080/products/"+$item,
                success: function(data, textStatus, jqXHR){
                    alert('Product deleted successfully');
                    location.reload();
                },
                error: function(jqXHR, textStatus, errorThrown){
                    alert('Delete product error: ' + textStatus);
                }
            });
        });
    });


</script>
</body>
</html>
