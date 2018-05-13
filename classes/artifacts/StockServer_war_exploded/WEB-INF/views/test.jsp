<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 21.04.2018
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        <th class="" data-field="productName">Name</th>
        <th class="" data-field="amount">Amount</th>
        <th class="" data-field="dateArrival">Date</th>
        <th class="" data-field="category">Category</th>
        <th class="" >Delete</th>

    </tr>
    </thead>
</table>

<script>
    $(document).ready(function () {
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
            $(window).load(function() {

            });

            $("#buttonSearch").click(function(){
                tableClient.clear().draw();
                tableClient.ajax.reload();

            });

            $("#buttonInsert").click(function(){


            });

            $("#buttonDelete").click(function(){

            });
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
    }

    );


</script>
</body>
</html>
