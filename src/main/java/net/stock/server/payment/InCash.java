package net.stock.server.payment;

public class InCash implements PaymentMethod {
    private  double amount;

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public InCash(double amount) {
        this.amount = amount;
    }

    public InCash() {
    }

    @Override
    public boolean pay() {
        System.out.println("In cash amount "+amount);
        return true;
    }
}
