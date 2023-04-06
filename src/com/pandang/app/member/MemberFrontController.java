package com.pandang.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet{
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
		System.out.println(target);
		switch(target) {

		case "/member/join.me":
			req.getRequestDispatcher("/app/member/join.jsp").forward(req, resp);
			break;
		case "/member/joinOk.me":
			new JoinOkController().execute(req, resp);
			break;
		case "/member/checkIdOk.me":
			new CheckIdOkController().execute(req, resp);
			break;
		case "/member/checkNicknameOk.me":
			new CheckNicknameOkController().execute(req, resp);
			break;
		case "/member/login.me":
			req.getRequestDispatcher("/app/member/login.jsp").forward(req, resp);
			break;
		case "/member/loginOk.me":
			new LoginOkController().execute(req, resp);
			break;

		case "/member/mypageOk.me":
//			req.getRequestDispatcher("/app/mypage/myPage.jsp").forward(req, resp);
			new MyPageOkController().execute(req, resp);
		break;
		
		case "/member/mypageEditOk.me":
			new MyPageEditOkController().execute(req, resp);
		break;

		}
	}
}
