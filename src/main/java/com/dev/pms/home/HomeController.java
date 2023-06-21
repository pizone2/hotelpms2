package com.dev.pms.home;

import com.dev.pms.room.BookingVO;
import com.dev.pms.room.RoomService;
import com.dev.pms.stock.StatisticsVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/*")
public class HomeController {

    @Autowired
    private HomeService homeService;


    @GetMapping("/")
    public ModelAndView home() throws  Exception{
        ModelAndView mv = new ModelAndView();
        List<HomeVO> monthVOs = homeService.getMonthSales();
        log.error(":::::{}:::::", monthVOs.get(0).getTotal());
        mv.addObject("monthVO",monthVOs);
        mv.setViewName("index");
        return mv;
    }

    @GetMapping("todaySales")
    public ModelAndView getTodaySales(HomeVO homeVO) throws Exception{
        ModelAndView mv = new ModelAndView();

        List<HomeVO> statisticsVOs = homeService.getTodaySales(homeVO);
        List<HomeVO> bookingVOList = homeService.getDayCircualyr();
        mv.addObject("data",bookingVOList);
        mv.addObject("statisticsVO",statisticsVOs);
        mv.setViewName("statistics/circular");
        mv.setViewName("todaySales");
        return mv;
    }

    @GetMapping("monthSales")
    public ModelAndView getMonthSelectedSales(Date endDate) throws Exception{
        ModelAndView mv = new ModelAndView();

        List<HomeVO> selectedSales = homeService.getMonthSelectedSales(endDate);

        log.error(":::::{}:::::", selectedSales.get(0).getTotal());
        mv.addObject("selectedSales",selectedSales);
        mv.setViewName("/statistics/monthSales");
        return mv;
    }





}
