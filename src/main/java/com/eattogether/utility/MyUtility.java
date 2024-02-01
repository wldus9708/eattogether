package com.eattogether.utility;

import java.io.FileInputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.eattogether.common.SuperController;

public class MyUtility {
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
