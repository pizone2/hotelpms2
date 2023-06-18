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


    public String getYearMonth() {
        YearMonth currentYearMonth = YearMonth.now();
        System.out.println("서비스 스트링이어먼스"+ currentYearMonth);
        return currentYearMonth.format(DateTimeFormatter.ofPattern("yyyy-MM"));

    }


    /*ublic String getYearMonth() {
        YearMonth currentYearMonth = YearMonth.now();
        String yearMonthString = currentYearMonth.format(DateTimeFormatter.ofPattern("yyyy-MM"));
        String yearMonthWithDay = yearMonthString + "-01";
        System.out.println("Service String Month: " + yearMonthWithDay);
        return yearMonthWithDay;
    }*/
/*
    public List<PartnerCalculateVO> getByYearMonth(String yearMonths) throws Exception {
        YearMonth yearMonth = YearMonth.parse(yearMonths, DateTimeFormatter.ofPattern("yyyy-MM-"));
        System.out.println("Service에서 dao로 전달될 때: " + yearMonth);
        return partnerCalculateDAO.getByYearMonth(yearMonth);
    }
*/



//    public List<PartnerCalculateVO> getByYearMonth(String yearMonths) throws Exception {
//        LocalDate yearMonth = LocalDate.parse(yearMonths + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//        String yearMonthString = yearMonth.format(DateTimeFormatter.ofPattern("yyyy-MM"))+"-01";
//        System.out.println("When passing to Service dao: " + yearMonthString);
//        return partnerCalculateDAO.getByYearMonth(yearMonthString);
//    }
//public List<PartnerCalculateVO> getByYearMonth(String yearMonths) throws Exception {
//    LocalDate yearMonth = LocalDate.parse(yearMonths + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//    String yearMonthString = yearMonth.format(DateTimeFormatter.ofPattern("yyyy-MM")) + "-01";
//    System.out.println("DAO로 전달하는 값: " + yearMonthString);
//    return partnerCalculateDAO.getByYearMonth(yearMonthString);
//}
    public List<PartnerCalculateVO> getByYearMonth(String yearMonths) throws Exception {
        LocalDate yearMonth = LocalDate.parse(yearMonths + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String yearMonthString = yearMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-01"));
        System.out.println("DAO로 전달하는 값: " + yearMonthString);
        return partnerCalculateDAO.getByYearMonth(yearMonthString);
    }

}