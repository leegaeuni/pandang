package com.pandang.app.basket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.basket.vo.BasketVO;

public class BasketDAO {
	public SqlSession sqlSession;
	
	public BasketDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public List<BasketVO> selectAll(Map<String, Integer> pageMap) {
	      return sqlSession.selectList("basket.selectAll", pageMap);
	}
	
	
	
	}

