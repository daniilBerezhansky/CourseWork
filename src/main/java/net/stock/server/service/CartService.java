package net.stock.server.service;

import net.stock.server.model.Cart;

import java.util.List;

public interface CartService  {

    List<Cart> getAll();
    void  save (Cart product);

    void removeById(Long id);

    List<Cart> getById(Long id);
    void removeAllById(Long id);

    void  removeByProductId(Long id);
}
