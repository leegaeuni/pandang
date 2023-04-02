package com.pandang.app.follow.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class FollowDAO {
	public SqlSession sqlSession;
	
	public FollowDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
