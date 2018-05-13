package net.stock.server.service;

import net.stock.server.model.Product;
import net.stock.server.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;


    @Override
    public Optional<Product> findById(Long id) {
        return productRepository.findById(id);
    }

    @Override
    public Page<Product> findAllProductsPageable(Pageable pageable) {
        return productRepository.findAll(pageable);
    }
    @Override
    public List<Product> getAll() {

        return productRepository.findAll();
    }

    @Override
    public Product getById(Long id) {
        return productRepository.findOne(id);
    }

    @Override
    public List<Product> byCategory(String category) {
        return  productRepository.findAllByCategory(category);
    }

    @Override
    public void remove(Long id) {
        productRepository.delete(id);
    }

    @Override
    public void save(Product product) {
        productRepository.saveAndFlush(product);
    }
}
