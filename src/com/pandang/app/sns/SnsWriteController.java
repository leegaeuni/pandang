package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.member.vo.MemberVO;
import com.pandang.app.sns.dao.SnsDAO;

public class SnsWriteController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SnsDAO snsDAO = new SnsDAO();
		MemberVO memberVO = new MemberVO();
		req.setCharacterEncoding("utf-8");
		
		int memberNumber = (Integer)(req.getSession().getAttribute("memberNumber"));
		memberVO = snsDAO.getSnsWriter(memberNumber);
		req.setAttribute("channelName", memberVO.getChannelName());
		req.setAttribute("channelFileSystemName", memberVO.getChannelFileSystemName());
		
		if(req.getParameter("snsTitle") != null) {
		req.setAttribute("snsTitle", req.getParameter("snsTitle"));
		req.setAttribute("snsContent", req.getParameter("snsContent"));
		req.setAttribute("snsNumber", Integer.parseInt(req.getParameter("snsNumber")));
		}
		
		req.getRequestDispatcher("/app/sns/snsWrite.jsp").forward(req, resp);
		
	}

}
