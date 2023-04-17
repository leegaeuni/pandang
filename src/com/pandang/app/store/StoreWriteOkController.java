package com.pandang.app.store;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.file.dao.StoreFileDAO;
import com.pandang.app.store.file.dto.StoreFileDTO;

public class StoreWriteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();
		StoreDTO storeDTO = new StoreDTO();
		StoreFileDAO storefileDAO = new StoreFileDAO();
		StoreFileDTO storefileDTO = new StoreFileDTO();
		int storeNumber = 0;

		System.out.println("컨트롤러 입력 정상.");
		System.out.println(req.getParameter("storeTitle"));

		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";
		int fileSize = 1024 * 1024 * 10;
		System.out.println(uploadPath);

		MultipartParser parser = new MultipartParser(req, fileSize);
		parser.setEncoding("utf-8");

		while (true) {
			Part part = parser.readNextPart();

			if (part == null) {
				break;
			}
			String fileSystemName = null;
			String fileOriginalName = null;

			if (part.isFile()) {
				FilePart filePart = (FilePart) part;

				filePart.setRenamePolicy(new DefaultFileRenamePolicy());
				fileOriginalName = filePart.getFileName();

				if (fileOriginalName != null) {

					File file = new File(uploadPath, fileOriginalName);

					filePart.writeTo(file);

					fileSystemName = filePart.getFileName();

					storefileDTO.setStoreFileSystemName(fileSystemName);
					storefileDTO.setStoreFileOriginalName(fileOriginalName);
					storefileDTO.setStoreNumber(storeNumber);

					storefileDAO.insert(storefileDTO);
				}

			} else {

				ParamPart paramPart = (ParamPart) part;
				String paramName = paramPart.getName();
				String paramValue = paramPart.getStringValue();

				if (paramName.equals("storeTitle")) {
					storeDTO.setStoreTitle(paramValue);
				} else if (paramName.equals("storeContent")) {
					storeDTO.setStoreContent(paramValue);
				}

				if (storeDTO.getStoreTitle() == null || storeDTO.getStoreContent() == null) {
					continue;
				}

				storeDTO.setMemberNumber((Integer) req.getSession().getAttribute("memberNumber"));
				storeDAO.insert(storeDTO);

				storeNumber = storeDAO.getSequence();
			}
		}

		resp.sendRedirect("/store/storeOk.st");
	}

}
