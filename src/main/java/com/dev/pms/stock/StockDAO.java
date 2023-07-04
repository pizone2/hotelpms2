package com.dev.pms.stock;

import com.dev.pms.user.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockDAO {
    //----------- 사업자 - 품목
    public int setPartnerStock(PartnerStockVO partnerStockVO) throws Exception;

    public List<PartnerStockVO> getStockList(String businessNumber) throws  Exception;

    public int setStockUpdate(PartnerStockVO partnerStockVO) throws Exception;

    public int setStockDelete(Long itemId) throws Exception;

    //----------- 관리자 - 업체관리
    public List<PartnerVO> getPartnerList() throws  Exception;

    public int setPartnerDelete(String businessNumber) throws Exception;

    public int setPartnerUserDelete(String id) throws Exception;

    public int setPartnerUpdate(String businessNumber) throws Exception;

    public PartnerVO getUpdatedPartnerSelect(String businessNumber) throws Exception;

    //사업자 user 생성
    public int setPartnerUserAdd(UserVO userVO) throws Exception;

    //----------- 객실별 설정
    public List<String> getRoomType() throws  Exception;

    public List<HotelStockVO> getHotelStockList() throws  Exception;

    public int setRoomStockAdd(RoomStockVO roomStockVO) throws Exception;

    public Long getRoomTypeCount(String roomType) throws  Exception;

    public int setRoomStockDelete(String roomType) throws Exception;

    public List<RoomStockVO> getRoomTypeStock(String roomType) throws  Exception;


    public void insertPartner(PartnerVO partner) throws  Exception;
    public PartnerVO findPartner(String businessNumber) throws  Exception;
    public Integer countPartners() throws  Exception;
    public Integer countPartnerStocks(String businessNumber) throws  Exception;
}
