package com.pandang.app.store.comment.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class StoreCommentDAO {
	public SqlSession sqlSession;
	
	public StoreCommentDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
