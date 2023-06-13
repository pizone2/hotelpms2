package com.dev.pms.clean;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

//@NoArgsConstructor
//@Table(name = "ROOMCLEANIMAGE")
//@Entity
@Data
public class FileVO {

//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name="file_imageId")
    private Long imageId;
    private Long cleanNum;
    private String orgName;
    private String savedName;
    private String savedPath;

    @Builder
    public FileVO(Long imageId, Long cleanNum, String orgName, String savedName, String savedPath) {
        this.imageId = imageId;
        this.cleanNum = cleanNum;
        this.orgName = orgName;
        this.savedName = savedName;
        this.savedPath = savedPath;
    }

}
