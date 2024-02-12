package com.eattogether.controller.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.RecipeDao;
import com.oreilly.servlet.MultipartRequest;

public class RecipeInsertController extends Superclass {
	private final String PREFIX = "board/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		/*
		 * FillItemDao dao = new FillItemDao(); List<FillItem> categories = null;
		 * categories = dao.getDataList("products", "category");
		 * 
		 * 
		 * request.setAttribute("categories", categories);
		 */

		super.gotoPage(PREFIX + "recipeInsert.jsp"); // 파일 이름 확인
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		// 업로드와 관련된 컨트롤러에서는 request 스코프의 mr 객체를 읽어 옵니다.
		MultipartRequest mr = (MultipartRequest) request.getAttribute("mr");

		System.out.println("mr = " + mr);

		Recipe bean = new Recipe();

		// 레시피 번호는 자동 처리됩니다.
		// bean.setRec_no(mr.getParameter("rec_no"));
		bean.setMem_id(mr.getParameter("mem_id"));
		bean.setCat_no(Integer.parseInt(mr.getParameter("cat_no")));
		bean.setRec_header(mr.getParameter("rec_header"));
		bean.setRec_photo(mr.getFilesystemName("rec_photo"));
		bean.setRec_material(mr.getParameter("rec_material"));

		// 배열 형태의 파라미터
		String[] recContents = mr.getParameterValues("rec_content[]");
		if (recContents != null && recContents.length > 0) {
			for (int i = 0; i < recContents.length && i < 10; i++) {
				// 각각의 rec_contentXX에 값을 설정합니다.
				String methodName = "setRec_content" + String.format("%02d", i + 1);
				try {
					// Recipe 클래스의 해당 메서드를 동적으로 호출합니다.
					Recipe.class.getMethod(methodName, String.class).invoke(bean, recContents[i]);
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
					// 메서드가 존재하지 않을 경우 예외를 처리합니다.
				}
			}
		}

		RecipeDao dao = new RecipeDao();
		int cnt = -1;

		cnt = dao.insertData(bean);

		if (cnt == -1) {
			super.gotoPage(PREFIX + "recipeInsert.jsp");
		} else {
			new RecipeListController().doGet(request, response);
		}
	}
}