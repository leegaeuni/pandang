package com.pandang.app.store;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.file.dao.StoreFileDAO;
import com.pandang.app.store.file.dto.StoreFileDTO;

public class StoreUpdateOkController implements Execute {

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

		storeNumber =  Integer.parseInt(multipartRequest.getParameter("storeNumber"));

		
	      storeDTO.setStoreTitle(multipartRequest.getParameter("storeTitle"));
	      storeDTO.setStoreContent(multipartRequest.getParameter("storeContent"));
	      storeDTO.setStorePrice(Integer.parseInt(multipartRequest.getParameter("storePrice")));
	      storeDTO.setHashtagNumber(Integer.parseInt(multipartRequest.getParameter("hashtagNumber")));
	      storeDTO.setMemberNumber((Integer)req.getSession().getAttribute("memberNumber"));
	      storeDTO.setStoreNumber(storeNumber);
	      
	      storeDAO.updateStore(storeDTO);

	      storeDAO.updatePost(storeDTO);

	      storeDAO.storeWrite(storeDTO);
	      
	 
	      Enumeration<String> fileNames = multipartRequest.getFileNames();
	      
	      storefileDAO.delete(storeNumber);
	      
	      while(fileNames.hasMoreElements()) {

	         String name = fileNames.nextElement();
	         
	         String fileSystemName = multipartRequest.getFilesystemName(name);
	         String fileOriginalName = multipartRequest.getOriginalFileName(name);
	         
	         if(fileSystemName == null) {continue;}
	         
	         storefileDTO.setStoreFileSystemName(fileSystemName);
	         storefileDTO.setStoreFileOriginalName(fileOriginalName);
	         storefileDTO.setStoreNumber(storeNumber);
	         
	         storefileDAO.storeWrite(storefileDTO);
	         
	         List<StoreFileDTO> files = storefileDAO.selectAll(storeNumber);
	          
	          files.stream().map(file -> file.getStoreFileSystemName())
	          .map(fileName -> new File(uploadPath, name))
	          .filter(tmp -> tmp.exists())
	          .forEach(tmp -> tmp.delete());
	          
	          storefileDAO.delete(storeNumber);
	      }
      

		resp.sendRedirect("/sns/snsOk.sn");
	}

}
