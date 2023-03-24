package com.pandang.app.store.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class StoreDAO {
	public SqlSession sqlSession;
	
	public StoreDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
