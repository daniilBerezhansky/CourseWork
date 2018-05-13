package net.stock.server.service;

import net.stock.server.model.User;



public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
