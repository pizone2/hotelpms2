package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ManagerService {

    @Autowired
    private  ManagerDAO managerDAO;

    public List<ManagerStockVO> getStockList(ManagerStockVO managerStockVO) throws Exception{
        List<ManagerStockVO> stockList = managerDAO.getStockList(managerStockVO);

        for (ManagerStockVO stock : stockList) {
            Long inventoryId = stock.getInventoryId();
            Long currentStock = stock.getCurrentStock();
            Long autoOrderQuantity = stock.getAutoOrderQuantity();
            String orderStatus = stock.getOrderStatus();
            if ((currentStock == null || currentStock < autoOrderQuantity) && "양호".equals(orderStatus)) {
                managerDAO.setOrderStatus(stock);
            }

        }
        stockList = managerDAO.getStockList(managerStockVO);

        return stockList;
    }


    public int setQuantity(ManagerStockVO managerStockVO)throws Exception{
        return managerDAO.setQuantity(managerStockVO);
    }
    public int setOrderStatus(ManagerStockVO managerStockVO)throws Exception{
        return managerDAO.setOrderStatus(managerStockVO);
    }


}
