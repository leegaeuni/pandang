package com.pandang.app.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.dto.MemberDTO;

public class FindIdOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("---------------------------------------");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		Map<String, String> map = new HashMap();

		String memberName = req.getParameter("memberName");
		String memberBirth = "";
		String memberPhoneNumber = req.getParameter("memberPhoneNumber");

//		System.out.println(memberName);
//		System.out.println(memberPhoneNumber);
		req.getParameter("memberBirth");
		for (int i = 0; i < req.getParameter("memberBirth").length(); i++) {
			if (i == 4 || i == 6) {
				memberBirth += '-';
			}
			memberBirth += req.getParameter("memberBirth").charAt(i);
		}
		;

		map.put("memberName", memberName);
		map.put("memberBirth", memberBirth);
		map.put("memberPhoneNumber", memberPhoneNumber);
//		System.out.println(map);

		resp.setContentType("text/html; charset=utf-8");

		PrintWriter out = resp.getWriter();
		out.print(memberDAO.findId(map));
		out.close();

	}
}
