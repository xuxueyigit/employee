package com.team.emp.service;

import com.team.emp.entity.Dept;

import java.util.List;

public interface DeptService {

    //查询部门名称
    public List<Dept> selectDept();
}
