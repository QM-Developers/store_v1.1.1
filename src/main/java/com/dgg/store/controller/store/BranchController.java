package com.dgg.store.controller.store;

import com.dgg.store.service.store.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BranchController
{
    @Autowired
    private BranchService service;


}
