package com.pandang.app.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.dto.MemberDTO;

// DAO에 존재하는 메소드 중 로직구현에 필요한 메소드를 가져와서 사용한다.
public class ChangePwOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("ChangePwOkController 실행.");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		// POST방식으로 받았을 때 사용.
		req.setCharacterEncoding("utf-8");

		String memberPassword = req.getParameter("memberPassword");
//		System.out.println(memberPassword);
//		System.out.println(req.getParameter("memberAnswer"));
//		System.out.println(req.getParameter("memberAsk"));
//		 요청받은 정보들을 가져온다.
//		String memberAsk = req.getParameter("memberAsk");
//		String memberAnswer = req.getParameter("memberAnswer");
//		resp.setContentType("text/html; charset=utf-8");

		memberDTO.setMemberAsk(req.getParameter("memberAsk"));
		memberDTO.setMemberAnswer(req.getParameter("memberAnswer"));
		memberDTO.setMemberPassword(req.getParameter("memberPassword"));
//		memberDTO.setMemberId((req.getParameter("memberId")));

//		int memberNumber = memberDTO(memberNumber);
		// memberDTO에 있는 memberNumber를 가져온다.
//		memberDTO.setMemberNumber(memberDTO.getMemberNumber());
//		memberNumber = memberDTO.getMemberNumber();
		memberDAO.changePw(memberDTO);

//		System.out.println(memberPassword);

		resp.sendRedirect("/member/login.me");

//		MyPageOkController에서 req.getRequestDispatcher("/app/mypage/myPage.jsp").forward(req, resp); 지우면
//		ChangeOkController 실행됨. 안지우면 '응답이 이미 커밋된 후에는 forward할 수 없습니다.' 에러 발생.

//		  PrintWriter out = resp.getWriter();
//		  out.print(memberDAO.changePw(memberPassword));
//		  out.close();
	}
}
