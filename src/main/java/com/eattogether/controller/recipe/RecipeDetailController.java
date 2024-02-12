package com.eattogether.controller.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.RecipeDao;

public class RecipeDetailController extends Superclass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		RecipeDao dao = new RecipeDao();

		int rec_no = Integer.parseInt(request.getParameter("rec_no"));

		Recipe bean = dao.getDataBean(rec_no);

		// 텍스트 내용을 리스트로 가져옵니다.
		List<String> recContents = bean.getRec_contents();

		// 각각의 텍스트 내용을 request에 저장합니다.
		for (int i = 0; i < recContents.size(); i++) {
			request.setAttribute("rec_content" + (i + 1), recContents.get(i));
		}
		
		// 레시피 bean을 request에 저장합니다.
		request.setAttribute("bean", bean);

		super.gotoPage("board/recipedetailList.jsp"); // 파일 이름 확인
	}
}