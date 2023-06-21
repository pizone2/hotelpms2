package com.dev.pms.home;

import com.dev.pms.stock.ManagerStockVO;
import com.dev.pms.stock.StatisticsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HomeDAO {

    public List<HomeVO> getTodaySales(HomeVO homeVO)throws Exception;
}
