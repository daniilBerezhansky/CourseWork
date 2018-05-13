$(document).ready(function () {
    var sel = 0;
    var sys = 0;

    //*** Get Json ***//
    function Cash() {
        return JSON.stringify({
            "amount": parseFloat($('#amount').val())

        });
    }

    function Visa() {
        return JSON.stringify({
            "name": $('#cc-name').val(),
            "cardNumber": $('#cc-number').val(),
            "expires": $('#cc-exp').val(),
            "amount": parseFloat($('#amount').val())

        });
    }

    function MasterCard() {
        return JSON.stringify({
            "name": $('#cc-name2').val(),
            "cardNumber": $('#cc-number2').val(),
            "expires": $('#cc-exp2').val(),
            "amount": parseFloat($('#amount2').val())
        });
    }

    function pickUp() {
        return JSON.stringify({
            "phone": $('#inputPhone').val(),
            "name": $('#inputName').val(),
            "secondName": $('#inputSName').val(),
            "email": $('#inputEmail').val()
        });
    }

    function fedex() {
        return JSON.stringify({
            "phone": $('#inputPhone3').val(),
            "name": $('#inputName3').val(),
            "secondName": $('#inputSName3').val(),
            "branchNumber": $('#inputBranch').val()

        });
    }

    function deliveryTo() {
        return JSON.stringify({
            "phone": $('#inputPhone2').val(),
            "name": $('#inputName2').val(),
            "secondName": $('#inputSName2').val(),
            "street": $('#inputStreet').val(),
            "house": $('#inputHouse').val(),
            "flat": $('#inputFlat').val()
        });
    }

    $('#payment-button').click(function () {
            var sysurl;
            var sysdata;
            switch (sys) {
                case 0: {
                    sysurl = 'cash';
                    sysdata = Cash();
                    break;
                }
                case 1: {
                    sysurl = 'visa';
                    sysdata = Visa();
                    break;
                }

                case 2: {
                    sysurl = 'mastercart';
                    sysdata = MasterCard();
                    break;
                }
            }
            $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/' + sysurl,
                    dataType: "text",
                    data: sysdata,
                    success: function (data, textStatus, jqXHR) {
                        console.log('Product added successfully');
                        location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('addProduct error: ' + textStatus);
                        console.log(textStatus);
                        console.log(jqXHR);
                    }
                }
            )
            var delurl;
            var deldata;
            switch (sel) {
                case 0: {
                    delurl = 'pickup';
                    deldata = pickUp();
                    break;
                }
                case 1: {
                    delurl = 'deliveryTo';
                    deldata = deliveryTo();
                    break;
                }

                case 2: {
                    delurl = 'fedex';
                    deldata = fedex();
                    break;
                }
            }

            $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/' + delurl,
                    dataType: "text",
                    data: deldata,
                    success: function (data, textStatus, jqXHR) {
                        console.log('Product added successfully');
                        location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('addProduct error: ' + textStatus);
                        console.log(textStatus);
                        console.log(jqXHR);
                    }
                }
            )


        }
    );

    $('#inputDelivery a[href="#PickUp"]').on('click', function () {
        sel = 0;
        console.log(sel);
    });
    $('#inputDelivery a[href="#DeliveryTo"]').on('click', function () {
        sel = 1;
        console.log(sel);
    });
    $('#inputDelivery a[href="#FedEx"]').on('click', function () {
        sel = 2;
        console.log(sel);
    })
    $('#inputPayment a[href="#Cash"]').on('click', function () {
        sys = 0;
        console.log(sys);
    });
    $('#inputPayment a[href="#Visa"]').on('click', function () {
        sys = 1;
        console.log(sys);
    });
    $('#inputPayment a[href="#MasterCard"]').on('click', function () {
        sys = 2;
        console.log(sys);
    })


    $('body').on("click","#delBtn",function () {
        let $id = $(this).prev('input').val();
        console.log($id);
        $.ajax({
            type: 'DELETE',
            url: "http://localhost:8080/shoppingCart/removeProduct/"+$id,
            success: function(data, textStatus, jqXHR){
                location.reload();

            },
            error: function(jqXHR, textStatus, errorThrown){
                console.log('del cart error: ' + textStatus);
                location.reload();
            }
        });

    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
});
