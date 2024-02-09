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
		  FillItemDao dao = new FillItemDao(); 
		  List<FillItem> categories = null;
		  categories = dao.getDataList("products", "category"); 
		 

		request.setAttribute("categories", categories); */

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
		bean.setMem_no(Integer.parseInt(mr.getParameter("mem_no")));
		bean.setCat_no(Integer.parseInt(mr.getParameter("cat_no")));
		bean.setRec_header(mr.getParameter("rec_header"));
		bean.setRec_content(mr.getParameter("rec_content"));
		bean.setRec_regdate(mr.getParameter("rec_regdate"));
		bean.setRec_photo(mr.getFilesystemName("rec_photo"));
		bean.setRec_hit(Integer.parseInt(mr.getParameter("rec_hit")));
		bean.setRec_popularity(Integer.parseInt(mr.getParameter("rec_popularity")));
		bean.setRec_bookmark(mr.getParameter("rec_bookmark"));
		bean.setRec_material(mr.getParameter("rec_material"));
		bean.setRec_content(mr.getParameter("rec_content02"));
		bean.setRec_content(mr.getParameter("rec_content03"));
		bean.setRec_content(mr.getParameter("rec_content04"));
		bean.setRec_content(mr.getParameter("rec_content05"));
		bean.setRec_content(mr.getParameter("rec_content06"));
		bean.setRec_content(mr.getParameter("rec_content07"));
		bean.setRec_content(mr.getParameter("rec_content08"));
		bean.setRec_content(mr.getParameter("rec_content09"));
		bean.setRec_content(mr.getParameter("rec_content10"));

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