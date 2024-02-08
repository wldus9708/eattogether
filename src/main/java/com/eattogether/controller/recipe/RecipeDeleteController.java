package com.eattogether.controller.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.dao.RecipeDao;

public class RecipeDeleteController extends Superclass{
	@Override // 넘겨진 상품 번호를 이용하여 데이터 베이스에서 삭제합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int rec_no = Integer.parseInt(request.getParameter("rec_no")) ;
		RecipeDao dao = new RecipeDao() ;
		int cnt = -1; 
		
		cnt = dao.deleteData(rec_no) ;
		
		new RecipeListController().doGet(request, response);
	}
}
