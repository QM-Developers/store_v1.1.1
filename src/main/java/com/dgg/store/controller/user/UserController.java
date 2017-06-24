package com.dgg.store.controller.user;

import com.dgg.store.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController
{
    @Autowired
    private UserService service;

//    @RequestMapping(value = "user_findUserByPhone")
//    @ResponseBody
//    public Object findUserByPhone(String userPhone)
//    {
//        return service.findUserByPhone(userPhone);
//    }
}
