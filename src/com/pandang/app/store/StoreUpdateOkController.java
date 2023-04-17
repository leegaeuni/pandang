//package com.pandang.app.store;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.oreilly.servlet.multipart.FilePart;
//import com.oreilly.servlet.multipart.MultipartParser;
//import com.oreilly.servlet.multipart.ParamPart;
//import com.oreilly.servlet.multipart.Part;
//import com.pandang.app.Execute;
//import com.pandang.app.store.dao.StoreDAO;
//import com.pandang.app.store.dto.StoreDTO;
//import com.pandang.app.store.file.dao.StoreFileDAO;
//import com.pandang.app.store.file.dto.StoreFileDTO;
//
//public class StoreUpdateOkController implements Execute {
//
//	@Override
//	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		StoreDAO storeDAO = new StoreDAO();
//		StoreDTO storeDTO = new StoreDTO();
//		StoreFileDAO storeFileDAO = new StoreFileDAO();
//		StoreFileDTO storeFileDTO = new StoreFileDTO();
//		int storeNumber = 0;
//
//		System.out.println("컨트롤러 입력 정상.");
//		System.out.println(req.getParameter("storeTitle"));
//
//		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";
//		int fileSize = 1024 * 1024 * 5;
//		System.out.println(uploadPath);
//
//		MultipartParser parser = new MultipartParser(req, fileSize);
//		parser.setEncoding("utf-8");
//
//		while (true) {
//			Part part = parser.readNextPart();
//
//			if (part == null) {
//				break;
//			}
//			String fileSystemName = null;
//			String fileOriginalName = null;
//
//			if (part.isFile()) {
//				FilePart filePart = (FilePart) part;
//
//				filePart.setRenamePolicy(new DefaultFileRenamePolicy());
//				fileOriginalName = filePart.getFileName();
//
//				if (fileOriginalName != null) {
//					File file = new File(uploadPath, fileOriginalName);
//					filePart.writeTo(file);
//					fileSystemName = filePart.getFileName();
//
//					storeFileDTO.setStoreFileSystemName(fileSystemName);
//					storeFileDTO.setStoreFileOriginalName(fileOriginalName);
//					storeFileDTO.setStoreNumber(storeNumber);
//
//					storeFileDAO.insert(storeFileDTO);
//				}
//
//			} else {
//				ParamPart paramPart = (ParamPart) part;
//				String paramName = paramPart.getName();
//				String paramValue = paramPart.getStringValue();
//
//				if (paramName.equals("storeTitle")) {
//					storeDTO.setStoreTitle(paramValue);
//				} else if (paramName.equals("storeContent")) {
//					storeDTO.setStoreContent(paramValue);
//				} else if (paramName.equals("storeNumber")) {
//					storeNumber = Integer.parseInt(paramValue);
//					storeDTO.setStoreNumber(storeNumber);
//				}
//
//				if (storeDTO.getStoreTitle() == null || storeDTO.getStoreContent() == null) {
//					continue;
//				}
//
//				storeDTO.setMemberNumber((Integer) req.getSession().getAttribute("memberNumber"));
//				storeDAO.update(storeDTO);
//
//				List<StoreFileDTO> files = storeFileDAO.select(storeNumber);
//
//				files.stream().map(file -> file.getStoreFileSystemName()).map(name -> new File(uploadPath, name))
//						.filter(tmp -> tmp.exists()).forEach(tmp -> tmp.delete());
//
//				storeFileDAO.delete(storeNumber);
//
//			}
//		}
//
//		resp.sendRedirect("/store/storeOk.st");
//	}
//
//}