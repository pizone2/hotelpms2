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
        String productName = "칫솔";
        String[] itemCodes = generateItemCodes(100);
        Random random = new Random();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String remarks1 = "초음파 소닉 기술: C칫솔은 초음파 소닉 기술을 사용하여 매우 고속으로 진동합니다. 이 기술은 칫솔 모험부터 세밀한 이물질 제거까지 모든 구강 영역을 효과적으로 청소합니다. 진동은 칫솔의 모든 섬유로 전달되어 치아와 잇몸 사이의 치아 치료를 완벽하게 지원합니다";
        String remarks2 = "고품질의 첨단 소재로 만들어져 있습니다. 칫솔 솔은 부드럽고 유연한 섬유로 구성되어 치아 표면을 부드럽게 마사지하면서 치석과 이물질을 효과적으로 제거합니다. 또한, 칫솔의 손잡이는 특수한 소재로 제작되어 편안한 그립감과 휴대성을 제공합니다..";

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
        String prefix = "B";
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
