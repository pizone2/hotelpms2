package com.dev.pms.stock;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerDAO {

    public PartnerVO getBusinessNumber(String businessNumber) throws Exception;

    public int setPartner(PartnerVO partnerVO) throws Exception;

}

