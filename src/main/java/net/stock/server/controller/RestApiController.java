package net.stock.server.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.xpath.internal.operations.Mod;
import net.stock.server.delivery.DeliveryTo;
import net.stock.server.delivery.FedEx;
import net.stock.server.delivery.PickUp;
import net.stock.server.model.Cart;
import net.stock.server.model.Product;
import net.stock.server.payment.InCash;
import net.stock.server.payment.MasterCard;
import net.stock.server.payment.PaymentMethod;
import net.stock.server.payment.Visa;
import net.stock.server.service.CartService;
import net.stock.server.service.ProductService;
import net.stock.server.service.ShoppingCartService;
import net.stock.server.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.http.HTTPException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.List;

@RestController
public class RestApiController {

    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserService userService;

   @RequestMapping(value ="/viewcarts", method = RequestMethod.GET)
    public List<Cart> shoppingCart(Model model, Principal principal) {
        Long id = 0L;
        if(principal != null){
            id = userService.findByUsername(principal.getName()).getId();
        }
       return cartService.getById(id);

    }


    @RequestMapping(value = "/cash", method = RequestMethod.POST,consumes = MediaType.ALL_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void cash(HttpEntity<String> httpEntity, Model  model, Principal principal){
        String json = httpEntity.getBody().trim().replaceAll("\uFFFD", "");
        String res ="";
        try {
            res = URLDecoder.decode(json, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        String res2 = res.replaceAll("\\=","");

        InCash pay;
        try {
            pay = mapper.readValue(res,InCash.class);
            pay.pay();
        } catch (IOException e) {
            e.printStackTrace();
        }
        clear(model,principal);
    }


    @RequestMapping(value = "/visa", method = RequestMethod.POST,consumes = MediaType.ALL_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void savePerson(HttpEntity<String> httpEntity, Model  model, Principal principal){
        String json = httpEntity.getBody().trim().replaceAll("\uFFFD", "");
        String res ="";
        try {
            res = URLDecoder.decode(json, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        String res2 = res.replaceAll("\\=","");

        Visa pay;
        try {
            pay = mapper.readValue(res,Visa.class);
            pay.pay();
        } catch (IOException e) {
            e.printStackTrace();
        }
        clear(model,principal);
    }

    @RequestMapping(value = "/mastercart", method = RequestMethod.POST,consumes = MediaType.ALL_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void mastercard(HttpEntity<String> httpEntity, Model  model, Principal principal){
        String json = httpEntity.getBody().trim().replaceAll("\uFFFD", "");
        String res ="";
        try {
            res = URLDecoder.decode(json, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        String res2 = res.replaceAll("\\=","");

        MasterCard pay;
        try {
            pay = mapper.readValue(res,MasterCard.class);
            pay.pay();
        } catch (IOException e) {
            e.printStackTrace();
        }
        clear(model,principal);
    }

    @RequestMapping(value = "/deliveryTo", method = RequestMethod.POST,consumes = MediaType.ALL_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void deliveryTo(HttpEntity<String> httpEntity){
        String json = httpEntity.getBody().trim().replaceAll("\uFFFD", "");
        String res ="";
        try {
            res = URLDecoder.decode(json, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        String res2 = res.replaceAll("\\=","");
        System.out.println("res2 " + res2);
        DeliveryTo delivery;
        try {
            delivery = mapper.readValue(res,DeliveryTo.class);
            delivery.orderDelivery();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/fedex", method = RequestMethod.POST,consumes = MediaType.ALL_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void fedex(HttpEntity<String> httpEntity){
        String json = httpEntity.getBody().trim().replaceAll("\uFFFD", "");
        String res ="";
        try {
            res = URLDecoder.decode(json, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        String res2 = res.replaceAll("\\=","");
        FedEx delivery;
        try {
            delivery = mapper.readValue(res,FedEx.class);
            delivery.orderDelivery();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/pickup", method = RequestMethod.POST,consumes = MediaType.ALL_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void pickUp(HttpEntity<String> httpEntity){
        String json = httpEntity.getBody().trim().replaceAll("\uFFFD", "");
        String res ="";
        try {
            res = URLDecoder.decode(json, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        String res2 = res.replaceAll("\\=","");
        PickUp delivery;
        try {
            delivery = mapper.readValue(res,PickUp.class);
            delivery.orderDelivery();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private  void  clear(Model model, Principal principal){
        Long id = 0L;
        if(principal != null){
            id = userService.findByUsername(principal.getName()).getId();
        }
        cartService.removeAllById(id);
    }
    @RequestMapping(value = "/products/add", method = RequestMethod.POST,consumes = MediaType.ALL_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void redactTable(HttpEntity<String> httpEntity){
        String json = httpEntity.getBody().trim().replaceAll("\uFFFD", "");
        String res ="";
        try {
            res = URLDecoder.decode(json, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        String res2 = res.replaceAll("\\=","");

        Product product;
        try {
            product = mapper.readValue(res,Product.class);
            productService.save(product);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
