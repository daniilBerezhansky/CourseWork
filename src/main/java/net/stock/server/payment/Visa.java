package net.stock.server.payment;

import java.util.Date;

public class Visa implements PaymentMethod {


    private  String name;
    private  String cardNumber;
    private  String expires;
    private  double amount;

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getExpires() {
        return expires;
    }

    public Visa(String name, String cardNumber, String expires, double amount) {
        super();
        this.name = name;
        this.cardNumber = cardNumber;
        this.expires = expires;
        this.amount = amount;
    }


    @Override
    public boolean pay() {
        // Open Comms to Visa
        // Verify connection
        // Paybill using these details
        System.out.print("Connect to Visa to pay "+amount);
        return true;
    }

    @Override
    public String toString() {
        return "Visa{" +
                "name='" + name + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                ", expires='" + expires + '\'' +
                '}';
    }

    public Visa() {
    }
}
