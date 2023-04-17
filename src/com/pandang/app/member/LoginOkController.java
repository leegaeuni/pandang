package com.pandang.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.dto.MemberDTO;

public class LoginOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		int memberNumber = 0;
		String remember = req.getParameter("loginKeep");
		
		String memberId = req.getParameter("memberId");
		String memberPassword = req.getParameter("memberPassword");
		String path = null;
		HttpSession session = req.getSession();
		
		memberDTO.setMemberId(memberId);
		memberDTO.setMemberPassword(memberPassword);
		
//		System.out.println(memberId);
		memberNumber = memberDAO.login(memberDTO);
	      
		
		if(memberNumber == -1) {
			path = "/member/login.me";
		} else {
//			로그인하면 어떤 경로로 갈건지 적어주세요.
			path = "/main";
			session.setAttribute("memberNumber", memberNumber);
		}
		
		
		if(remember != null) {
			Cookie cookie = new Cookie("memberId", memberId);
			cookie.setMaxAge(60 * 60 * 24);
			resp.addCookie(cookie);
		}
//		String showId = memberDTO.getMemberId();
//		req.setAttribute("memberId", showId);
		
		
		resp.sendRedirect(path);
	}
}
