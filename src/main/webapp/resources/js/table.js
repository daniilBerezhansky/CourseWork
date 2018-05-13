
$(document).ready(function () {
    const url = 'http://localhost:8080/products';
    var tableClient = $('#tableClient').DataTable({
        "autoWidth": false,
        "columnDefs": [
            {
                "targets": [0],
                "className": "id"
            }
        ],
        "ajax": {
            "url": url+"/all",
            "type": "GET",
            "success": function (data) {
                $.each(data, function (ind, obj) {
                    tableClient.row.add([
                        obj.id,
                        obj.name,
                        obj.description,
                        obj.quantity,
                        obj.price,
                        obj.image,
                        obj.category,
                        "<input type='image' src='../../resources/images/clear.svg' id='delBtn1'/>"
                    ]).draw();
                });
            }
        },
    });

    function formToJSON() {
        return JSON.stringify({
            "name": $('#name').val(),
            "description": $('#desc').val(),
            "quantity": parseInt($('#quant').val()),
            "price": parseFloat($('#price').val()),
            "image": $('#img').val(),
            "category": $('#categories').val()

        });
    }


    $('#addBtn').click(function () {
        console.log('addProduct');
        $.ajax({
            type: 'POST',
            url: url+'/add',
            dataType: "text",
            data: formToJSON(),
            success: function(data, textStatus, jqXHR){
                alert('Product added successfully');
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.log('addProduct error: ' + textStatus);
            }
        });
    });
    $('body').on("click","#delBtn1",function () {
        let $item = $(this).closest("tr")
            .find(".id").text();
        $.ajax({
            type: 'DELETE',
            url: url+'/del/'+$item,
            success: function(data, textStatus, jqXHR){
                console.log('Product deleted successfully');
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.log('Delete product error: ' + textStatus);
            }
        });
    });

});