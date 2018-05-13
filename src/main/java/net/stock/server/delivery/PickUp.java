package net.stock.server.delivery;

public class PickUp implements DeliveryMethod {
    private String phone;
    private String name;
    private String secondName;
    private String email;

    public PickUp(String phone, String name, String secondName, String email) {
        this.phone = phone;
        this.name = name;
        this.secondName = secondName;
        this.email = email;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean orderDelivery() {
        System.out.println("Pick up");
        return true;
    }

    public PickUp() {
    }
}
