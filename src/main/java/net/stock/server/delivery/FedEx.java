package net.stock.server.delivery;

public class FedEx implements DeliveryMethod {
    private String phone;
    private String name;
    private String secondName;
    private int branchNumber;

    public FedEx(String phone, String name, String secondName, int branchNumber) {
        this.phone = phone;
        this.name = name;
        this.secondName = secondName;
        this.branchNumber = branchNumber;
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

    public int getBranchNumber() {
        return branchNumber;
    }

    public void setBranchNumber(int branchNumber) {
        this.branchNumber = branchNumber;
    }

    public FedEx() {
    }

    @Override
    public boolean orderDelivery() {
        System.out.println("FedEx");
        return false;
    }
}
