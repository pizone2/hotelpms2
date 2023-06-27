package com.dev.pms.stock;


import com.dev.pms.user.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class StockService {

    @Autowired
    private StockDAO stockDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    //----------- 사업자 - 품목
    public List<PartnerStockVO> getStockList(String businessNumber) throws Exception {
        return stockDAO.getStockList(businessNumber);
    }

    public int setPartnerStock(PartnerStockVO partnerStockVO) throws Exception {
        return stockDAO.setPartnerStock(partnerStockVO);
    }

    public int setStockUpdate(PartnerStockVO partnerStockVO) throws Exception {
        return stockDAO.setStockUpdate(partnerStockVO);
    }

    public int setStockDelete(Long itemId) throws Exception {
        return stockDAO.setStockDelete(itemId);
    }

    //----------- 관리자 - 업체관리
    public List<PartnerVO> getPartnerList() throws Exception {
        return stockDAO.getPartnerList();
    }

    public int setPartnerDelete(String businessNumber) throws Exception{
        stockDAO.setPartnerDelete(businessNumber);
        return stockDAO.setPartnerUserDelete(businessNumber);
    }

    public int setPartnerUpdate(String businessNumber) throws Exception{
        stockDAO.setPartnerUpdate(businessNumber);
        PartnerVO partnerVO = stockDAO.getUpdatedPartnerSelect(businessNumber);
        UserVO userVO = new UserVO();
        userVO.setId(partnerVO.getBusinessNumber());
        userVO.setPassword(passwordEncoder.encode(partnerVO.getBusinessNumber()));
        userVO.setName(partnerVO.getContactName());
        userVO.setEmail(partnerVO.getEmail());
        userVO.setPhoneNumber(partnerVO.getPhoneNumber());
        userVO.setRoleName(partnerVO.getSectors());
        return stockDAO.setPartnerUserAdd(userVO);
    }

    //----------- 객실별 설정

    public  List<String> getRoomType() throws Exception {
        return stockDAO.getRoomType();
    }

    public List<HotelStockVO> getHotelStockList() throws  Exception{
        return stockDAO.getHotelStockList();
    }

    public int setRoomStockAdd(Map<String, Object> payload) throws Exception{
        String roomType = (String) payload.get("roomType");
        List<Map<String, Object>> items = (List<Map<String, Object>>) payload.get("items");

        RoomStockVO roomStockVO = new RoomStockVO();
        roomStockVO.setRoomType(roomType);

        //기존에 ROOMSTOCK에 있던 객실타입별 재고들 삭제
        int result = 0;
        if(stockDAO.getRoomTypeCount(roomType)>=1L){
            result = stockDAO.setRoomStockDelete(roomType);
        }

        //ROOMSTOCK에 재고 INSERT
        for(Map<String, Object> itemMap : items) {
            String inventoryIdString = (String) itemMap.get("inventoryId");
            String quantityString = (String) itemMap.get("quantity");

            Long inventoryId = Long.parseLong(inventoryIdString);
            Long quantity = Long.parseLong(quantityString);

            roomStockVO.setInventoryId(inventoryId);
            roomStockVO.setCount(quantity);
            result = stockDAO.setRoomStockAdd(roomStockVO);
        }
        return result;
    }

    public Long getRoomTypeCount(String roomType) throws  Exception{
        return stockDAO.getRoomTypeCount(roomType);
    }

    public List<RoomStockVO> getRoomTypeStock(String roomType) throws  Exception{
        return stockDAO.getRoomTypeStock(roomType);
    }
}