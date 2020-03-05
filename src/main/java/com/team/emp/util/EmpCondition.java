package com.team.emp.util;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class EmpCondition {

    private String ename;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtime;

    private Integer did;

    //分页信息
    private Integer page=1;
    private Integer pageSize=5;

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Date getStartime() {
        return startime;
    }

    public void setStartime(Date startime) {
        this.startime = startime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer dname) {
        this.did = dname;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
