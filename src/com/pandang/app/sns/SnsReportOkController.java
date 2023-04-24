package com.pandang.app.sns;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.report.sns.dao.ReportSnsDAO;
import com.pandang.app.report.sns.dto.ReportSnsDTO;
import com.pandang.app.sns.dao.SnsDAO;

public class SnsReportOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		SnsDAO snsDAO = new SnsDAO();
		ReportSnsDAO reportSnsDAO = new ReportSnsDAO();
		ReportSnsDTO reportSnsDTO = new ReportSnsDTO();
		
		reportSnsDTO.setReportContent(req.getParameter("reportContent"));
		reportSnsDTO.setReportMemberNumber((Integer)session.getAttribute("memberNumber"));
		reportSnsDTO.setReportTitle(req.getParameter("reportTitle"));
		reportSnsDTO.setReportSnsNumber(Integer.parseInt(req.getParameter("reportNumber")));
		
		System.out.println(reportSnsDTO.toString());
		
		snsDAO.reportPost(reportSnsDTO);
		
		 req.setAttribute("reportSns", reportSnsDTO);
		    
			
		req.getRequestDispatcher("/app/sns/mySns.jsp").forward(req, resp);

		
		
	}

}
