package com.pandang.app.store.like.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class StoreLikeDAO {
	public SqlSession sqlSession;
	
	public StoreLikeDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
