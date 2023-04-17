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

public class FindPwOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FindPwOkController 실행.");
		req.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		Map<String, String> map = new HashMap();
		
		String memberId = req.getParameter("memberId");
		String memberName = req.getParameter("memberName");
		String memberBirth = "";
		String memberPhoneNumber = req.getParameter("memberPhoneNumber");
		
//		'19990101' 같은 형식으로 받은 생년월일을 '1999-01-01'로 바꿔준다.
//		DB에 들어있는 형식과 같아야한다. '1999.01.01'(X)
		req.getParameter("memberBirth");
		for(int i = 0; i < req.getParameter("memberBirth").length(); i++) {
			if(i == 4 || i == 6) {
				memberBirth += '-';
			}
			memberBirth += req.getParameter("memberBirth").charAt(i);
		};
		
		map.put("memberId", memberId);
		map.put("memberName", memberName);
		map.put("memberBirth", memberBirth);
		map.put("memberPhoneNumber", memberPhoneNumber);
		
		System.out.println(map);
		
		String memberAsk = memberDAO.findPw(map);
		
//		비밀번호 찾기 질문을 가져옴.
		req.setAttribute("memberAsk", memberAsk);
		
		req.getRequestDispatcher("/app/member/findPwAsk.jsp").forward(req, resp);
//		resp.sendRedirect("/member/findPwAsk.me?memberAsk="+memberAsk);
	}
}
