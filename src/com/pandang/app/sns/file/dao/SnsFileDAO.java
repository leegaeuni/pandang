package com.pandang.app.sns.file.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class SnsFileDAO {
	public SqlSession sqlSession;
	
	public SnsFileDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
