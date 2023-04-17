package com.pandang.app.store.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.comment.dao.StoreCommentDAO;
import com.pandang.app.store.comment.dto.StoreCommentDTO;

public class StoreCommentWriteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreCommentDTO storeCommentDTO = new StoreCommentDTO();
		System.out.println("정상 작동 중");
		req.setCharacterEncoding("UTF-8");
		
		storeCommentDTO.setStoreNumber(Integer.valueOf(req.getParameter("storeNumber")));
		storeCommentDTO.setMemberNumber(Integer.valueOf(req.getParameter("memberNumber")));
		storeCommentDTO.setStoreCommentContent(req.getParameter("storeCommentContent"));
		
		new StoreCommentDAO().insert(storeCommentDTO);
	}

}
