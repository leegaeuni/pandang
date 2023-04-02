package com.pandang.app.sns.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class SnsDAO {
	public SqlSession sqlSession;
	
	public SnsDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
