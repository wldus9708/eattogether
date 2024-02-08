package com.eattogether.utility;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class CustomFileRenamePolicy implements FileRenamePolicy {
    @Override
    public File rename(File file) {
        // 업로드된 파일의 이름을 얻어옵니다.
        String originalName = file.getName();
        
        // 파일의 확장자를 추출합니다.
        String fileExtension = originalName.substring(originalName.lastIndexOf("."));
        
        // UUID를 사용하여 고유한 파일 이름 생성
        String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
        
        // 새로운 파일 객체 생성
        File newFile = new File(file.getParent(), uniqueFileName);
        
        // 변경된 파일 이름을 가진 파일 객체 반환
        return newFile;
    }
}
