package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SnsFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String target = req.getRequestURI().substring(req.getContextPath().length());

		switch(target) {
		case "/sns/snsOk.sn":
//			req.getRequestDispatcher("/app/sns/mySns.jsp").forward(req, resp);
			new SnsOkController().execute(req,resp);
			break;
		
		case "/sns/snsListOk.sn":
			new SnsListOkController().execute(req, resp);
			break;
			
		case "/sns/snsReadOk.sn":
			new SnsReadOkController().execute(req, resp);
			break;
	
		}
	}
}
