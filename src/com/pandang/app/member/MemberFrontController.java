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
		// 해당 케이스의 url로 요청이 들어오면 기능별 Controller를 실행시킨다.
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
			new LoginController().execute(req, resp);
			break;
		case "/member/loginOk.me":
			new LoginOkController().execute(req, resp);
			break;
		case "/member/logoutOk.me":
			new LogoutOkController().execute(req, resp);
			break;
		case "/member/findId.me":
			req.getRequestDispatcher("/app/member/findId.jsp").forward(req, resp);
			break;
		case "/member/findIdOk.me":
			new FindIdOkController().execute(req, resp);
			break;
		case "/member/findPw.me":
			new FindPwController().execute(req, resp);
			break;
		case "/member/findPwOk.me":
			new FindPwOkController().execute(req, resp);
			break;
		case "/member/findPwAsk.me":
			req.getRequestDispatcher("/app/member/findPwAsk.jsp").forward(req, resp);
			break;
		case "/member/findPwAskOk.me":
			new ChangePwOkController().execute(req, resp);
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
