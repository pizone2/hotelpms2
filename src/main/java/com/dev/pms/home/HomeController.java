package com.dev.pms.home;

import com.dev.pms.room.BookingVO;
import com.dev.pms.room.RoomService;
import com.dev.pms.stock.StatisticsVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.juli.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/*")
public class HomeController {

    @Autowired
    private HomeService homeService;


    @GetMapping("/")
    public ModelAndView home(Date endDate) throws  Exception{
        ModelAndView mv = new ModelAndView();
        List<HomeVO> monthVOs = homeService.getMonthSales();
        List<HomeVO> monthSalesPie = homeService.getMonthSelectedSalesPieHome(endDate);
        log.error(":::::{}:::::", monthVOs.get(0).getTotal());
        mv.addObject("monthVO",monthVOs);
        mv.addObject("monthSalesPie",monthSalesPie);
        mv.setViewName("index");
        return mv;
    }

    @GetMapping("todaySales")
    public ModelAndView getTodaySales(HomeVO homeVO) throws Exception{
        ModelAndView mv = new ModelAndView();

        List<HomeVO> statisticsVOs = homeService.getTodaySales(homeVO);
        List<HomeVO> bookingVOList = homeService.getDayCircualyr(homeVO);
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
        List<HomeVO> selectedSalesPie = homeService.getMonthSelectedSalesPie(endDate);
        log.error(":::::{}:::::", selectedSales.get(0).getTotal());
        mv.addObject("monthVO",selectedSales);
        mv.addObject("selectedSalesPie",selectedSalesPie);
        mv.setViewName("/statistics/monthSales");
        return mv;
    }

    @GetMapping("countDate")
    public ResponseEntity<Long> getCountDate(@RequestParam("paymentDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate paymentDate) {
        Long count = null;
        try {
            count = homeService.getCountDate(Date.valueOf(paymentDate));
        } catch (Exception e){
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(count, HttpStatus.OK);
    }





}
