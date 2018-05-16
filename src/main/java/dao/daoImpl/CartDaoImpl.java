package dao.daoImpl;

import dao.CartDao;
import domain.Cartitem;
import org.springframework.stereotype.Repository;

@Repository("cartDao")
public class CartDaoImpl extends BaseDaoImpl<Cartitem> implements CartDao{
}
