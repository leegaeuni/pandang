package com.pandang.app.store.like;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pandang.app.Execute;
import com.pandang.app.store.like.dao.StoreLikeDAO;
import com.pandang.app.store.like.dto.StoreLikeDTO;

public class StoreLikeOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreLikeDAO storeLikeDAO = new StoreLikeDAO();
		Gson gson = new Gson();
		int memberNumber = 1;
		int storeNumber = Integer.valueOf(req.getParameter("storeNumber"));
		StoreLikeDTO storeLikeDTO = new StoreLikeDTO();
		int result = 0;
		
		storeLikeDTO.setMemberNumber(memberNumber);
		storeLikeDTO.setStoreNumber(storeNumber);
		
		result = storeLikeDAO.select(storeLikeDTO);
		
		if(result == 0) {
			storeLikeDAO.insert(storeLikeDTO);
		}else {
			storeLikeDAO.delete(storeLikeDTO);
		}
		
		resp.setContentType("text/html; utf-8");
		int likeCount = storeLikeDAO.selectLikeCount(storeNumber);
		
		PrintWriter out = resp.getWriter();
		out.print(likeCount);
		out.close();
	}

}