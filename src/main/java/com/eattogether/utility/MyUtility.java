package com.eattogether.utility;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.eattogether.common.SuperController;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MyUtility {
	public static String getCurrentTime() {
		// 현재 시각을 문자열로 만들어서 반환해 줍니다.
		String pattern = "yyyy/MM/dd hh:mm:ss " ;
		return new SimpleDateFormat(pattern).format(new Date()) ;
	}
	
	public static void deleteOldImageFile(String imageUploadWebPath, MultipartRequest mr) {
		// 상품 수정시 웹서버 경로에 있는 과거 이미지를 삭제합니다.
		// 관련 파일 : prUpdateForm.jsp 파일에 name 속성이 "deleteImage숫자형식"인 항목들
		String[] deleteImages = {
			mr.getParameter("deleteImage01"),
			mr.getParameter("deleteImage02"),
			mr.getParameter("deleteImage03")
		};
		
		for(String delFile : deleteImages) {
			if(delFile != null) {
				String deleteFile = imageUploadWebPath + "/" + delFile ; 
				File target = new File(deleteFile);
				if(target.delete()) {
					System.out.println(deleteFile + " file delete success"); 
				}
			}
		}
	}
	
	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String uploadPath) {		
		// 이미지 업로드에 필요한 멀티 파트 객체를 생성하여 반환해 줍니다.
		// request : 요청 내장 객체, uploadPath : 파일이 업로드 되는 폴더
		MultipartRequest mr = null ;
		int maxPostSize = 10 * 1024 *1024 ;
		String ENCODING = "UTF-8";
		
		/* DefaultFileRenamePolicy
		 동일 이름의 파일에 대한 rename 정책을 처리해주는 클래스
		 a.png 파일을 다시 업로드하면 a1.png라는 이름으로 업로드 됩니다.  */
		
		try {
			mr = new MultipartRequest(
					request, 
					uploadPath,
					maxPostSize,
					ENCODING,
					new DefaultFileRenamePolicy());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mr;
	}	

	
	public static Map<String, SuperController> getTodolistMap(String filename) {
		Map<String, SuperController> map = new HashMap<String, SuperController>();

		Properties prop = getPropertiesData(filename);

		Enumeration<Object> keys = prop.keys();

		while (keys.hasMoreElements()) {
			String command = keys.nextElement().toString();
			String className = prop.getProperty(command);
			
			try {
				Class<?> handleClass = Class.forName(className);
				SuperController instance =  (SuperController)handleClass.newInstance();
				
				map.put(command, instance);
			} catch (Exception e) {
				e.printStackTrace();
			}
			

		}

		return map;
	}

	private static Properties getPropertiesData(String filename) {
		// 해당 파일의 내용을 읽어 들여서 프로퍼티 목록으로 반환해 줍니다.
		FileInputStream fis = null;
		Properties prop = null;

		try {
			fis = new FileInputStream(filename);

			prop = new Properties();
			prop.load(fis);
			System.out.print("prop.size() : ");
			System.out.println(prop.size());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return prop;
	}

}
