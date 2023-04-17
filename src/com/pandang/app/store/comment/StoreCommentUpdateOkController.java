package com.pandang.app.store.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.comment.dao.StoreCommentDAO;
import com.pandang.app.store.comment.dto.StoreCommentDTO;

public class StoreCommentUpdateOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreCommentDTO storeCommentDTO = new StoreCommentDTO();
		storeCommentDTO.setStoreCommentNumber(Integer.parseInt(req.getParameter("storeCommentNumber")));
		storeCommentDTO.setStoreCommentContent(req.getParameter("storeCommentContent"));
		
		new StoreCommentDAO().update(storeCommentDTO);
	}

}
