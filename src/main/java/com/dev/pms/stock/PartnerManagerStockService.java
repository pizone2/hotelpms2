package com.dev.pms.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PartnerManagerStockService {
    @Autowired
    private PartnerManagerStockDAO partnerManagerStockDAO;

    public List<ManagerStockVO> getPartnerManagerList(ManagerStockVO managerStockVO) throws Exception{
        return partnerManagerStockDAO.getPartnerManagerList(managerStockVO);
    }

    public int updateInProgress(ManagerStockVO managerStockVO) throws Exception {
        return partnerManagerStockDAO.updateInProgress(managerStockVO);
    }

    public int updateOrderCompleted(ManagerStockVO managerStockVO) throws Exception {
        return partnerManagerStockDAO.updateOrderCompleted(managerStockVO);
    }
    public int updateOrderCompleted2(ManagerStockVO managerStockVO) throws Exception {
        return partnerManagerStockDAO.updateOrderCompleted2(managerStockVO);
    }
    public int updateOrderCompleted3(ManagerStockVO managerStockVO) throws Exception {
        return partnerManagerStockDAO.updateOrderCompleted3(managerStockVO);
    }
    public int updateGoodStock(ManagerStockVO managerStockVO) throws Exception {
        return partnerManagerStockDAO.updateGoodStock(managerStockVO);
    }
}
