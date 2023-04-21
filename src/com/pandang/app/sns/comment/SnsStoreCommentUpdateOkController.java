package com.pandang.app.sns.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.comment.dto.SnsCommentDTO;
import com.pandang.app.sns.comment.vo.SnsStoreCommentVO;
import com.pandang.app.sns.dao.SnsDAO;

public class SnsStoreCommentUpdateOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SnsDAO snsDAO = new SnsDAO();
		SnsStoreCommentVO snsStoreCommentVO = new SnsStoreCommentVO();
		
		snsStoreCommentVO.setStoreCommentContent(req.getParameter("storeCommentContent"));
		snsStoreCommentVO.setStoreCommentNumber(Integer.parseInt(req.getParameter("storeCommentNumber")));
		
		snsDAO.snsStoreCommentUpdate(snsStoreCommentVO);
	}

}
