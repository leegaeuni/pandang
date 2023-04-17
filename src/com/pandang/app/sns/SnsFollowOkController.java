package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.vo.SnsFollowVO;

public class SnsFollowOkController implements Execute{
@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		SnsFollowVO snsFollowVO = new SnsFollowVO();
		
		snsFollowVO.setMemberNumberFrom(Integer.parseInt(req.getParameter("memberNumberFrom")));
		snsFollowVO.setMemberNumberTo(Integer.parseInt(req.getParameter("memberNumberTo")));
		
		new SnsDAO().updateSnsFollow(snsFollowVO);
		
	
	}
}
