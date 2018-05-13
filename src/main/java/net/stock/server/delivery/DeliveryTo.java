package net.stock.server.delivery;

public class DeliveryTo implements  DeliveryMethod {
    private String phone;
    private String name;
    private String secondName;
    private String street;
    private String house;
    private String flat;

    public DeliveryTo(String phone, String name, String secondName, String street, String house, String flat) {
        this.phone = phone;
        this.name = name;
        this.secondName = secondName;
        this.street = street;
        this.house = house;
        this.flat = flat;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getFlat() {
        return flat;
    }

    public void setFlat(String flat) {
        this.flat = flat;
    }

    public DeliveryTo() {
    }

    @Override
    public boolean orderDelivery() {
        System.out.println("Delivery to");
        return true;
    }
}
