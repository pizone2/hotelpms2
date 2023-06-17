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
        return managerDAO.getStockList(managerStockVO);
    }

    public int setQuantity(ManagerStockVO managerStockVO)throws Exception{
        return managerDAO.setQuantity(managerStockVO);
    }


}
