package com.pandang.app.sns;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.dto.SnsDTO;
import com.pandang.app.sns.file.dao.SnsFileDAO;
import com.pandang.app.sns.file.dto.SnsFileDTO;

public class SnsWriteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SnsDTO snsDTO = new SnsDTO();
		SnsDAO snsDAO = new SnsDAO();
		SnsFileDTO snsFileDTO = new SnsFileDTO();
		SnsFileDAO snsFileDAO = new SnsFileDAO();
		
		int snsNumber = 0;
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";
	    int fileSize = 1024 * 1024 * 5; //5MB
//      하나의 input에 하나의 파일만 전달하는 경우 아래 코드를 사용한다.
//      =======================================
      
//      req를 MultipartRequest객체로 만들어서 사용하면 데이터를 정상적으로 가져와
//      쓸 수 있다.
//      객체를 만들 때 여러 옵션을 설정해야한다.
//      생성자 매개변수 : req, 업로드 경로, 최대 크기, 인코딩 방식, 이름 정책
      MultipartRequest multipartRequest = new MultipartRequest(req, uploadPath, fileSize, "utf-8", new DefaultFileRenamePolicy());
      
      snsDTO.setSnsTitle(multipartRequest.getParameter("snsTitle"));
      snsDTO.setSnsContent(multipartRequest.getParameter("snsContent"));
      snsDTO.setMemberNumber((Integer)req.getSession().getAttribute("memberNumber"));
      
      snsDAO.snsWrite(snsDTO);
      snsNumber = snsDAO.getSequence();
      
      
//      getFileNames는 input태그의 name속성을 의미한다.
//      Enumeration은 이터레이터와 비슷하다고 생각하면 된다.
//      이터레이터가 나오기 이전에 사용되던 인터페이스이다.
      Enumeration<String> fileNames = multipartRequest.getFileNames();
      
//      이터레이터의 hasNext()
      while(fileNames.hasMoreElements()) {
//         이터레이터의 next()
         String name = fileNames.nextElement();
         
         String fileSystemName = multipartRequest.getFilesystemName(name);
         String fileOriginalName = multipartRequest.getOriginalFileName(name);
         
         if(fileSystemName == null) {continue;}
         
         snsFileDTO.setSnsFileSystemName(fileSystemName);
         snsFileDTO.setSnsFileOriginalName(fileOriginalName);
         snsFileDTO.setSnsNumber(snsNumber);
         
         snsFileDAO.snsWrite(snsFileDTO);;
      }
      
//      resp.sendRedirect("/board/boardListOk.bo");

		
	}

}
