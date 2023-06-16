package com.dev.pms.stock;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class StockService {

    @Autowired
    private StockDAO partnerStockDAO;

    public List<PartnerStockVO> getStockList(String businessNumber) throws Exception {
        return partnerStockDAO.getStockList(businessNumber);
    }

    public int setPartnerStock(PartnerStockVO partnerStockVO) throws Exception {
        return partnerStockDAO.setPartnerStock(partnerStockVO);
    }

    public int setStockUpdate(PartnerStockVO partnerStockVO) throws Exception {
        return partnerStockDAO.setStockUpdate(partnerStockVO);
    }

    public int setStockDelete(Long itemId) throws Exception {
        return partnerStockDAO.setStockDelete(itemId);
    }

    public List<PartnerVO> getPartnerList() throws Exception {
        return partnerStockDAO.getPartnerList();
    }
}