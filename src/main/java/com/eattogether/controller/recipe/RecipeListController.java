package com.eattogether.controller.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.MemberDao;
import com.eattogether.model.dao.RecipeDao;
import com.eattogether.utility.Paging;


public class RecipeListController extends Superclass{
private final String PREFIX = "board/";
	
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
		MemberDao mdao = new MemberDao();
		int totalCount = dao.getTotalRecordCount("recipe", mode, keyword);
		String url = super.getUrlInformation("reList");
		boolean isGrid = true;//상품이라면 true가 됩니다.
		
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
		
		//int beginRow = 1;
		//int endRow = 10;
		
		List<Recipe> dataList = dao.getDataList(paging);
		
		System.out.println("recipe 데이터목록개수 :" + dataList.size());
		
		request.setAttribute("paging", paging);//페이징 객체도 바인딩
		request.setAttribute("dataList", dataList);//상품 목록 reqest 영역에 바인딩
		
		request.setAttribute("dataList", dataList);
		
		
		super.gotoPage(PREFIX + "recipe.jsp");
	}

}
