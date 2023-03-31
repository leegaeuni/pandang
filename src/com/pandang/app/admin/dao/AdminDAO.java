package com.pandang.app.admin.dao;

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
}
