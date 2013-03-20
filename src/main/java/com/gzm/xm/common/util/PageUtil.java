package com.gzm.xm.common.util;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PageUtil {
    private long currentPage = 1;// 当前页数,默认为第一页

    private long recordCount;// 总记录条数

    private long pageCount;// 总页数

    private long pageSize;// 每页记录条数

    private long currentFristPosition; // 当前的页面的记录在总的记录中的起始位置

    // 根据当前页码 返回在当前页面下显示的其他页码列表(默认为当前页面的前3后3)
    // 假设总共为100页
    // 如当前是第四页 那么 列表的值为 {1，2，3，4，5，6，7}
    // 如果当前页码为第9页 列表的值为{ 6, 7, 8, 9, 10, 11, 12 }
    // 如果当前页码为第98页 列表的值为{ 94, 95, 96, 97, 98, 99, 100 }
    private List<Long> pageList;

    /******************************* 构造函数 ****************************************/

    /**
     * 传入总记录数，传入每页显示条数，传入当前页码
     * @param recordCount 总记录条数
     * @param pageSize  每页记录条数
     * @param currentPage 当前的页面的记录在总的记录中的起始位置
     */
    public PageUtil(long recordCount, int pageSize, long currentPage) {
        this.recordCount = recordCount;
        this.pageSize = pageSize;
        this.pageCount = calculatePageCount();
        this.currentPage = calculateCurrentPage(currentPage);
        this.pageList = calculatePageList();
        this.currentFristPosition = calculateRecordPosition();
    }

    /******************************* 构造函数 ****************************************/

    /**
     * 计算总页数
     *
     * @return
     */
    public long calculatePageCount() {
        long pageCount = 1;
        if (recordCount % pageSize == 0) {
            pageCount = recordCount / pageSize;
        } else {
            pageCount = (long) (recordCount / pageSize) + 1;
        }
        pageCount = pageCount < 1 ? 1 : pageCount;
        return pageCount;
    }

    public long calculateRecordPosition() {
        return (currentPage - 1) * pageSize;
    }

    /**
     * 计算当前页码
     *
     * @param currentPage
     * @return
     */
    private long calculateCurrentPage(long currentPage) {
        if (currentPage < 1) currentPage = 1;
        else if (currentPage > pageCount) currentPage = pageCount;
        return currentPage;
    }

    /**
     * 根据当前页码 返回在当前页面下显示的其他页码列表(默认为当前页面的前3后3) 假设总共为100页 如当前是第四页 那么 列表的值为
     * {1，2，3，4，5，6，7} 如果当前页码为第9页 列表的值为{ 6, 7, 8, 9, 10, 11, 12 }
     * 如果当前页码为第98页 列表的值为{ 94, 95, 96, 97, 98, 99, 100 } pageList
     *
     * @return
     */
    private List<Long> calculatePageList() {
        List<Long> pageTmpList = new ArrayList<Long>();
        if (pageCount < 7) {
            for (long i = 0; i < pageCount; i++) {
                pageTmpList.add(i + 1);
            }
        } else {
            if (currentPage < 4) {
                pageTmpList = Arrays.asList(new Long[]{1L, 2L, 3L, 4L, 5L, 6L, 7L});
            } else if (currentPage > pageCount - 4) {
                for (long i = pageCount - 6; i < pageCount + 1; i++) {
                    pageTmpList.add(i);
                }
            } else {
                pageTmpList = Arrays.asList(new Long[] { currentPage - 3, currentPage - 2,
                        currentPage - 1, currentPage, currentPage + 1, currentPage + 2,
                        currentPage + 3 });
            }
        }
        return pageTmpList;
    }

    /********************** 首页，上一页，下一页，末页 *****************************/
    private long firstPage;

    private long prevPage;

    private long nextPage;

    private long lastPage;

    public long getFirstPage() {
        return 1L;
    }

    public void setFirstPage(long firstPage) {
        this.firstPage = firstPage;
    }

    public long getPrevPage() {
        return currentPage > 1 ? (currentPage - 1) : 1L;
    }

    public void setPrevPage(long prevPage) {
        this.prevPage = prevPage;
    }

    public long getNextPage() {
        return currentPage < pageCount ? (currentPage + 1) : pageCount;
    }

    public void setNextPage(long nextPage) {
        this.nextPage = nextPage;
    }

    public long getLastPage() {
        return pageCount;
    }

    public void setLastPage(long lastPage) {
        this.lastPage = lastPage;
    }

    /***************************************************************/

    public List<Long> getPageList() {
        return pageList;
    }

    public long getRecordCount() {
        return recordCount;
    }

    public long getPageCount() {
        return pageCount;
    }

    public long getPageSize() {
        return pageSize;
    }

    public long getCurrentPage() {
        return currentPage;
    }

    public long getCurrentFristPosition() {
        return currentFristPosition;
    }

    public void setCurrentFristPosition(long currentFristPosition) {
        this.currentFristPosition = currentFristPosition;
    }
    public long getCurrentLastPosition(){
        long curreentLast = currentFristPosition + pageSize;
        if(curreentLast > recordCount){
            return recordCount;
        }
        else{
            return curreentLast;
        }

    }
}
