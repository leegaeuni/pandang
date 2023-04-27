package com.pandang.app.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.main.dao.MainDAO;
import com.pandang.app.main.dto.MainDTO;
import com.pandang.app.main.vo.MainFollowVO;
import com.pandang.app.main.vo.MainFollowingVO;
import com.pandang.app.main.vo.MainLikeViewVO;
import com.pandang.app.main.vo.MainVO;
import com.pandang.app.sns.dao.SnsDAO;

public class MainFollowOKController implements Execute{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MainDAO mainDAO = new MainDAO();
		Gson gson = new Gson();
		int memberNumberTo = Integer.valueOf(req.getParameter("followNumber"));
		int memberNumberFrom = (Integer)req.getSession().getAttribute("memberNumber");
		MainFollowingVO mainFollowingVO = new MainFollowingVO();
		
		mainFollowingVO.setMemberNumberTo(memberNumberTo);
		mainFollowingVO.setMemberNumberFrom(memberNumberFrom);
		
		
		int result = mainDAO.selectFollowing(mainFollowingVO);
		String outResult = null; 
		if(result == 0) {
			mainDAO.insertFollow(mainFollowingVO);
			outResult = "insert";
		}else {
			mainDAO.deleteFollow(mainFollowingVO);
			outResult = "delete";
		}
		
		
		
		
		
		
		
		resp.setContentType("text/html; utf-8");
		PrintWriter out = resp.getWriter();
		
		out.print(outResult);
		out.close();
	}
}