package com.eattogether.controller.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.bean.combo01;
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
		String p = request.getParameter("p");
		
		if ("cat_no".equals(mode)) {
		    if ("양식".equals(keyword)) {
		        keyword = "1";
		    }
		    if ("한식".equals(keyword)) {
		        keyword = "2";
		    }
		    if ("중식".equals(keyword)) {
		        keyword = "3";
		    }
		    if ("일식".equals(keyword)) {
		        keyword = "4";
		    }
		}
		
		if("rec_header".equals(mode)){
			if ("오코노미야끼".equals(keyword) || "오코노미야키".equals(keyword)|| "오꼬노미야끼".equals(keyword)) {
		        keyword = "노미야";
		    }
		}
		
		System.out.println(keyword);
		RecipeDao dao = new RecipeDao();
		MemberDao mdao = new MemberDao();

		request.setAttribute("ww", 0);
		if("mem_id".equals(mode)) {
			Member aa=mdao.getData5(keyword);
			keyword=aa.getId(); 
			request.setAttribute("aa",aa);
			request.setAttribute("ww", 1);
		}else {
			Member aa=mdao.getData5(keyword);
			System.out.println("aa : "+aa);
			if(aa != null) {
				System.out.println("aa : "+aa.getId());
				keyword=aa.getId(); 
				request.setAttribute("aa",aa);
				request.setAttribute("ww", 1);
			}
		}
		int totalCount = dao.getTotalRecordCount("recipe", mode, keyword);
		String url = super.getUrlInformation("reList");
		boolean isGrid = true;//상품이라면 true가 됩니다.
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid, p);
		
		//int beginRow = 1;
		//int endRow = 10;
		
		
		
		
		//System.out.println("recipe 데이터목록개수 :" + dataList.size());
		
		request.setAttribute("paging", paging);//페이징 객체도 바인딩
		System.out.println("p의 값: " + p);
		
		if("s".equals(p)) {
			List<combo01> dataList = dao.getDataList(paging);
			request.setAttribute("pano", pageNumber);
			request.setAttribute("dataList", dataList);
			
		}else if("o".equals(p)){

			List<combo01> dataList2 = dao.getDataList2(paging);
			request.setAttribute("pano", pageNumber);
			request.setAttribute("dataList", dataList2);
		}else {

			List<combo01> dataList3 = dao.getDataList3(paging);
			request.setAttribute("pano", pageNumber);
			request.setAttribute("dataList", dataList3);
		}
		
		super.gotoPage(PREFIX + "recipe.jsp");
	}
}
