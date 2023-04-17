package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.dto.SnsDTO;

public class SnsLikeOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		SnsDTO snsDTO = new SnsDTO();
		SnsDAO snsDAO = new SnsDAO();
		
		snsDTO.setMemberNumber(Integer.parseInt(req.getParameter("memberNumber")));
		snsDTO.setSnsNumber(Integer.parseInt(req.getParameter("snsNumber")));

		snsDAO.updateSnsLikeCnt(snsDTO);
		
		
	}

}
