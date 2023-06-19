package com.dev.pms.stock;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PartnerCalculateDAO {
    List<PartnerCalculateVO> getByYearMonth(String yearMonthString) throws Exception;
    List<PartnerCalculateVO> getByReceipt(String yearMonth ,String businessNumber) throws Exception;
}