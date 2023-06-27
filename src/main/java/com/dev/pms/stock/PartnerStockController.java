package com.dev.pms.stock;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/partnerStock/*")
public class PartnerStockController {

    @Autowired
    private StockService stockService;

    @Autowired
    private PartnerStockService partnerStockService;


    @GetMapping("stockList")
    public ModelAndView getStockList() throws Exception {
        ModelAndView mv = new ModelAndView();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName();
        List<PartnerStockVO> list = partnerStockService.getStockList(name);
        String itemCode = stockService.getNextItemCode(name);
        mv.addObject("itemCode", itemCode);
        mv.addObject("list",list);
        mv.setViewName("stock/partnerStockList");
        System.out.printf("asdf");
        return mv;
    }

    @PostMapping("stockInsert")
    public ModelAndView setPartnerStock(PartnerStockVO partnerStockVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = stockService.setPartnerStock(partnerStockVO);
        mv.setViewName("redirect:/partnerStock/stockList");
        return mv;
    }

    @PostMapping("stockUpdate")
    public ModelAndView setStockUpdate(PartnerStockVO partnerStockVO) throws Exception{
        ModelAndView mv = new ModelAndView();
        int result = stockService.setStockUpdate(partnerStockVO);
        mv.setViewName("redirect:/partnerStock/stockList");
        return mv;
    }

    @PostMapping("stockDelete")
    @ResponseBody
    public int stockDelete(@RequestParam Long itemIds[]) throws Exception{
        int result=0;
        //boolean check = false;
        log.error(":::::{}:::::",itemIds.length);
        for (Long itemId : itemIds) {
            result = stockService.setStockDelete(itemId);
        }
        return result;
    }

    @GetMapping("allItemsList")
    public ModelAndView getAllItemsList() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<PartnerStockVO> list = partnerStockService.getAllItemsList();
        mv.addObject("list", list);
        mv.setViewName("stock/AllItemsList");

        return mv;
    }
    //다중 선택시 실행되는 컨트롤러
    @PostMapping("/ItemNumberList")
    public void update(@RequestBody Map<String, Object> requestData) throws Exception {
        List<String> itemList = (List<String>) requestData.get("itemList");
        System.out.println(itemList);
        for (String value : itemList) {
            System.out.println(value);
            // value를 서비스에 전달
            partnerStockService.setUpdateitemList(value);
            partnerStockService.setMultipleHotelInventory(value);
        }
    }

    @PostMapping("/itemOrderQuantity")
    public void updateOrderQuantity(@RequestBody Map<String, Object> requestData) throws Exception {
        //Remove square brackets from item numbers in the array
        String itemList = requestData.get("itemList").toString();
        itemList = itemList.replace("[", "").replace("]", "");
        int itemValue = Integer.parseInt(itemList);

        String orderQuantityValue = requestData.get("orderQuantity").toString();
        System.out.println("컨트롤러의 아이템 리스트의 값" + itemList);
        System.out.println("컨트롤러의 최소수량의 값" + orderQuantityValue);
        partnerStockService.setUpdateitemList(itemList);
        partnerStockService.setInsertOrderQuantity(itemList, orderQuantityValue);

    }
}
