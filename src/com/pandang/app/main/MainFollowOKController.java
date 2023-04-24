package com.pandang.app.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.main.dao.MainDAO;
import com.pandang.app.main.dto.MainDTO;
import com.pandang.app.main.vo.MainFollowVO;
import com.pandang.app.main.vo.MainLikeViewVO;
import com.pandang.app.main.vo.MainVO;
import com.pandang.app.sns.dao.SnsDAO;

public class MainFollowOKController implements Execute{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MainFollowVO mainFollowVO = new MainFollowVO();

		mainFollowVO.setMemberNumberFrom(Integer.parseInt(req.getParameter("memberNumberFrom")));
		mainFollowVO.setMemberNumberTo(Integer.parseInt(req.getParameter("memberNumberTo")));
		
		new MainDAO().updateFollow(mainFollowVO);
	}
}