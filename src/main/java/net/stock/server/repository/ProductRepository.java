package net.stock.server.repository;

import net.stock.server.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Optional<Product> findById(Long id);

    List<Product> findAllByCategory(String category);
}
