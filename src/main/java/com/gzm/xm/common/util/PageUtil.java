package com.gzm.xm.common.util;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PageUtil {
    private long currentPage = 1;

    private long recordCount;

    private long pageCount;

    private long pageSize;

    private long currentFristPosition;

    private List<Long> pageList;
    
    



    public PageUtil(long recordCount, int pageSize, long currentPage) {
        this.recordCount = recordCount;
        this.pageSize = pageSize;
        this.pageCount = calculatePageCount();
        this.currentPage = calculateCurrentPage(currentPage);
        this.pageList = calculatePageList();
        this.currentFristPosition = calculateRecordPosition();
    }




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

    private long calculateCurrentPage(long currentPage) {
        if (currentPage < 1) currentPage = 1;
        else if (currentPage > pageCount) currentPage = pageCount;
        return currentPage;
    }

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
