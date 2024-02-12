package com.eattogether.controller.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.RecipeDao;
import com.oreilly.servlet.MultipartRequest;

public class RecipeUpdateController extends Superclass {
	private final String PREFIX = "board/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		int rec_no = Integer.parseInt(request.getParameter("rec_no"));
		RecipeDao dao = new RecipeDao();
		Recipe bean = dao.getDataBean(rec_no);

		request.setAttribute("bean", bean);
		super.gotoPage(PREFIX + "recipeUpdate.jsp");

		/*
		 * // 카테고리 테이블에서 레시피 목록을 읽어서 request에 바인딩합니다. FillItemDao fdao = new
		 * FillItemDao(); // FillItemDao 생성 List<FillItem> lists = null; categories =
		 * fdao.getDataList("products", "category");
		 * 
		 * // 수정하고자 하는 레시피 번호를 우선 챙깁니다. int rnum =
		 * Integer.parseInt(request.getParameter("rnum"));
		 * 
		 * RecipeDao rdao = new RecipeDao();
		 * 
		 * // bean : 이전에 관리자가 등록했던 레시피 1개의 정보 Recipe bean = rdao.getDataBean(rnum);
		 * 
		 * request.setAttribute("categories", categories); request.setAttribute("bean",
		 * bean);
		 */

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		MultipartRequest mr = (MultipartRequest) request.getAttribute("mr"); // MultipartRequest 서블릿

		System.out.println("mr = " + mr);

		Recipe bean = new Recipe();

		// 레시피 등록과는 다르게 수정은 레시피 번호를 반드시 챙겨야 합니다.
		bean.setRec_no(Integer.parseInt(mr.getParameter("rec_no")));
		bean.setMem_id(mr.getParameter("mem_id"));
		bean.setCat_no(Integer.parseInt(mr.getParameter("cat_no")));
		bean.setRec_header(mr.getParameter("rec_header"));
		bean.setRec_photo(mr.getFilesystemName("rec_photo"));
		bean.setRec_material(mr.getParameter("rec_material"));

		// 레시피 내용 배열 처리
		String[] recContents = mr.getParameterValues("rec_content[]");
		if (recContents != null && recContents.length > 0) {
			for (int i = 0; i < recContents.length && i < 10; i++) {
				// 각각의 rec_contentXX에 값을 설정합니다.
				String methodName = "setRec_content" + String.format("%02d", i + 1);
				try {
					// Recipe 클래스의 해당 메서드를 동적으로 호출하여 값을 설정합니다.
					Recipe.class.getMethod(methodName, String.class).invoke(bean, recContents[i]);
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
					// 메서드가 존재하지 않을 경우 예외를 처리합니다.
				}
			}
		}
		RecipeDao dao = new RecipeDao();
		int cnt = -1;

		cnt = dao.updateData(bean);

		if (cnt == -1) {
			super.gotoPage(PREFIX + "recipeUpdate.jsp");
		} else {
			new RecipeListController().doGet(request, response);
		}
	}
}