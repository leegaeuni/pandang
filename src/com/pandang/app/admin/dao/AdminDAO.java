package com.pandang.app.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.member.dto.MemberDTO;

public class AdminDAO {
	public SqlSession sqlSession;
	
	public AdminDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public int login(MemberDTO memberDTO) {
		return sqlSession.selectOne("member.adminLogin", memberDTO);
	}
	
	public List<MemberDTO> getAllMember(Map<String, Integer> pageMap) {
		return sqlSession.selectList("member.adminAllMember", pageMap);
	}
	
	public int getTotal() {
		return sqlSession.selectOne("member.adminGetTotal");
	}
	
	public void banMember(int memberNumber) {
		sqlSession.update("member.adminBanMember", memberNumber);
	}
	
	public void restoreMember(int memberNumber) {
		sqlSession.update("member.adminRestoreMember", memberNumber);
	}
	
	public MemberDTO findMember(String memberId) {
		return sqlSession.selectOne("member.adminFindMember", memberId);
	}
	
	public int findGetTotal() {
		return sqlSession.selectOne("member.adminFindGetTotal");
	}
	
}
