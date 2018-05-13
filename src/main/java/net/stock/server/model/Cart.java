package net.stock.server.model;


import javax.persistence.*;

@Entity
@Table(name = "cart")
public class Cart {
    @Id


    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cart_seq_gen")
    @SequenceGenerator(name = "cart_seq_gen", sequenceName = "cart_id_seq")
    private Long id;

    @Column(name="product_id")
    private Long product;

    @Column(name = "user_id")
    private Long user;

    @Column(name = "amount")

    private int amount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProduct() {
        return product;
    }

    public void setProduct(Long product) {
        this.product = product;
    }

    public Long getUser() {
        return user;
    }

    public void setUser(Long user) {
        this.user = user;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Cart(Long product, Long user, int amount) {
        this.product = product;
        this.user = user;
        this.amount = amount;
    }
    public Cart(){

    }
}
