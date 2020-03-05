package com.team.emp.controller;

import com.team.emp.entity.Dept;
import com.team.emp.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/showDept")
    @ResponseBody
    public List<Dept> showDept(Model model){
        List<Dept> depts = deptService.selectDept();
        return depts;
    }
}
