package com.eattogether.controller.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.RecipeDao;

public class RecipeDetailController extends Superclass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		RecipeDao dao = new RecipeDao();
		
		int rec_no = Integer.parseInt(request.getParameter("rec_no"));
		
		Recipe bean = dao.getDataBean(rec_no);
		
		request.setAttribute("bean", bean);
		
		super.gotoPage("board/recipedetailList.jsp"); // 파일 이름 확인
	}
}