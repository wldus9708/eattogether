package com.eattogether.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.utility.MyUtility;
import com.oreilly.servlet.MultipartRequest;


@WebServlet(urlPatterns = { "/Eat", "/xxx" }, initParams = {
		@WebInitParam(name = "todolist", value = "/WEB-INF/todolist.txt") })

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String todolist = null;
	private Map<String, SuperController> todolistMap = null;
	
	// 실제 이미지가 업로드 되는 웹서버 상의 전체 경로
		private String imageUploadWebPath = null ; 

	@Override
	public void init(ServletConfig config) throws ServletException {
		ServletContext application = config.getServletContext();

		this.todolist = config.getInitParameter("todolist");

	
		this.todolistMap = MyUtility.getTodolistMap(application.getRealPath(todolist));
		System.out.println("todolist Map Size : " + todolistMap.size());
		System.out.println(todolistMap.toString());
		
		String imsiPath = "image";
		this.imageUploadWebPath = application.getRealPath(imsiPath) ;
		System.out.println("이미지 업로드 경로 : \n" + imageUploadWebPath);
	}

	protected void doprocess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		
		String command = request.getParameter("command");
		// 파일 업로드시에는 request 내장 객체에서 직접 파라미터를 챙길수 없습니다.
				// 이유는 폼 태그의 enctype="multipart/form-data" 속성 때문입니다.
				// 이미지 관련 항목들을 Sring이 아닌 객체 형태로 다루어야 하기 때문입니다. 
				if(command == null) {
					System.out.println("file upload event invoked");
					
					MultipartRequest mr 
						= MyUtility.getMultipartRequest(request, imageUploadWebPath);
					
					if(mr != null) {
						// 파일 업로드인 경우에는 mr 객체를 이용해야만 파라미터 정보를 읽어올 수 있습니다. 
						command = mr.getParameter("command") ;
						
						if(command.equals("prUpdate")) {
							// 상품 정보 수정시 과거 이미지는 삭제해 주어야 합니다.
							MyUtility.deleteOldImageFile(imageUploadWebPath, mr);
						}
						
						// file upload object binding in request scope.
						request.setAttribute("mr", mr);
						
					}else {
						System.out.println("MultipartRequest object is null");
					}
				}
				

		System.out.println("command is [" + command + "]");

	
		SuperController controller = this.todolistMap.get(command);

		if (controller != null) {
			try {
				String method = request.getMethod().toLowerCase();
				if (method.equals("get")) { // get

					controller.doGet(request, response);
					System.out.println(controller.getClass() + " get 메소드 호출됨");
				} else { // post
					controller.doPost(request, response);
					System.out.println(controller.getClass() + " post 메소드 호출됨");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			System.out.println("request command is not found");
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doprocess(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doprocess(request, response);
	}
}
