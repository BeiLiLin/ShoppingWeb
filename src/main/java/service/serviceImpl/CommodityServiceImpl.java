package service.serviceImpl;

import domain.Commodity;
import org.springframework.stereotype.Service;
import service.CommodityService;
@Service("commodityService")
public class CommodityServiceImpl extends BaseServiceImpl<Commodity> implements CommodityService {
}
