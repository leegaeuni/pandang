package com.pandang.app.sns;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.file.dto.SnsFileDTO;
import com.pandang.app.sns.vo.SnsPostInfoVO;

public class SnsFileReadOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SnsDAO snsDAO = new SnsDAO();
		SnsFileDTO snsFileDTO = new SnsFileDTO();
		List<String> snsFile = snsDAO.snsFile(Integer.parseInt(req.getParameter("snsNumber")));
	     
	      Gson gson = new Gson();
	    
	      JsonArray snsFileList = new JsonArray();
	      
	    
	      resp.setContentType("application/json; charSet=utf-8");
	      
	      
	      PrintWriter out = resp.getWriter();
	      out.print(JsonParser.parseString(gson.toJson(snsFile)));
	      out.close();
		
		
		
	}

}
