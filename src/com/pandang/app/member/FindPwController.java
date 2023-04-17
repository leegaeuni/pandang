package com.pandang.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;

public class FindPwController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("memberId", req.getParameter("memberId"));
		req.getRequestDispatcher("/app/member/findPw.jsp").forward(req, resp);
	}

}
