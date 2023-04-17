package com.pandang.app.channel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.channel.dao.ChannelDAO;
import com.pandang.app.channel.dto.ChannelDTO;
import com.pandang.app.member.dao.MemberDAO;

public class joinChannelController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ChannelDTO channelDTO = new ChannelDTO();
		ChannelDAO channelDAO = new ChannelDAO();
		MemberDAO memberDAO = new MemberDAO();
		
		channelDTO.setChannelName(req.getParameter("memberNickname"));
		channelDTO.setMemberNumber(memberDAO.getMemberNumber());
		
		channelDAO.joinChannel(channelDTO);
		
		
	}

}
