package service;

import domain.Cartitem;

import java.io.Serializable;
import java.util.List;

public interface CartService extends BaseService<Cartitem> {
    public List<Cartitem> find(Serializable uid);
    public Boolean changeNum(int id ,int num);
    public Boolean payAll(int[]params);
    public Boolean save(int uid,int cid,int num);
    public Boolean BeforeSave(int uid,int cid,int num);
}
