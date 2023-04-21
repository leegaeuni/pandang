package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.dto.SnsDTO;
import com.pandang.app.sns.vo.SnsStoreVO;

public class SnsStoreLikeOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SnsStoreVO snsStoreVO = new SnsStoreVO();
		SnsDAO snsDAO = new SnsDAO();
		
		snsStoreVO.setMemberNumber(Integer.parseInt(req.getParameter("memberNumber")));
		snsStoreVO.setStoreNumber(Integer.parseInt(req.getParameter("storeNumber")));

		snsDAO.updateStoreLikeCnt(snsStoreVO);
	}

}
