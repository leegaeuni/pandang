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
	
	// 회원 번호로 장바구니 받은 물건 받아오기 한 사람이 여러개 넣으므로 List<>사용
	public List<BasketVO> selectAll(int memberNumber) {
		return sqlSession.selectList("basket.selectAll", memberNumber);	
	}
	
	
	
	}

