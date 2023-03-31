package com.pandang.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.admin.dao.AdminDAO;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.dto.MemberDTO;

public class LoginOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminDAO adminDAO = new AdminDAO();
		MemberDTO memberDTO = new MemberDTO();
		
		int memberNumber = -1;
		String memberId = req.getParameter("memberId");
		String memberPassword = req.getParameter("memberPassword");
		
		String path = null;
		HttpSession session = req.getSession();
		
		memberDTO.setMemberId(memberId);
		memberDTO.setMemberPassword(memberPassword);
		
		try {
			memberNumber = adminDAO.login(memberDTO);
			path = "/admin/reportListOk.ad";
			session.setAttribute("memberNumber", memberNumber);
		} catch (NullPointerException e) {
			path = "/app/admin/login.jsp";
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(path);
	}

}
