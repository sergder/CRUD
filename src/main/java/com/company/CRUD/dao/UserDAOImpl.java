package com.company.CRUD.dao;

import com.company.CRUD.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by s.derenko on 21.02.2017.
 */
@Repository
public class UserDAOImpl implements UserDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    public void deleteUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        if (user != null) {
            session.delete(user);
        }
    }

    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, new Integer(id));
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> listUsers(int rowsPerPage, int page, String criterion) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where name like :criterion");
        query.setString("criterion", "%" + criterion + "%");
        if (rowsPerPage > 0) {
            query.setFirstResult((page - 1) * rowsPerPage);
            query.setMaxResults(rowsPerPage);
        }
        List<User> listUsers = (List<User>) query.list();
        return listUsers;
    }

    public long getUsersCount() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("select count(id) from User");
        return (Long) query.uniqueResult();
    }
}
