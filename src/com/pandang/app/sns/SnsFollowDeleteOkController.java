package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.vo.SnsFollowVO;

public class SnsFollowDeleteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
		
		SnsFollowVO snsFollowVO = new SnsFollowVO();
		
		snsFollowVO.setMemberNumberFrom((Integer)session.getAttribute("memberNumber"));
		snsFollowVO.setMemberNumberTo(Integer.parseInt(req.getParameter("memberNumberTo")));
		
		new SnsDAO().deleteSnsFollow(snsFollowVO);
	}

}
