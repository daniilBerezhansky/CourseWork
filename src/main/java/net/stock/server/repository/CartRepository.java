package net.stock.server.repository;

import net.stock.server.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Long> {
    List<Cart> findAllByUser(Long id);

    void removeAllByUser(Long id);
    void removeByProduct(Long id);
}
