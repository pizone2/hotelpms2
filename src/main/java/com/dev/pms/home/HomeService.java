package com.dev.pms.home;

import com.dev.pms.room.BookingVO;
import com.dev.pms.stock.StatisticsVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
