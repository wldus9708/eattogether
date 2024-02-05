package com.eattogether.controller.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.RecipeDao;


public class RecipeListController extends Superclass{
private final String PREFIX = "recipe/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		System.out.println("상품 목록 페이지로 이동합니다.");
		
		//페이징 처리를 위한 파라미터 목록들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		RecipeDao dao = new RecipeDao();
		
		/*
		 * List<RecipeDao> dataList = dao.getDataList();
		 * 
		 * request.setAttribute("dataList", dataList);//상품 목록 reqest 영역에 바인딩
		 * request.setAttribute("dataList", dataList);
		 */
		
		super.gotoPage(PREFIX + "recipe.jsp");
	}

}
