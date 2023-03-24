package com.pandang.app.basket.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class BasketDAO {
	public SqlSession sqlSession;
	
	public BasketDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
