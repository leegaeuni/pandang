package com.pandang.app.member;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pandang.app.Execute;
import com.pandang.app.channel.file.dao.ChannelFileDAO;
import com.pandang.app.channel.file.dto.ChannelFileDTO;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.vo.MemberVO;

public class MyPageEditOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		MemberDAO memberDAO = new MemberDAO();
		MemberVO memberVO = new MemberVO();
		ChannelFileDTO channelFileDTO = new ChannelFileDTO();
		ChannelFileDAO channelFileDAO = new ChannelFileDAO();				
//		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");		
//		int channelNumber = (Integer)req.getSession().getAttribute("channelNumber");		
		
		int memberNumber = 2;		
		int channelNumber = 2;

		System.out.println("++++++++");
		System.out.println(req.getParameter("channelName"));
//		null로 나오는게 맞음
		
		String uploadPath = req.getSession().getServletContext().getRealPath("/")+"upload/";
//		해당 jsp파일 들어가서 img의 path에 /upload/적어줘야 DBMS에 파일이 올라감
		
		System.out.println(uploadPath);
		int fileSize = 1024*1024*10;
		
				
//      req를 MultipartRequest객체로 만들어서 사용하면 데이터를 정상적으로 가져와 쓸 수 있다.
//      객체를 만들 때 여러 옵션을 설정해야한다.
//      생성자 매개변수 : req, 업로드 경로, 최대 크기, 인코딩 방식, 이름 정책
      MultipartRequest multipartRequest = new MultipartRequest(req, uploadPath, fileSize, "utf-8", new DefaultFileRenamePolicy());
      
      memberVO.setChannelName(multipartRequest.getParameter("channelName"));
      memberVO.setChannelComment(multipartRequest.getParameter("channelComment"));
      memberVO.setMemberPassword(multipartRequest.getParameter("memberPassword"));
      memberVO.setMemberNickname(multipartRequest.getParameter("memberNickname"));
      memberVO.setMemberPhoneNumber(multipartRequest.getParameter("memberPhoneNumber"));
      memberVO.setMemberAddress(multipartRequest.getParameter("memberAddress"));
      memberVO.setMemberAddressDetail(multipartRequest.getParameter("memberAddressDetail"));
      memberVO.setMemberZoneCode(multipartRequest.getParameter("memberZoneCode"));
           
      System.out.println(multipartRequest.getParameter("channelComment"));
      
//      memberVO.setMemberNumber((Integer)req.getSession().getAttribute("memberNumber"));
      memberVO.setMemberNumber(2);
      
      memberDAO.mypageEdit(memberVO);    
      

      System.out.println("================");
      System.out.println(memberVO);
      
//      이미지 DB에 넣기
//      getFileNames는 input태그의 name속성을 의미한다.
//      Enumeration은 이터레이터와 비슷하다고 생각하면 된다.
//      이터레이터가 나오기 이전에 사용되던 인터페이스이다.
      
      Enumeration<String> fileNames = multipartRequest.getFileNames();
//      
//      이터레이터의 hasNex()
      while(fileNames.hasMoreElements()) {
//         이터레이터의 next()
         String name = fileNames.nextElement();
         
         String fileSystemName = multipartRequest.getFilesystemName(name);
         String fileOriginalName = multipartRequest.getOriginalFileName(name);
         
         System.out.println(fileSystemName);
         System.out.println(fileOriginalName);
//  	fileSystemName이나 fileOriginalName이 null이면 안 들어왔다는 의미니까 continue해서 다음 반복을 돌림
         if(fileSystemName == null) {continue;}
         
//      channelFileDTO에 담기
         channelFileDTO.setChannelFileOriginalName(fileOriginalName);
         channelFileDTO.setChannelFileSystemName(fileSystemName);
         channelFileDTO.setChannelNumber(channelNumber);
                  
         System.out.println(channelFileDTO);
                
//         null 값인 경우와 null 값이 아닌 경우를 나눠서 insert와 update를 따로 사용해 이미지를 넣어줌
         if(channelFileDAO.select(channelNumber)  != null) {            
//        	 전에 DTO에 있던 파일은 삭제하고 새로 받아오는 channelFileDTO에 넣은 이미지는 update해줌
             ChannelFileDTO channelFileDTO2 = channelFileDAO.select(channelNumber);
             File existFile = new File(uploadPath, channelFileDTO2.getChannelFileSystemName());
             existFile.delete();
             
             channelFileDAO.update(channelFileDTO);
          }else {        	  
        	  channelFileDAO.insert(channelFileDTO);
        }      
      }
		
//		수정된 페이지 다시 보이도록
		resp.sendRedirect("/member/mypageOk.me");
	}
}
