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
	
}
