package domain;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
@Component("orderCom")
@Scope(value = "prototype")
@Entity
@Table(name = "t_order_com")
public class OrderCom implements Serializable {
    private int id;
    private int comsNum;
    private BigDecimal comsPrice;
    private String createBy;
    private Timestamp createDate;
    private String updateBy;
    private Timestamp updateDate;
    private int statu;
    private int delFlag;
    private int version;
    private Order orderByOid;
    private Commodity commodityByComid;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "coms_num")
    public int getComsNum() {
        return comsNum;
    }

    public void setComsNum(int comsNum) {
        this.comsNum = comsNum;
    }

    @Basic
    @Column(name = "coms_price")
    public BigDecimal getComsPrice() {
        return comsPrice;
    }

    public void setComsPrice(BigDecimal comsPrice) {
        this.comsPrice = comsPrice;
    }

    @Basic
    @Column(name = "create_by")
    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    @Basic
    @Column(name = "create_date")
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "update_by")
    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Basic
    @Column(name = "update_date")
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    @Basic
    @Column(name = "statu")
    public int getStatu() {
        return statu;
    }

    public void setStatu(int statu) {
        this.statu = statu;
    }

    @Basic
    @Column(name = "del_flag")
    public int getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(int delFlag) {
        this.delFlag = delFlag;
    }

    @Basic
    @Column(name = "version")
    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderCom orderCom = (OrderCom) o;

        if (id != orderCom.id) return false;
        if (comsNum != orderCom.comsNum) return false;
        if (statu != orderCom.statu) return false;
        if (delFlag != orderCom.delFlag) return false;
        if (version != orderCom.version) return false;
        if (comsPrice != null ? !comsPrice.equals(orderCom.comsPrice) : orderCom.comsPrice != null) return false;
        if (createBy != null ? !createBy.equals(orderCom.createBy) : orderCom.createBy != null) return false;
        if (createDate != null ? !createDate.equals(orderCom.createDate) : orderCom.createDate != null) return false;
        if (updateBy != null ? !updateBy.equals(orderCom.updateBy) : orderCom.updateBy != null) return false;
        if (updateDate != null ? !updateDate.equals(orderCom.updateDate) : orderCom.updateDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + comsNum;
        result = 31 * result + (comsPrice != null ? comsPrice.hashCode() : 0);
        result = 31 * result + (createBy != null ? createBy.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (updateBy != null ? updateBy.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
        result = 31 * result + statu;
        result = 31 * result + delFlag;
        result = 31 * result + version;
        return result;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "oid", referencedColumnName = "id", nullable = false)
    public Order getOrderByOid() {
        return orderByOid;
    }

    public void setOrderByOid(Order orderByOid) {
        this.orderByOid = orderByOid;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "comid", referencedColumnName = "id", nullable = false)
    public Commodity getCommodityByComid() {
        return commodityByComid;
    }

    public void setCommodityByComid(Commodity commodityByComid) {
        this.commodityByComid = commodityByComid;
    }

    @Override
    public String toString() {
        return "OrderCom{" +
                "id=" + id +
                ", comsNum=" + comsNum +
                ", comsPrice=" + comsPrice +
                ", createBy='" + createBy + '\'' +
                ", createDate=" + createDate +
                ", updateBy='" + updateBy + '\'' +
                ", updateDate=" + updateDate +
                ", statu=" + statu +
                ", delFlag=" + delFlag +
                ", version=" + version +
                '}';
    }
}
