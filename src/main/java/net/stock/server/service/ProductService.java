package net.stock.server.service;

import net.stock.server.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;


public interface ProductService {
    Optional<Product> findById(Long id);

    Page<Product> findAllProductsPageable(Pageable pageable);

    List<Product> getAll();

    Product getById(Long id);

    List<Product> byCategory(String category);

    void remove(Long id);

    void save(Product product);
}
