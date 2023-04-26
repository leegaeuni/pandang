package com.pandang.app.store;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
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

		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";
		int fileSize = 1024 * 1024 * 10;

		MultipartRequest multipartRequest = new MultipartRequest(req, uploadPath, fileSize, "utf-8", new DefaultFileRenamePolicy());
	      
	      storeDTO.setStoreTitle(multipartRequest.getParameter("storeTitle"));
	      storeDTO.setStoreContent(multipartRequest.getParameter("storeContent"));
	      storeDTO.setStorePrice(Integer.parseInt(multipartRequest.getParameter("storePrice")));
	      storeDTO.setHashtagNumber(Integer.parseInt(multipartRequest.getParameter("hashtagNumber")));
	      storeDTO.setMemberNumber((Integer)req.getSession().getAttribute("memberNumber"));
	      
	      storeDAO.storeWrite(storeDTO);
	      storeNumber = storeDAO.getSequence();
	      
	      
//	      getFileNames는 input태그의 name속성을 의미한다.
//	      Enumeration은 이터레이터와 비슷하다고 생각하면 된다.
//	      이터레이터가 나오기 이전에 사용되던 인터페이스이다.
	      Enumeration<String> fileNames = multipartRequest.getFileNames();
	      
//	      이터레이터의 hasNext()
	      while(fileNames.hasMoreElements()) {
//	         이터레이터의 next()
	         String name = fileNames.nextElement();
	         
	         String fileSystemName = multipartRequest.getFilesystemName(name);
	         String fileOriginalName = multipartRequest.getOriginalFileName(name);
	         
	         if(fileSystemName == null) {continue;}
	         
	         storefileDTO.setStoreFileSystemName(fileSystemName);
	         storefileDTO.setStoreFileOriginalName(fileOriginalName);
	         storefileDTO.setStoreNumber(storeNumber);
	         
	         storefileDAO.storeWrite(storefileDTO);;
	      }
	      

		resp.sendRedirect("/store/storeOk.st");
	}

}
