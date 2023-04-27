package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.member.dao.MemberDAO;

public class StoreWriteController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		HttpSession session = req.getSession();
		Integer memberNumber = (Integer) session.getAttribute("memberNumber");
		req.setCharacterEncoding("utf-8");
		String path = null;

		if (memberNumber == null) {
			path = "/app/member/login.jsp";
		} else {
			path = "/app/store/storeWrite.jsp";
			req.setAttribute("memberId", memberDAO.getMemberNickname(memberNumber));
		}
		
		if(req.getParameter("storeTitle") != null) {
			req.setAttribute("storeTitle", req.getParameter("storeTitle"));
			req.setAttribute("storeContent", req.getParameter("storeContent"));
			req.setAttribute("storeNumber", Integer.parseInt(req.getParameter("storeNumber")));
			req.setAttribute("storePrice", Integer.parseInt(req.getParameter("storePrice")));
			req.setAttribute("hashtagName", req.getParameter("hashtagName"));
			req.setAttribute("hashtagNumber", Integer.parseInt(req.getParameter("hashtagNumber")));
			}
		
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
