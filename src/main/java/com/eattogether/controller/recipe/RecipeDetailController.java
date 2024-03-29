package com.eattogether.controller.recipe;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.bean.Star;
import com.eattogether.model.bean.combo01;
import com.eattogether.model.dao.RecipeDao;

public class RecipeDetailController extends Superclass {
	private final String PREFIX = "board/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		RecipeDao dao = new RecipeDao();

		int rec_no = Integer.parseInt(request.getParameter("rec_no"));
		Recipe bean = dao.getDataBean(rec_no);

		Star mbean =dao.getDataBean0(rec_no);
		combo01 combo=dao.getDateBean3(rec_no);

		request.setAttribute("combo", combo);
		System.out.println(mbean);
		if(mbean==null) {
			request.setAttribute("a", 0);
		}else {
			if (rec_no == mbean.getRec_no()) {
				request.setAttribute("a", 1);
			}		
		}
		
		if (mbean != null && rec_no == mbean.getRec_no()) { // mbean이 null이 아니고, rec_no와 mbean의 rec_no가 같은 경우에만 실행
			request.setAttribute("a", 1);
		}

		if (bean == null) {
			super.setAlertMessage("로그인을 하셔야 합니다.");
			super.gotoPage(PREFIX + "recipedetailList.jsp"); // 페이지 확인
		} else {

			String readhitUpdate = request.getParameter("readhitUpdate");

			if (readhitUpdate == null) {
				readhitUpdate = "false";
			}

			if (readhitUpdate.equals("true")) {
				dao.updateReadhit(rec_no);

		
			}

		}
		// 최근본 목록
		HttpSession session = request.getSession();
		Integer nV = (Integer) session.getAttribute("sk");
		if (nV == null) {
			nV = 0;
		}
		String noVe = "rec_no" + nV;
		int nn = nV + 1;
		int count = 0;
		for (int i = 0; i < nn; i++) {
			if (session.getAttribute("rec_no" + i) != null
					&& ((Integer) session.getAttribute("rec_no" + i)).intValue() == rec_no) {
				session.removeAttribute("rec_no" + i);
				count += 1;

			}
		}
		if (nn > 10 && count == 10) {
			for (int i = 0; i < nn; i++) {
				if (session.getAttribute("rec_no" + i) != null
						&& ((Integer) session.getAttribute("rec_no" + i)).intValue() == rec_no) {
					session.removeAttribute("rec_no" + i);
					break;
				}
			}
		}

		session.setAttribute("sk", nn);

		session.setAttribute(noVe, rec_no);
		List<Recipe> testlist = new ArrayList<Recipe>();
		for (int i = 0; i < nn; i++) {
			if (session.getAttribute("rec_no" + i) != null) {
				Recipe rbean = dao.getDataBean((Integer) session.getAttribute("rec_no" + i));
				testlist.add(rbean);
			}
		}
		System.out.println(testlist);
		session.setAttribute("testList", testlist);
		request.setAttribute("mmmbena", bean);
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