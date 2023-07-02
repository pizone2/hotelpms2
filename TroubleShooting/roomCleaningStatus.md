

:octocat: [Main](/)
> Trouble Shooting

## 객실청소상태 보고 및 확인
- 객실청소상태 확인 시 사진파일 로드 X
  - 파일을 Local에 저장하는 방식에서 프로젝트에 저장하는 방식으로 변경


#### 객실청소상태 확인 시 사진파일 로드 X
- 객실청소상태를 보고 한 컴퓨터에서는 청소상태를 확인 가능하지만 다른 컴퓨터에서 파일 로드를 하지 못하는 문제 발생
```java
 public int saveFile(MultipartFile multipartFile) throws Exception {

        int result = 0;
     
        String realPath = servletContext.getRealPath("/resources/static/images/");

        realPath = fileManager.fileSave(multipartFile, realPath);

        FileVO fileVO = new FileVO();
        fileVO.setSavedName(realPath);
        fileVO.setOrgName(multipartFile.getOriginalFilename());
        result = cleanDAO.insertFile(fileVO);
        cleanDAO.updateCleanNum();
            return result;
    }
      
```

> 'FileManager'로 'realPath'와 매개변수로 받은 'multipartFile' 보냄

```java
public class FileManager {

    // file을 hdd에 저장
    public String fileSave(MultipartFile multipartFile, String path)throws Exception{
        File file = new File(path);

        // 존재하지 않으면 폴더를 생성
        if(!file.exists()) {
            file.mkdirs();
        }
        
        String name = UUID.randomUUID().toString();
        String originalFilename = multipartFile.getOriginalFilename();
        name = name + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

        // 파일 저장 두가지 방법
        file = new File(file, name);

        // multifile객체의 transferTo 메서드 사용
        multipartFile.transferTo(file);
        System.out.println(file);
        return name;
    }
}
```

> 'FileManager'에서 파일 저장


