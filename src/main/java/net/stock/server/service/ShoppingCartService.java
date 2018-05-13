package net.stock.server.service;

import net.stock.server.exception.NotEnoughProductsInStockException;
import net.stock.server.model.Product;

import java.math.BigDecimal;
import java.util.Map;

public interface ShoppingCartService {
    void addProduct(Product product);

    void removeProduct(Product product);

    Map<Product, Integer> getProductsInCart();

    void checkout() throws NotEnoughProductsInStockException;

    BigDecimal getTotal();
}
