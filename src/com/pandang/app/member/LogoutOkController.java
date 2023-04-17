package com.pandang.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;

public class LogoutOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("/main");
		
		
//		본인 페이지에 '로그아웃' 버튼이 있으면 경로를
//		"http://localhost:8085/member/logoutOk.me" 로 설정해주세요.
	}
}
