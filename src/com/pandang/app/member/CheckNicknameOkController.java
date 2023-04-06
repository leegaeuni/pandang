package com.pandang.app.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.member.dao.MemberDAO;

public class CheckNicknameOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  MemberDAO memberDAO = new MemberDAO();
		  
		  boolean isTrue = memberDAO.checkId(req.getParameter("memberNickname"));
		  resp.setContentType("text/html; charset=utf-8");
		  
		  PrintWriter out = resp.getWriter();
		  
		  out.print(isTrue ? "사용가능한 닉네임입니다." : "중복된 닉네임이 존재합니다.");
		  out.close();
	}
}
