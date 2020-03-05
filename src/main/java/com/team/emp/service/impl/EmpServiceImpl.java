package com.team.emp.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.emp.entity.Emp;
import com.team.emp.mapper.EmpMapper;
import com.team.emp.service.EmpService;
import com.team.emp.util.EmpCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;

    @Override
    public PageInfo<Emp> selectEmp(EmpCondition condition) {
        PageHelper.startPage(condition.getPage(),condition.getPageSize());
        List<Emp> list = empMapper.selectAllEmp(condition);
        return new PageInfo<Emp>(list);
    }

    @Override
    public int insertEmp(Emp emp) {
        return empMapper.insertSelective(emp);
    }

    @Override
    public Emp getEmp(Integer eid) {
        return empMapper.selectByPrimaryKey(eid);
    }

    @Override
    public int upEmp(Emp emp) {
        return empMapper.updateByPrimaryKeySelective(emp);
    }

    @Override
    public int delEmp(Integer eid) {
        return empMapper.deleteByPrimaryKey(eid);
    }
}
