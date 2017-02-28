package com.company.CRUD.controller;

import com.company.CRUD.model.Search;
import com.company.CRUD.model.User;
import com.company.CRUD.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by s.derenko on 22.02.2017.
 */

@Controller
public class UserController {
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value="/")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "users/{page}")
    public String listUsers(@PathVariable("page") int page, Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers(10,page,""));
        model.addAttribute("usersCount", this.userService.getUsersCount());
        model.addAttribute("page", page);
        model.addAttribute("search", new Search());
        return "users";
    }

    @RequestMapping(value = "users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        if(user.getId() == 0) {
            this.userService.addUser(user);
            long usersCount = this.userService.getUsersCount();
            return "redirect:/users/" + (usersCount/10 + (usersCount%10==0?0:1));
        } else {
            this.userService.updateUser(user);
            return "redirect:/users/1";
        }
    }

    @RequestMapping("delete/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        this.userService.deleteUser(id);
        return "redirect:/users/1";
    }

    @RequestMapping("edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "users";
    }

    @RequestMapping(value = "users/search", method = RequestMethod.POST)
    public String search(@ModelAttribute(value = "search") Search search, Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers(0,1, search.getCriterion()));
        return "users";
    }

}
