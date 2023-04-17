package com.pandang.app.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.vo.StoreUpdateVO;

public class StoreDAO {
	public SqlSession sqlSession;
	
	public StoreDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public void insert(StoreDTO storeDTO) {
		sqlSession.insert("store.insert", storeDTO);
	}
	
	public void updateViewCnt(int storeNumber) {
		sqlSession.update("store.updateViewCnt", storeNumber);
	}
	
	public StoreUpdateVO selectModal(int storeNumber) {
		return sqlSession.selectOne("store.selectModal", storeNumber);
	}

}
