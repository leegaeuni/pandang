package com.pandang.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminFrontController extends HttpServlet{
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
		case "/admin.ad" :
			req.getRequestDispatcher("/app/admin/login.jsp").forward(req, resp);
			break;
		case "/admin/loginOk.ad" : 
			new LoginOkController().execute(req, resp);
			break;
		case "/admin/reportSnsListOk.ad" :
			new ReportSnsListOkController().execute(req, resp);
			break;
		case "/admin/reportSnsAjaxListOk.ad" :
			new ReportSnsListAjaxOkController().execute(req,resp);
			break;
		case "/admin/reportStoreListOk.ad" :
			new ReportStoreListOkController().execute(req, resp);
			break;
		case "/admin/logoutOk.ad" :
			new LogoutOkController().execute(req, resp);
			break;
		case "/admin/memberListOk.ad" :
			new MemberListOkController().execute(req, resp);
			break;
		case "/admin/memberBanOk.ad" :
			new MemberBanOkController().execute(req, resp);
			break;
		case "/admin/memberRestoreOk.ad" :
			new MemberRestoreOkController().execute(req, resp);
			break;
		case "/admin/findMemberOk.ad" :
			new FindMemberOkController().execute(req, resp);
			break;
		case "/admin/findSnsOk.ad" :
			new FindSnsOkController().execute(req, resp);
			break;
		case "/admin/findStoreOk.ad" :
			new FindStoreOkController().execute(req, resp);
			break;
		}
	}
}
