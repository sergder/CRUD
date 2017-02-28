package com.company.CRUD.service;

import com.company.CRUD.dao.UserDAO;
import com.company.CRUD.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by s.derenko on 22.02.2017.
 */

@Service
public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Transactional
    public void addUser(User user) {
        this.userDAO.addUser(user);
    }

    @Transactional
    public void updateUser(User user) {
        this.userDAO.updateUser(user);
    }

    @Transactional
    public void deleteUser(int id) {
        this.userDAO.deleteUser(id);
    }

    @Transactional
    public User getUserById(int id) {
        return this.userDAO.getUserById(id);
    }

    @Transactional
    public List<User> listUsers(int rowsPerPage, int page, String criterion) {
        return this.userDAO.listUsers(rowsPerPage, page, criterion);
    }

    @Transactional
    public long getUsersCount() {
        return this.userDAO.getUsersCount();
    }
}
