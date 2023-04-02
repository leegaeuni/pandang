package com.pandang.app.store.file.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class StoreFileDAO {
	public SqlSession sqlSession;
	
	public StoreFileDAO() {
		sqlSession= MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
