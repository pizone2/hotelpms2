package com.dev.pms.stock;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ManagerDAO {
    public List<ManagerStockVO> getStockList(ManagerStockVO managerStockVO)throws Exception;
    public List<StatisticsVO> getTodaySales(StatisticsVO statisticsVO)throws Exception;

    public int setQuantity(ManagerStockVO managerStockVO)throws Exception;
    public int setOrderStatus(ManagerStockVO managerStockVO)throws Exception;
    public int setStatus(ManagerStockVO managerStockVO)throws Exception;
    public int setAlarm(ManagerStockVO managerStockVO)throws Exception;

}
