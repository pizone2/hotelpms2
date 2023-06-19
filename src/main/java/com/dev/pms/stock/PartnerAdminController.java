package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/partnerAdmin/*")
public class PartnerAdminController {
    @Autowired
    private StockService stockService;

    // 관리자-업체관리
    @GetMapping("partnerList")
    public ModelAndView getStockList() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<PartnerVO> list = stockService.getPartnerList();
        mv.addObject("list",list);
        mv.setViewName("stock/partnerAdminList");
        return mv;
    }


    @PostMapping("partnerDelete")
    @ResponseBody
    public int stockDelete(@RequestBody List<String> businessNumbers) throws Exception{
        int result=0;
        for (String businessNumber : businessNumbers) {
            result = stockService.setPartnerDelete(businessNumber);
        }
        return result;
    }

    @PostMapping("partnerUpdate")
    @ResponseBody
    public int stockUpdate(String businessNumber) throws Exception{
        return stockService.setPartnerUpdate(businessNumber);
    }

    //객실별 설정
    @GetMapping("stockSetting")
    public ModelAndView setStockSetting() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<String> roomTypes = stockService.getRoomType();
        List<HotelStockVO>  hotelStockList = stockService.getHotelStockList();
        mv.addObject("roomTypes",roomTypes);
        mv.addObject("hotelStockList",hotelStockList);
        mv.setViewName("stock/stockSetting");
        return mv;
    }

    // INSERT
    @PostMapping("stockSettingInsert")
    @ResponseBody
    public int setRoomStockAdd(@RequestBody Map<String, Object> payload) throws Exception{
        int result =  stockService.setRoomStockAdd(payload);
        return result;
    }

    // 타입별 재고 확인
    @GetMapping("roomTypeStock")
    @ResponseBody
    public List<RoomStockVO> getRoomTypeStock(String roomType) throws Exception {
        List<RoomStockVO> roomStockVOs = stockService.getRoomTypeStock(roomType);
        return roomStockVOs;
    }



}
