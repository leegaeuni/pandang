package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.report.sns.dao.ReportSnsDAO;
import com.pandang.app.report.sns.dto.ReportSnsDTO;
import com.pandang.app.report.store.dao.ReportStoreDAO;
import com.pandang.app.report.store.dto.ReportStoreDTO;
import com.pandang.app.sns.dao.SnsDAO;

public class StoreReportController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		SnsDAO snsDAO = new SnsDAO();
		ReportStoreDAO reportStoreDAO = new ReportStoreDAO();
		ReportStoreDTO reportStoreDTO = new ReportStoreDTO();
		
		reportStoreDTO.setReportContent(req.getParameter("reportContent"));
		reportStoreDTO.setReportMemberNumber((Integer)session.getAttribute("memberNumber"));
		reportStoreDTO.setReportTitle(req.getParameter("reportTitle"));
		reportStoreDTO.setReportStoreNumber(Integer.parseInt(req.getParameter("reportNumber")));
		
		snsDAO.reportStorePost(reportStoreDTO);
		
		 req.setAttribute("reportStore", reportStoreDTO);
	}

}
