package com.pandang.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.channel.dao.ChannelDAO;
import com.pandang.app.channel.dto.ChannelDTO;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.dto.MemberDTO;

public class JoinOkController implements Execute {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		ChannelDAO channelDAO = new ChannelDAO();
		ChannelDTO channelDTO = new ChannelDTO();

		String memberBirth = null;
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
		req.setCharacterEncoding("utf-8");
		memberBirth = req.getParameter("memberBirthYear") + '.' + req.getParameter("memberBirthMonth") + '.'
				+ req.getParameter("memberBirthDay");

		memberDTO.setMemberId(req.getParameter("memberId"));
		memberDTO.setMemberPassword(req.getParameter("memberPassword"));
		memberDTO.setMemberName(req.getParameter("memberName"));
		memberDTO.setMemberNickname(req.getParameter("memberNickname"));
		memberDTO.setMemberBirth(memberBirth);
		memberDTO.setMemberGender(req.getParameter("memberGender"));
		memberDTO.setMemberPhoneNumber(req.getParameter("memberPhoneNumber"));
		memberDTO.setMemberEmail(req.getParameter("memberEmail"));
		memberDTO.setMemberAsk(req.getParameter("memberAsk"));
		memberDTO.setMemberAnswer(req.getParameter("memberAnswer"));
		memberDTO.setMemberAddress(req.getParameter("memberAddress"));
		memberDTO.setMemberAddressDetail(req.getParameter("memberAddressDetail"));
		memberDTO.setMemberZoneCode(req.getParameter("memberZoneCode"));

		memberDAO.join(memberDTO);
//		방금전 insert된 pk(memberNumber)를 가져오고 가입할떄 사용한 memberNickname과 memberNumber를 DTO넣어놓고
//		넣은 값을 ChannelDTO에 꽂아줘야한다. 
//		채널 DB에 memberNickname과 memberNumber(채널DB에 fk)를 넣어줘야한다.
//		회원가입 하자마자 채널명이 memberNickname으로 들어가야하니까 

//		ChannelDTO.channelDTO = new ChannelDTO();
//		channelDTO.setChannelName(req.getParameter("memberNickname"));
//		channelDTO.setMemberNumber(memberDAO.last());
//		
//		channelDAO.join(channelDTO);
		channelDTO.setChannelName(req.getParameter("memberNickname"));
		channelDTO.setMemberNumber(memberDAO.getMemberNumber());

		channelDAO.joinChannel(channelDTO);

		resp.sendRedirect("/member/login.me");
	}
}
