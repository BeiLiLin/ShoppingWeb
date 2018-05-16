package domain;
/*
    订单实体类
 */
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Set;
@Component("order")
@Scope(value = "prototype")
@Entity
@Table(name = "t_order")
public class Order implements Serializable {
    private int id;
    private String oid;
    private String shipNumber;
    private BigDecimal payPrice;
    private String shipBy;
    private Timestamp shipDate;
    private String receiptBy;
    private Timestamp receiptDate;
    private int isReceipt;
    private int isPay;
    private Timestamp payTime;
    private String createBy;
    private Timestamp createDate;
    private String updateBy;
    private Timestamp updateDate;
    private int statu;
    private int delFlag;
    private int version;
    private User userByUid;
    private Set<OrderCom> orderComsById;

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
    @Column(name = "oid")
    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    @Basic
    @Column(name = "ship_number")
    public String getShipNumber() {
        return shipNumber;
    }

    public void setShipNumber(String shipNumber) {
        this.shipNumber = shipNumber;
    }

    @Basic
    @Column(name = "pay_price")
    public BigDecimal getPayPrice() {
        return payPrice;
    }

    public void setPayPrice(BigDecimal payPrice) {
        this.payPrice = payPrice;
    }

    @Basic
    @Column(name = "ship_by")
    public String getShipBy() {
        return shipBy;
    }

    public void setShipBy(String shipBy) {
        this.shipBy = shipBy;
    }

    @Basic
    @Column(name = "ship_date")
    public Timestamp getShipDate() {
        return shipDate;
    }

    public void setShipDate(Timestamp shipDate) {
        this.shipDate = shipDate;
    }

    @Basic
    @Column(name = "receipt_by")
    public String getReceiptBy() {
        return receiptBy;
    }

    public void setReceiptBy(String receiptBy) {
        this.receiptBy = receiptBy;
    }

    @Basic
    @Column(name = "receipt_date")
    public Timestamp getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Timestamp receiptDate) {
        this.receiptDate = receiptDate;
    }

    @Basic
    @Column(name = "is_receipt")
    public int getIsReceipt() {
        return isReceipt;
    }

    public void setIsReceipt(int isReceipt) {
        this.isReceipt = isReceipt;
    }

    @Basic
    @Column(name = "is_pay")
    public int getIsPay() {
        return isPay;
    }

    public void setIsPay(int isPay) {
        this.isPay = isPay;
    }

    @Basic
    @Column(name = "pay_time")
    public Timestamp getPayTime() {
        return payTime;
    }

    public void setPayTime(Timestamp payTime) {
        this.payTime = payTime;
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

        Order order = (Order) o;

        if (id != order.id) return false;
        if (isReceipt != order.isReceipt) return false;
        if (isPay != order.isPay) return false;
        if (statu != order.statu) return false;
        if (delFlag != order.delFlag) return false;
        if (version != order.version) return false;
        if (oid != null ? !oid.equals(order.oid) : order.oid != null) return false;
        if (shipNumber != null ? !shipNumber.equals(order.shipNumber) : order.shipNumber != null) return false;
        if (payPrice != null ? !payPrice.equals(order.payPrice) : order.payPrice != null) return false;
        if (shipBy != null ? !shipBy.equals(order.shipBy) : order.shipBy != null) return false;
        if (shipDate != null ? !shipDate.equals(order.shipDate) : order.shipDate != null) return false;
        if (receiptBy != null ? !receiptBy.equals(order.receiptBy) : order.receiptBy != null) return false;
        if (receiptDate != null ? !receiptDate.equals(order.receiptDate) : order.receiptDate != null) return false;
        if (payTime != null ? !payTime.equals(order.payTime) : order.payTime != null) return false;
        if (createBy != null ? !createBy.equals(order.createBy) : order.createBy != null) return false;
        if (createDate != null ? !createDate.equals(order.createDate) : order.createDate != null) return false;
        if (updateBy != null ? !updateBy.equals(order.updateBy) : order.updateBy != null) return false;
        if (updateDate != null ? !updateDate.equals(order.updateDate) : order.updateDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (oid != null ? oid.hashCode() : 0);
        result = 31 * result + (shipNumber != null ? shipNumber.hashCode() : 0);
        result = 31 * result + (payPrice != null ? payPrice.hashCode() : 0);
        result = 31 * result + (shipBy != null ? shipBy.hashCode() : 0);
        result = 31 * result + (shipDate != null ? shipDate.hashCode() : 0);
        result = 31 * result + (receiptBy != null ? receiptBy.hashCode() : 0);
        result = 31 * result + (receiptDate != null ? receiptDate.hashCode() : 0);
        result = 31 * result + isReceipt;
        result = 31 * result + isPay;
        result = 31 * result + (payTime != null ? payTime.hashCode() : 0);
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
    @JoinColumn(name = "uid", referencedColumnName = "id", nullable = false)
    public User getUserByUid() {
        return userByUid;
    }

    public void setUserByUid(User userByUid) {
        this.userByUid = userByUid;
    }

    @OneToMany(mappedBy = "orderByOid",fetch = FetchType.LAZY)
    public Set<OrderCom> getOrderComsById() {
        return orderComsById;
    }

    public void setOrderComsById(Set<OrderCom> orderComsById) {
        this.orderComsById = orderComsById;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", oid='" + oid + '\'' +
                ", shipNumber='" + shipNumber + '\'' +
                ", payPrice=" + payPrice +
                ", shipBy='" + shipBy + '\'' +
                ", shipDate=" + shipDate +
                ", receiptBy='" + receiptBy + '\'' +
                ", receiptDate=" + receiptDate +
                ", isReceipt=" + isReceipt +
                ", isPay=" + isPay +
                ", payTime=" + payTime +
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
