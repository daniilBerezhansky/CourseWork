$(document).ready(function () {
    loadtbl('all')
    const url = 'http://localhost:8080/products';
    function loadtbl(category) {

        var tableClient = $('#tableClient').DataTable({
            "autoWidth": false,
            "ajax": {
                "url": "http://localhost:8080/products/"+category,
                "type": "GET",
                "success": function (data) {
                    $.each(data, function (ind, obj) {
                        var sr = obj.image;
                        var des = obj.description;
                        var name =  obj.name;
                        var id =  obj.id;
                        tableClient.row.add([
                            "<div class=\"row\">\n" +
                            "<div class=\"col-3 hidden-xs\"><img src="+sr + " alt=\"...\" class=\"img-responsive\"/></div>\n" +
                            "<div class=\"col-9\">" +
                            "<h4 class=\"nomargin\">"+ name +"</h4>" +
                            "<p>" + des +"</p>\n" +
                            "</div>" +
                            "</div>",
                            obj.price,
                            "<input type=\"number\" class=\"form-control text-center\" value=\"1\" id='q'>" +
                            "</br>" +
                            "available: "+obj.quantity,
                            "<div>" + "<input type='image' src='../../resources/images/add_to_cart.svg' id='buyBtn'/>"
                            +"<input id='pr_id' type='hidden' value='"+id+"'/>"+"</div>"


                        ]).draw();
                    });
                }
            },
        });
    }

    $('#all').click(function () {
        $("#tableClient").dataTable().fnDestroy();
        loadtbl('all')
    })
    $('#transistor').click(function () {
        $("#tableClient").dataTable().fnDestroy();
        loadtbl('transistor')
    })
    $('#capacitor').click(function () {
        $("#tableClient").dataTable().fnDestroy();
        loadtbl('capacitor')
    })
    $('#resistor').click(function () {
        $("#tableClient").dataTable().fnDestroy();
        loadtbl('resistor')
    })
    $('#diode').click(function () {
        $("#tableClient").dataTable().fnDestroy();
        loadtbl('diode')
    })
    $('#led').click(function () {
        $("#tableClient").dataTable().fnDestroy();
        loadtbl('led')
    })
});
$('body').on("click","#buyBtn",function () {
    var $id = $(this).siblings().val();

    var $amount = $(this).closest("tr")
        .find("#q").val();
    $.ajax({
        type: 'POST',
        url: "http://localhost:8080/shoppingCart/addProduct/"+$id+"?amount="+$amount,
        success: function(data, textStatus, jqXHR){
            console.log('Product added successfully');

        },
        error: function(jqXHR, textStatus, errorThrown){
            console.log('Add product error: ' + textStatus);
        }
    });

});