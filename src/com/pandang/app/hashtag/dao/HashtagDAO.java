package com.pandang.app.hashtag.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class HashtagDAO {
	public SqlSession sqlSession;
	
	public HashtagDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
