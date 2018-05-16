package dao.daoImpl;

import dao.CommodityDao;
import domain.Commodity;
import org.springframework.stereotype.Repository;

@Repository("commodityDao")
public class CommodityDaoImpl extends BaseDaoImpl<Commodity> implements CommodityDao {
}
