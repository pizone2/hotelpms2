package com.dev.pms.home;

import com.dev.pms.room.BookingVO;
import com.dev.pms.room.RoomService;
import com.dev.pms.stock.StatisticsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/*")
public class HomeController {

    @Autowired
    private HomeService homeService;


    @GetMapping("/")
    public String home() throws  Exception{
        return "index";
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


    // 원형 통계를 위한 컨트롤러
//    @GetMapping("daycirculayr")
//    public ModelAndView getDayCircualyr(HomeVO homeVO) throws Exception {
//        ModelAndView mv = new ModelAndView();
//        List<HomeVO> bookingVOList = homeService.getDayCircualyr();
//        mv.addObject("data",bookingVOList);
//        mv.setViewName("statistics/circular");
//        return mv;
//    }



}
