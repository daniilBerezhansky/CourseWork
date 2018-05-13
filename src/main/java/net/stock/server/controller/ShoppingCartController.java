package net.stock.server.controller;

import net.stock.server.exception.NotEnoughProductsInStockException;
import net.stock.server.model.Cart;
import net.stock.server.model.Product;
import net.stock.server.payment.MasterCard;
import net.stock.server.payment.PaymentMethod;
import net.stock.server.payment.Visa;
import net.stock.server.service.CartService;
import net.stock.server.service.ProductService;
import net.stock.server.service.ShoppingCartService;
import net.stock.server.service.UserService;
import net.stock.server.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ShoppingCartController {
    private static final int INITIAL_PAGE = 0;
    @Autowired
    private  ShoppingCartService shoppingCartService;
    @Autowired
    private  ProductService productService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserService userService;

  @RequestMapping(value ="/shoppingCart", method = RequestMethod.GET)
    public ModelAndView shoppingCart(Model model, Principal principal) {
      ModelAndView modelAndView = new ModelAndView("/shoppingCart");
      Long id = 0L;
      if(principal != null){
          id = userService.findByUsername(principal.getName()).getId();
      }

      List<Cart>  list = cartService.getById(id);
      List<Product> products = new ArrayList<>();

      for(Cart item: list){
          products.add(productService.findById(item.getProduct()).get());
      }
        modelAndView.addObject("products", products);
      modelAndView.addObject("cart", list);
        return modelAndView;

    }

    @RequestMapping(value ="/shoppingCart/addProduct/{productId}",
            params = "amount",
            method = RequestMethod.POST)
    public void addProductToCart(@PathVariable("productId") Long productId ,
                                 @RequestParam("amount") int amount, Model model, Principal principal) {
        Long id = 0L;
        if(principal != null){
            id = userService.findByUsername(principal.getName()).getId();
        }
        Cart cart = new Cart(productId,id,amount);
        cartService.save(cart);
        //productService.findById(productId).ifPresent(shoppingCartService::addProduct);

    }

    @RequestMapping(value ="/shoppingCart/removeProduct/{productId}", method = RequestMethod.DELETE)
    public void removeProductFromCart(@PathVariable("productId") Long productId) {
      cartService.removeByProductId(productId);

    }
    @RequestMapping(value ="/shoppingCart/removeProduct/", method = RequestMethod.DELETE)
    public void removeProductFromCart(Model model, Principal principal) {
        Long id = 0L;
        if(principal != null){
            id = userService.findByUsername(principal.getName()).getId();
        }

        cartService.removeAllById(id);

    }

    @RequestMapping(value ="/shoppingCart/checkout",
            params = { "name", "cardNumber","expires","amount","type" },
            method = RequestMethod.POST)
    public void checkout( @RequestParam("name") String name, @RequestParam("cardNumber") String cardNumber,
                                  @RequestParam("expires") String expires,@RequestParam("amount") double amount,
                                  @RequestParam("type") int type ) {


        PaymentMethod pay;
        switch (type){
            case 0:{

                 pay = new Visa(name,cardNumber,expires,amount);
                System.out.println( pay.toString());
                pay.pay();
                break;
            }
            case 1:{
                pay = new MasterCard(name,cardNumber,expires,amount);
                System.out.println( pay.toString());
                pay.pay();
                break;
            }

        }


    }


}
