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
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.vo.SnsPostVO;

public class SnsReadOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
		
//		session.setAttribute("snsNumber", 1);
		
		SnsDAO snsDAO = new SnsDAO();
		
		 Map<String, Integer> pageMap = new HashMap<>();
	      
	     
	      
	      System.out.println(pageMap.toString());
	      
	      List<SnsPostVO> snsPost = snsDAO.showSnsPost(pageMap);
	     
	      Gson gson = new Gson();
	     
	      
	      JsonArray showPost = new JsonArray();
	      
	    
	      
	      snsPost.stream()
	      .map(gson::toJson)
	      .map(JsonParser::parseString)
	      .forEach(showPost::add);
	      
	     
	      JsonObject result = new JsonObject();
	      
	      int snsPostNumber = 1;
	      
	      result.add("list", JsonParser.parseString(showPost.toString()));
	      result.addProperty("snsPostNumber", snsPostNumber);
	     
	      System.out.println(result);
	      System.out.println(showPost);
	      
	      resp.setContentType("application/json; charSet=utf-8");
	      
	      PrintWriter out = resp.getWriter();
	      out.print(result.toString());
	      out.close();
	      

	}

}
