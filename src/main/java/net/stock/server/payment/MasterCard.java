package net.stock.server.payment;

import java.util.Date;

public class MasterCard implements PaymentMethod {

    private  String name;
    private  String cardNumber;
    private  String expires;
    private  double amount;


    public MasterCard(String name, String cardNumber, String expires, double amount) {
        super();
        this.name = name;
        this.cardNumber = cardNumber;
        this.expires = expires;
        this.amount = amount;
    }

    public MasterCard() {
    }

    @Override
    public boolean pay() {
        // Open Comms to Mastercard
        // Verify connection
        // Paybill using these details
        System.out.print("Connect to MasterCard to pay "+amount);
        return true;
    }

    @Override
    public String toString() {
        return "MasterCard{" +
                "name='" + name + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                ", expires='" + expires + '\'' +
                '}';
    }
}
