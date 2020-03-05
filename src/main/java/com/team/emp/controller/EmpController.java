package com.team.emp.controller;

import com.github.pagehelper.PageInfo;
import com.team.emp.entity.Emp;
import com.team.emp.service.EmpService;
import com.team.emp.util.EmpCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmpController {

    @Autowired
    private EmpService empService;

    @RequestMapping("/showEmp")
    public String showEmp(EmpCondition condition, Model model){
        PageInfo<Emp> pageInfo = empService.selectEmp(condition);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("condition",condition);
        return "index";
    }

    @RequestMapping("/addEmp")
    public String addEmp(Emp emp){
        int temp = empService.insertEmp(emp);
        if(temp>0){
            return "redirect:showEmp";
        }else {
            return "error";
        }
    }

    @RequestMapping("/getSomeEmp")
    public String getSomeEmp(Integer eid, Model model){
        Emp emp = empService.getEmp(eid);
        model.addAttribute("emp",emp);
        return "upEmp";
    }

    @RequestMapping("/updateEmp")
    public String updateEmp(Emp emp){
        int temp = empService.upEmp(emp);
        if(temp>0){
            return "redirect:showEmp";
        }else {
            return "error";
        }
    }

    @RequestMapping("/deleteEmp")
    public String deleteEmp(Integer eid){
        int temp = empService.delEmp(eid);
        if(temp>0){
            return "redirect:showEmp";
        }else {
            return "error";
        }
    }

}
