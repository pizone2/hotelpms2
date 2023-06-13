package com.dev.pms.clean;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
public class CleanService {

//    @Value("${file.dir.mac}")
//    private String fileDirMac;
//
//    @Value("${file.dir.windows}")
//    private String fileDirWindows;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private CleanDAO cleanDAO;
    @Autowired
    private FileManager fileManager;



    public List<CalenderVO>getCleanList(CalenderVO calenderVO)throws Exception{
        return cleanDAO.getCleanList(calenderVO);
    }

    public List<RoomCleanVO>getRoomCleanList(RoomCleanVO roomCleanVO)throws Exception{
        return  cleanDAO.getRoomCleanList(roomCleanVO);
    }

    public int insertSchedule(CalenderVO calenderVO)throws Exception{
        return cleanDAO.insertSchedule(calenderVO);
    }
    public int deleteSchedule(CalenderVO calenderVO)throws Exception{
        System.out.println(calenderVO.getScheduleNumber());
        return cleanDAO.deleteSchedule(calenderVO);

    }

    public Long saveFile(MultipartFile multipartFile) throws Exception {
        if (multipartFile.isEmpty()) {
            return null;
        }

        // 원래 파일 이름 추출
        String origName = multipartFile.getOriginalFilename();

        // 파일 이름으로 쓸 uuid 생성
        String uuid = UUID.randomUUID().toString();

        // 확장자 추출(ex : .png)
        String extension = origName.substring(origName.lastIndexOf("."));

        // uuid와 확장자 결합
        String savedName = uuid + extension;

        //사용자 OS에 맞춰 경로 선택
        String fileDir = servletContext.getRealPath("/resources/static/images/");

        fileDir = fileManager.fileSave(multipartFile, fileDir);

//        EventDTO eventDTO = new EventDTO();
//        eventDTO.setFileName(fileDir);
//        eventDTO.setOriName(multipartFile.getOriginalFilename());
//        result = eventDAO.setEventAdd(eventDTO);
//        String osName = System.getProperty("os.name").toLowerCase();
//        if (osName.contains("mac")) {
//            fileDir = fileDirMac;
//        } else if (osName.contains("win")) {
//            fileDir = fileDirWindows;
//        } else {
//            // Handle other operating systems or set a default file directory
//            fileDir = "/path/to/default/directory/";
//        }

        // 파일을 불러올 때 사용할 파일 경로
        String savedPath = fileDir + savedName;


        // 파일 엔티티 생성
        FileVO file = FileVO.builder()
                .orgName(origName)
                .savedName(savedName)
                .savedPath(savedPath)
                .build();

        // 실제로 로컬에 uuid를 파일명으로 저장
//        files.transferTo(new File(savedPath));
//
//        File savedFile = new File(savedPath);
//        if (!savedFile.exists()) {
//            savedFile.createNewFile();
//        }

        // 데이터베이스에 파일 정보 저장
//        FileVO savedFileInfo = fileRepository.save(file);

//        return savedFileInfo.getImageId();
        try {
            cleanDAO.insertFile(file);
            return file.getImageId();
        } catch (Exception e) {
            // 예외 처리 로직을 작성합니다.
            e.printStackTrace();
            // 예외가 발생했을 때 반환할 값을 지정합니다. (예: null 또는 -1)
            return null;
        }
    }}
