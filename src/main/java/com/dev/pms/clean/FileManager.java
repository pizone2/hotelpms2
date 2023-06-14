package com.dev.pms.clean;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

    // file을 hdd에 저장
    public String fileSave(MultipartFile multipartFile, String path)throws Exception{
        File file = new File(path);

        // 존재하지 않으면 폴더를 생성
        if(!file.exists()) {
            file.mkdirs();
        }

        // 확장자 추가
        String name = UUID.randomUUID().toString();
        name = name + "_" + multipartFile.getOriginalFilename();

        // 파일 저장 두가지 방법
        file = new File(file, name);

        // multifile객체의 transferTo 메서드 사용
        multipartFile.transferTo(file);
        System.out.println(file);
        return name;
    }
}