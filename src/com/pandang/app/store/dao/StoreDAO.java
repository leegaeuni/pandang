package com.pandang.app.store.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.basket.vo.BasketVO;

public class StoreDAO {
	public SqlSession sqlSession;
	
	public StoreDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public BasketVO buy(int storeNumber) {
		return sqlSession.selectOne("store.buy", storeNumber);
	}
}
