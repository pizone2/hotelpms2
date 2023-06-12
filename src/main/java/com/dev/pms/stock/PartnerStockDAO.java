package com.dev.pms.stock;

import com.dev.pms.room.BookingVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerStockDAO {
    public int setPartnerStock(PartnerStockVO partnerStockVO) throws Exception;
}
