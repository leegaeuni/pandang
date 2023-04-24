package com.pandang.app.sns;

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
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.report.sns.dao.ReportSnsDAO;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.vo.SnsPostVO;

public class SnsReadOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
		
		
		
		
			SnsDAO snsDAO = new SnsDAO();
			SnsPostVO snsPostVO = new SnsPostVO();
			ReportSnsDAO reportDAO = new ReportSnsDAO();
			
		 snsDAO.updateSnsViewCnt(Integer.parseInt(req.getParameter("snsNumber")));
	      
	
		
	      
	      snsPostVO = snsDAO.showSnsPost(Integer.parseInt(req.getParameter("snsNumber")));
	     
	      Gson gson = new Gson();
	      Map<String, Integer> map = new HashMap<>();
	      map.put("snsNumber", Integer.parseInt(req.getParameter("snsNumber")));
	      map.put("memberNumber", (Integer)session.getAttribute("memberNumber"));
	      
	      String ifLiked = "";
	      
	      JsonObject liked = new JsonObject();
	      liked.add("list", JsonParser.parseString(gson.toJson(snsPostVO)));
	     
	      
	      gson.toJson(snsPostVO);
	      JsonParser.parseString(gson.toJson(snsPostVO));
	      
	      
	      // 좋아요
	      if(snsDAO.liked(map) != 0) {
	    	   ifLiked = "like";
	      }
	      
	      liked.addProperty("likeTest", ifLiked);
	      liked.addProperty("channelFileSystemName",  reportDAO.profileImg(req.getParameter("memberId")));
	      // 팔로우
	     
	      resp.setContentType("application/json; charSet=utf-8");
	      
	      PrintWriter out = resp.getWriter();
	      out.print(liked.toString());
	      out.close();
	      

	}

}
