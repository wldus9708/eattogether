package com.eattogether.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SuperController {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
