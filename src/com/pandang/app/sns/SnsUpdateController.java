package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;

public class SnsUpdateController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getParameter("snsTitle");
		req.getParameter("snsContent");
		
		req.setAttribute("snsTitle", req.getParameter("snsTitle"));
		
		req.getRequestDispatcher("/app/sns/snsWrite.jsp").forward(req, resp);

	}

}
