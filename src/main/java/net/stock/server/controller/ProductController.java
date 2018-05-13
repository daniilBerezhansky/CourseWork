package net.stock.server.controller;

import net.stock.server.model.Product;
import net.stock.server.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/products/all", method = RequestMethod.GET)
    public List<Product> getAllPersons() {
        List<Product> all = productService.getAll();
        return all;

    }
    @RequestMapping(value = "/products/{category}", method = RequestMethod.GET)
    public List<Product> getCategory(@PathVariable("category") String string) {
        List<Product> all = productService.byCategory(string);
        return all;

    }



    @RequestMapping(value = "/products/del/{id}", method = RequestMethod.DELETE)
    public void delProduct(@PathVariable("id") Long id) {
        productService.remove(id);
    }





}
