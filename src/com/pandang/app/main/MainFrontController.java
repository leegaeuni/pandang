package com.pandang.app.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.store.StoreUpdateViewCntOkController;

public class MainFrontController extends HttpServlet{
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
		case "/main.main":
			new MainOKController().execute(req, resp);
			break;
		case "/main/likeOk.main":
			new LikeOKController().execute(req, resp);
			break;
		case "/main/mainAjaxPandangOk.main":
			new MainAjaxPandangOKController().execute(req,resp);
			break;
		case "/main/mainAjaxLastestOk.main":
			new MainAjaxLastestOKController().execute(req, resp);
			break;
		case "/main/mainAjaxFollowOk.main":
				new MainAjaxFollowOKController().execute(req, resp);
				break;
		case "/main/mainFollowOk.main":
			new MainFollowOKController().execute(req, resp);
			break;
		}
	}
}
