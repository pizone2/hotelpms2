package com.dev.pms.stock;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PartnerStockDAO {
    public int setPartnerStock(PartnerStockVO partnerStockVO) throws Exception;

    public List<PartnerStockVO> getStockList(String businessNumber) throws  Exception;

    public List<PartnerStockVO> getAllItemsList() throws  Exception;

    public int setItemStatus(PartnerStockVO partnerStockVO) throws  Exception;

    public int setUpdateitemList(int itemId) throws  Exception;
    public int setMultipleHotelInventory(int itemId) throws  Exception;
//    public int setInsertorderQuantity(int itemId, int orderQuantity) throws Exception;

    public int setInsertOrderQuantity(int itemId, int autoOrderQuantity) throws Exception;

    public int setInsertStockMonth(int itemId) throws Exception;
        // Your implementation here

}