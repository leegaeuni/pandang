package com.pandang.app.store;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.file.dao.StoreFileDAO;
import com.pandang.app.store.file.dto.StoreFileDTO;

public class StoreDeleteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();
		StoreFileDAO storeFileDAO = new StoreFileDAO();

		int storeNumber = Integer.valueOf(req.getParameter("storeNumber"));
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";
		List<StoreFileDTO> files = storeFileDAO.selectAll(storeNumber);
		
		files.stream().map(file -> file.getStoreFileSystemName())
		.map(name -> new File(uploadPath, name))
		.filter(tmp -> tmp.exists())
		.forEach(tmp -> tmp.delete());

		storeFileDAO.delete(storeNumber);
		storeDAO.delete(storeNumber);
		
		System.out.println("삭제 완료");
		
		resp.sendRedirect("/store/storeOk.st");
	}

}