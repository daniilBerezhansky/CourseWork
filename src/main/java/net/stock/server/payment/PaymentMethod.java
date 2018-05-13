package net.stock.server.payment;

public interface PaymentMethod {
    public boolean pay();
    public String toString();
}
