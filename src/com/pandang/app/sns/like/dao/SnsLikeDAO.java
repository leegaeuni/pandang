package com.pandang.app.sns.like.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class SnsLikeDAO {
	public SqlSession sqlSession;
	
	public SnsLikeDAO() {
		sqlSession= MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
