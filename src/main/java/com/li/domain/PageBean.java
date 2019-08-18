package com.li.domain;

import java.util.List;

/**
 * @Program: myssm
 * @ClassName: PageBean
 * @Description:
 * @Author: li
 * @Create: 2019-08-09 20:43
 */
public class PageBean<T> {
    private int currentPage;
    private int totalData;
    private int totalPage;
    private int pageSize;
    private List<T> list;

    public PageBean(int currentPage, int totalData, int pageSize, List<T> list) {
        this.currentPage = currentPage;
        this.totalData = totalData;
        this.totalPage = totalData % pageSize == 0 ? totalData / pageSize : totalData / pageSize + 1;
        this.pageSize = pageSize;
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", totalData=" + totalData +
                ", totalPage=" + totalPage +
                ", pageSize=" + pageSize +
                ", list=" + list +
                '}';
    }

    public PageBean() {
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalData() {
        return totalData;
    }

    public void setTotalData(int totalData) {
        this.totalData = totalData;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
