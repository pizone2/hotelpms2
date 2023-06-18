package com.dev.pms.stock;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@Slf4j
public class PartnerCalculateService {

    @Autowired
    private PartnerCalculateDAO partnerCalculateDAO;


 public String getYearMonth(String date) {
     LocalDate localDate = LocalDate.parse(date); // 받은 날짜 값을 파싱하여 LocalDate 객체로 변환
     YearMonth yearMonth = YearMonth.from(localDate); // YearMonth 객체 생성
     System.out.println("Service String Month: " + yearMonth);
     return yearMonth.format(DateTimeFormatter.ofPattern("yyyy-MM")); // 원하는 형식으로 포맷팅하여 반환
 }


    public List<PartnerCalculateVO> getByYearMonth(String yearMonths) throws Exception {
        LocalDate yearMonth = LocalDate.parse(yearMonths + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String yearMonthString = yearMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-01"));
        System.out.println("DAO로 전달하는 값: " + yearMonthString);
        return partnerCalculateDAO.getByYearMonth(yearMonthString);
    }

    public List<PartnerCalculateVO> getByReceipt(String yearMonths, String businessNumber) throws Exception {
        LocalDate yearMonthString = LocalDate.parse(yearMonths + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String yearMonth = yearMonthString.format(DateTimeFormatter.ofPattern("yyyy-MM-01"));
        System.out.println("DAO로 전달하는 값: " + yearMonthString);
        return partnerCalculateDAO.getByReceipt(yearMonth,businessNumber);
    }
}