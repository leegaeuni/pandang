package com.pandang.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.dto.MemberDTO;

public class JoinOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
//		private String memberId;
//		private String memberPassword;
//		private String memberName;
//		private String memberNickname;
//		private String memberBirth;
//		private String memberGender;
//		private String memberPhoneNumber;
//		private String memberEmail;
//		private String memberAsk;
//		private String memberAnswer;
//		private String memberAddress;
//		private String memberAddressDetail;
//		
		req.setCharacterEncoding("utf-8");
		
		memberDTO.setMemberId(req.getParameter("memberId"));
		memberDTO.setMemberPassword(req.getParameter("memberPassword"));
		memberDTO.setMemberName(req.getParameter("memberName"));
		memberDTO.setMemberNickname(req.getParameter("memberNickname"));
		memberDTO.setMemberBirth(req.getParameter("memberBirth"));
		memberDTO.setMemberGender(req.getParameter("memberGender"));
		memberDTO.setMemberPhoneNumber(req.getParameter("memberPhoneNumber"));
		memberDTO.setMemberEmail(req.getParameter("memberEmail"));
		memberDTO.setMemberAsk(req.getParameter("memberAsk"));
		memberDTO.setMemberAnswer(req.getParameter("memberAnswer"));
		memberDTO.setMemberAddress(req.getParameter("memberAddress"));
		memberDTO.setMemberAddressDetail(req.getParameter("memberAddressDetail"));
		
		
		memberDAO.join(memberDTO);
		
		resp.sendRedirect("/member/login.me");
	}
}
