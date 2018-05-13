package net.stock.server.service;

import net.stock.server.model.Cart;
import net.stock.server.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;
    @Override
    public void save(Cart product) {
        cartRepository.saveAndFlush(product);
    }

    @Override
    public void removeById(Long id) {
        cartRepository.delete(id);
    }

    @Override
    public List<Cart> getAll() {
        return cartRepository.findAll();
    }



    @Override
    public List<Cart> getById(Long id) {
        return cartRepository.findAllByUser(id);
    }

    @Transactional
    @Override
    public void removeAllById(Long id) {
        cartRepository.removeAllByUser(id);
    }
    @Transactional
    @Override
    public void removeByProductId(Long id) {
        cartRepository.removeByProduct(id);
    }

}
