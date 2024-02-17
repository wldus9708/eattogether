package com.eattogether.controller.member;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Recipe;
import com.eattogether.model.dao.RecipeDao;

public class MemberPictureController extends Superclass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		String lik= request.getParameter("likeTaste");
		System.out.println(lik);
		String dlik = request.getParameter("dislikeTaste");
		 String[] likeTaste = lik != null ? lik.split(",") : new String[0];
		 String[] dislikeTaste =dlik != null ? dlik.split(",") : new String[0];
		 System.out.println(Arrays.toString(likeTaste));
		   
		RecipeDao dao= new RecipeDao();
		List<Recipe> datalist=dao.getPicture(likeTaste, dislikeTaste);
		
		request.setAttribute("pictureDatalist", datalist);
		request.setAttribute("pictureCheck", 1);
		super.gotoPage("common/main.jsp");
		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		String lik= request.getParameter("likeTaste");
		System.out.println(lik);
		String dlik = request.getParameter("dislikeTaste");
		 String[] likeTaste = lik != null ? lik.split(",") : new String[0];
		 String[] dislikeTaste =dlik != null ? dlik.split(",") : new String[0];
		 System.out.println(Arrays.toString(likeTaste));
		   
		RecipeDao dao= new RecipeDao();
		List<Recipe> datalist=dao.getPicture(likeTaste, dislikeTaste);
		request.setAttribute("pictureDatalist", datalist);
		request.setAttribute("pictureCheck", 1);
		super.gotoPage("common/main.jsp");
	}

}
