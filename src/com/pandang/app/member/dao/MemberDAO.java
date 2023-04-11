package com.pandang.app.member.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.member.dto.MemberDTO;
import com.pandang.app.member.vo.MemberVO;

public class MemberDAO {
	public SqlSession sqlSession;

	public MemberDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	public void join(MemberDTO memberDTO) {
		sqlSession.insert("member.join", memberDTO);
	}

<<<<<<< HEAD
	  public String getMemberNickname(int memberNumber) {
		  return sqlSession.selectOne("member.getMemberNickname", memberNumber);
	 }
=======
	// DB에서 myPage 값 받아오기
	public MemberVO myPageSelectAll(int memberNumber) {
		// MemberVO타입 myPageSelectAll이 메소드 이름 int memberNumber을 받음
		return sqlSession.selectOne("member.myPageSelectAll", memberNumber);
		// MemberMapper의 member이 namespace 이름 이고 myPageSelectAll이 id 이름임
		// 반환타입이 parameterType="_int"이므로 memberNumber로 반환을 받음
	}

	// myPage 수정한 값 DB에 보내기
	public void mypageEdit(MemberVO memberVO) {
		sqlSession.update("member.mypageEdit", memberVO);
	}

	// MyPageEditOkController에서 memberNumber를 사용해 DAO접근을 위해 사용
	public int getSequence() {
		return sqlSession.selectOne("member.getSequence");
	}
>>>>>>> 507ce7a6a4a062cb1b1d2e9b88c40148106eb806
	
	public boolean checkId(String memberId) {
		return (Integer)sqlSession.selectOne("member.checkId", memberId) < 1;
	}
	
	public boolean checkNickname(String memberNickname) {
		return (Integer)sqlSession.selectOne("member.checkNickname", memberNickname) < 1;
	}
	
	public int login(MemberDTO memberDTO) {
		Integer memberNumber = sqlSession.selectOne("member.login", memberDTO);
		return memberNumber == null ? -1 : memberNumber;
	}
	
}
