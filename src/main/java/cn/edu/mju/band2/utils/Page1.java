package cn.edu.mju.band2.utils;

import java.util.List;
/**
 * @author zrb
 * */
public class Page1{
    // 当前页
    private Integer page=1;
    // 总页数
    private Integer totalPages;
    // 页大小（默认10）
    private Integer pageSize = 10;
    // 总行数
    private Integer totalRows;
    // 开始行（默认0）
    private Integer startRow=0;
    // 结果集
    private List<Object> data;

    public Integer getStartRow() {
        startRow = (getPage()-1)*getPageSize();
        if (startRow>getTotalRows()){
            startRow = getTotalRows();
        }
        return startRow;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        if (page<1){
            page = 1;
        }
        if (page>getTotalPages()){
            page = getTotalPages();
        }
        this.page = page;
    }

    public Integer getTotalPages() {
        if (getTotalRows()%getPageSize()==0){
            totalPages = getTotalRows()/getPageSize();
        }
        else {
            totalPages =  (getTotalRows()/getPageSize())+1;
        }
        return totalPages;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        if (pageSize<1){
            pageSize = 10;
        }
        this.pageSize = pageSize;
    }

    public Integer getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(Integer totalRows) {
        if (totalRows<0){
            totalRows = 0;
        }
        this.totalRows = totalRows;
    }

    public List<Object> getData() {
        return data;
    }

    public void setData(List<Object> data) {
        this.data = data;
    }

    public Page1() {
    }

    public Page1(Integer page, Integer pageSize) {
        this.page = page;
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "Page{" +
                "page=" + page +
                ", totalPages=" + totalPages +
                ", pageSize=" + pageSize +
                ", totalRows=" + totalRows +
                ", data=" + data +
                '}';
    }
}
