package com.dev.pms.stock;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Random;
import static org.junit.Assert.*;
@SpringBootTest
class PartnerStockDAOTest {
    @Autowired
    private StockDAO partnerStockDAO;

    @Test
    void testInsertDummyData() throws Exception {
        String businessNumber = "3080913566";
        String productName = "린스";
        String[] itemCodes = generateItemCodes(80);
        Random random = new Random();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String remarks1 = "머리카락 표면에 부드럽게 부착하여 머리카락을 부드럽고 윤기나게 만드는 데 도움을 줍니다. 베헤닐트리모늄클로라이드, 세테아릴알코올 등이 이에 해당합니다.";
        String remarks2 = "린스에는 머리카락에 수분을 공급하여 건조함을 방지하고 윤기를 부여하는 보습제가 포함됩니다. 이에는 글리세린, 알로에베라즙 등이 포함될 수 있습니다.";

        int result = 0;
        for (int i = 51; i < 100; i++) {
            PartnerStockVO partnerStock = new PartnerStockVO();
            partnerStock.setBusinessNumber(businessNumber);
            partnerStock.setProductName(productName);
            partnerStock.setItemCode(itemCodes[i]);
            partnerStock.setUnit((long) getRandomUnit());
            partnerStock.setUnitPrice(getUnitPriceByUnit(Math.toIntExact(partnerStock.getUnit())));
            partnerStock.setRemarks((i % 2 == 0) ? remarks1 : remarks2);
            partnerStock.setItemUsagestatus(false);
            result = partnerStockDAO.setPartnerStock(partnerStock);
        }

        // Assertion
        assertEquals(50, result);
    }

    private String[] generateItemCodes(int count) {
        String[] itemCodes = new String[count];
        String prefix = "B";
        for (int i = 51; i < count; i++) {
            String suffix = String.format("%03d", i + 1);
            itemCodes[i] = prefix + suffix;
        }
        return itemCodes;
    }

    private int getRandomUnit() {
        Random random = new Random();
        int unit = random.nextInt(6) + 5;  // 5 ~ 10 중에서 랜덤 선택
        return unit * 10;  // 10 단위로 조정
    }

    private Long getUnitPriceByUnit(int unit) {
        return unit * 10L;
    }
}
