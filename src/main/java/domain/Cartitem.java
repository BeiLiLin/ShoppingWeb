package domain;
/*
    购物车实体类
 */
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
@Component("cartItem")
@Scope(value = "prototype")
@Entity
@Table(name = "t_cartitem")
public class Cartitem  implements Serializable{
    private int id;
    private Integer num;
    private Integer statu=0;
    private String createBy;
    private Timestamp createDate;
    private String updateBy;
    private Timestamp updateDate;
    private int delFlag = 0;
    private int version = 0;
    private User userByUid;
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
    @Column(name = "num")
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Basic
    @Column(name = "statu")
    public Integer getStatu() {
        return statu;
    }
    public void setStatu(Integer statu) {
        this.statu = statu;
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

        Cartitem tCartitem = (Cartitem) o;

        if (id != tCartitem.id) return false;
        if (delFlag != tCartitem.delFlag) return false;
        if (version != tCartitem.version) return false;
        if (num != null ? !num.equals(tCartitem.num) : tCartitem.num != null) return false;
        if (createBy != null ? !createBy.equals(tCartitem.createBy) : tCartitem.createBy != null) return false;
        if (createDate != null ? !createDate.equals(tCartitem.createDate) : tCartitem.createDate != null) return false;
        if (updateBy != null ? !updateBy.equals(tCartitem.updateBy) : tCartitem.updateBy != null) return false;
        if (updateDate != null ? !updateDate.equals(tCartitem.updateDate) : tCartitem.updateDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (createBy != null ? createBy.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (updateBy != null ? updateBy.hashCode() : 0);
        result = 31 * result + (updateDate != null ? updateDate.hashCode() : 0);
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
        return "Cartitem{" +
                "id=" + id +
                ", num=" + num +
                ", statu=" + statu +
                ", createBy='" + createBy + '\'' +
                ", createDate=" + createDate +
                ", updateBy='" + updateBy + '\'' +
                ", updateDate=" + updateDate +
                ", delFlag=" + delFlag +
                ", version=" + version +
                '}';
    }
}
