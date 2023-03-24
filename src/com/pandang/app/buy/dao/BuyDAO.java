package com.pandang.app.buy.dao;


import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class BuyDAO {
	public SqlSession sqlSession;
	
	public BuyDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
