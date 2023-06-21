package com.dev.pms.home;

import com.dev.pms.stock.StatisticsVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Slf4j
@Service
public class HomeService {

    @Autowired
    private HomeDAO homeDAO;


 public List<HomeVO> getTodaySales(HomeVO homeVO)throws Exception{
    return homeDAO.getTodaySales(homeVO);
}
    public List<HomeVO> getDayCircualyr() throws Exception{
        return homeDAO.getDayCircualyr();
    }


    public List<HomeVO>  getMonthSales()throws Exception{
        return homeDAO.getMonthSales();
    }

    public List<HomeVO>  getMonthSelectedSales(Date endDate)throws Exception{
        return homeDAO.getMonthSelectedSales(endDate);
    }
    public Long getCountDate(Date paymentDate) throws Exception{
        return homeDAO.getCountDate(paymentDate);
    }
}
