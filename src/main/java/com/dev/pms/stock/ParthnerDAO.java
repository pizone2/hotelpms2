package com.dev.pms.stock;


import com.dev.pms.room.ReservedVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ParthnerDAO {

    public PartnerVO getBusinessNumber(String businessNumber) throws Exception;

}

