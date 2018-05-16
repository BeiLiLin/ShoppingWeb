package domain;
/*
    商品实体类
 */
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Set;
@Component("commodity")
@Scope(value = "prototype")
@Entity
@Table(name = "t_commodity")
public class Commodity implements Serializable {
    private int id;
    private String cname;
    private Double cost;
    private String info;
    private String classify;
    private String pic;
    private String merchant;
    private Integer store;
    private String createBy;
    private Timestamp createDate;
    private String updateBy;
    private Timestamp updateDate;
    private int delFlag;
    private int version;
    private Set<Cartitem> cartitemsById;
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
    @Column(name = "cname")
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Basic
    @Column(name = "cost")
    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    @Basic
    @Column(name = "Info")
    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Basic
    @Column(name = "classify")
    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    @Basic
    @Column(name = "pic")
    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Basic
    @Column(name = "merchant")
    public String getMerchant() {
        return merchant;
    }

    public void setMerchant(String merchant) {
        this.merchant = merchant;
    }

    @Basic
    @Column(name = "store")
    public Integer getStore() {
        return store;
    }

    public void setStore(Integer store) {
        this.store = store;
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

        Commodity that = (Commodity) o;

        if (id != that.id) return false;
        if (delFlag != that.delFlag) return false;
        if (version != that.version) return false;
        if (cname != null ? !cname.equals(that.cname) : that.cname != null) return false;
        if (cost != null ? !cost.equals(that.cost) : that.cost != null) return false;
        if (info != null ? !info.equals(that.info) : that.info != null) return false;
        if (classify != null ? !classify.equals(that.classify) : that.classify != null) return false;
        if (pic != null ? !pic.equals(that.pic) : that.pic != null) return false;
        if (merchant != null ? !merchant.equals(that.merchant) : that.merchant != null) return false;
        if (store != null ? !store.equals(that.store) : that.store != null) return false;
        if (createBy != null ? !createBy.equals(that.createBy) : that.createBy != null) return false;
        if (createDate != null ? !createDate.equals(that.createDate) : that.createDate != null) return false;
        if (updateBy != null ? !updateBy.equals(that.updateBy) : that.updateBy != null) return false;
        if (updateDate != null ? !updateDate.equals(that.updateDate) : that.updateDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (cname != null ? cname.hashCode() : 0);
        result = 31 * result + (cost != null ? cost.hashCode() : 0);
        result = 31 * result + (info != null ? info.hashCode() : 0);
        result = 31 * result + (classify != null ? classify.hashCode() : 0);
        result = 31 * result + (pic != null ? pic.hashCode() : 0);
        result = 31 * result + (merchant != null ? merchant.hashCode() : 0);
        result = 31 * result + (store != null ? store.hashCode() : 0);
        result = 31 * result + (createBy != null ? createBy.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (updateBy != null ? updateBy.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
        result = 31 * result + delFlag;
        result = 31 * result + version;
        return result;
    }

    @OneToMany(mappedBy = "commodityByComid",fetch = FetchType.LAZY)
    public Set<Cartitem> getCartitemsById() {
        return cartitemsById;
    }

    public void setCartitemsById(Set<Cartitem> cartitemsById) {
        this.cartitemsById = cartitemsById;
    }

    @OneToMany(mappedBy = "commodityByComid",fetch = FetchType.LAZY)
    public Set<OrderCom> getOrderComsById() {
        return orderComsById;
    }

    public void setOrderComsById(Set<OrderCom> orderComsById) {
        this.orderComsById = orderComsById;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "id=" + id +
                ", cname='" + cname + '\'' +
                ", cost=" + cost +
                ", info='" + info + '\'' +
                ", classify='" + classify + '\'' +
                ", pic='" + pic + '\'' +
                ", merchant='" + merchant + '\'' +
                ", store=" + store +
                ", createBy='" + createBy + '\'' +
                ", createDate=" + createDate +
                ", updateBy='" + updateBy + '\'' +
                ", updateDate=" + updateDate +
                ", delFlag=" + delFlag +
                ", version=" + version +
                '}';
    }
}
