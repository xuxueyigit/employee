package com.team.emp.service;

import com.github.pagehelper.PageInfo;
import com.team.emp.entity.Emp;
import com.team.emp.util.EmpCondition;

public interface EmpService {

    //根据条件分页查询
    public PageInfo<Emp> selectEmp(EmpCondition condition);

    //添加员工信息
    public int insertEmp(Emp emp);

    //查询单挑员工信息
    public Emp getEmp(Integer eid);
    //修改员工信息
    public int upEmp(Emp emp);

    //删除员工信息
    public int delEmp(Integer eid);
}
