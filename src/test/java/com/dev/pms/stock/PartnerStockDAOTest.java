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
        String productName = "샴푸";
        String[] itemCodes = generateItemCodes(100);
        Random random = new Random();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String remarks1 = " 기름진 머리 등의 다양한 머리 문제를 해결하는데 탁월한 성능을 보여줍니다. 또한, 샴푸 사용 후 머릿결이 부드럽고 윤기 있으며, 향기로운 향이 오래 지속됩니다.";
        String remarks2 = "우리의 샴푸는 환경에도 친숙합니다. 자연 친화적이고 지속 가능한 재료를 사용하여 생태계에 미치는 영향을 최소화합니다. 또한, 우리는 동물 실험을 하지 않으며, 동물에게 어떠한 피해도 주지 않는 것을 원칙으로 합니다.";

        int result = 0;
        for (int i = 0; i < 50; i++) {
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
        String prefix = "D";
        for (int i = 1; i < count; i++) {
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
        return unit * 1000L;
    }
}
