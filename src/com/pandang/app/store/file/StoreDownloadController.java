package com.pandang.app.store.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;

public class StoreDownloadController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String storeFileSystemName = req.getParameter("storeFileSystemName");
		String storeFileOriginalName = req.getParameter("storeFileOriginalName");
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";

		InputStream in = null;
		OutputStream out = null;

		File file = new File(uploadPath, storeFileSystemName);

		byte[] buffer = new byte[1024];

		resp.setContentType("application/octet-steram");
		resp.setHeader("Content-Length", file.length() + "");
		resp.setHeader("Content-Disposition", "attachment; filename=" + storeFileOriginalName);

		in = new FileInputStream(file);
		out = resp.getOutputStream();

		int readCnt = 0;

		while ((readCnt = in.read(buffer)) != -1) {
			out.write(buffer, 0, readCnt);
		}		
	}
}