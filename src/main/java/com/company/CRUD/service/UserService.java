package com.company.CRUD.service;

import com.company.CRUD.model.User;

import java.util.List;

/**
 * Created by s.derenko on 22.02.2017.
 */
public interface UserService {
    public void addUser (User user);
    public void updateUser(User user);
    public void deleteUser(int id);
    public User getUserById(int id);
    public List<User> listUsers(int rowsPerPage, int page, String criterion);
    public long getUsersCount();
}
