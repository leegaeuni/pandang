package com.pandang.app.sns.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.comment.dto.SnsCommentDTO;
import com.pandang.app.sns.dao.SnsDAO;

public class SnsCommentUpdateOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		SnsDAO snsDAO = new SnsDAO();
		SnsCommentDTO snsCommentDTO = new SnsCommentDTO();
		
		snsCommentDTO.setSnsCommentContent(req.getParameter("snsCommentContent"));
		snsCommentDTO.setSnsCommentNumber(Integer.parseInt(req.getParameter("snsCommentNumber")));
		
		snsDAO.snsCommentUpdate(snsCommentDTO);
		
		

	}

}
