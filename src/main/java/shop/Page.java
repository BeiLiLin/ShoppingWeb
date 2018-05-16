package shop;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("page")
@Scope(value = "singleton")
public class Page {
    private int pageNo = 1;
    private int pageSize = 10;
    private Boolean updateList = true;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Boolean getUpdateList() {
        return updateList;
    }

    public void setUpdateList(Boolean updateList) {
        this.updateList = updateList;
    }

    public Page() {
    }
}
