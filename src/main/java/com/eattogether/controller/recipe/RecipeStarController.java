package com.eattogether.controller.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.RecipeDao;

public class RecipeStarController extends Superclass{
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// TODO Auto-generated method stub
	super.doGet(request, response);
	RecipeDao dao = new RecipeDao();
	int rec_no = Integer.parseInt(request.getParameter("rec_no"));
	Recipe bean = dao.getDataBean(rec_no);
	String tp=request.getParameter("tp");
	List<String> recContents = bean.getRec_contents();
	Member loginfo = (Member) session.getAttribute("loginfo");
	String id=loginfo.getId();
	// 각각의 텍스트 내용을 request에 저장합니다.
	for (int i = 0; i < recContents.size(); i++) {
		request.setAttribute("rec_content" + (i + 1), recContents.get(i));
	}

	// 레시피 bean을 request에 저장합니다.
	request.setAttribute("bean", bean);
	System.out.println(tp);
	
	if("1".equals(tp)) {
		request.setAttribute("a", 0);
		System.out.println("1도착");
		int cnt = -1;

		cnt = dao.deleteData1(rec_no);

		if (cnt != -1) {
			super.gotoPage("board/recipedetailList.jsp");
		}
		}
	else if("0".equals(tp)) {
		request.setAttribute("a", 1);
		System.out.println("0도착");
		int cnt = -1;

		cnt = dao.insertData1(bean, id);

		if (cnt != -1) {
			super.gotoPage("board/recipedetailList.jsp");
		}
	}else {
		System.out.println("x도착");
		super.gotoPage("board/recipedetailList.jsp");
	}
}
@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
