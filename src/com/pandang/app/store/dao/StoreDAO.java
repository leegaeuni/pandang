package com.pandang.app.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.vo.StoreVO;

public class StoreDAO {
	public SqlSession sqlSession;

	public StoreDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	public List<StoreVO> selectAll(Map<String, Integer> pageMap) {
		return sqlSession.selectList("store.selectAll", pageMap);
	}

	public int getTotal() {
		return sqlSession.selectOne("store.getTotal");
	}

	public void insert(StoreDTO storeDTO) {
		sqlSession.insert("store.insert", storeDTO);
	}

	public int getSequence() {
		return sqlSession.selectOne("store.getSequence");
	}

	public StoreVO select(int storeNumber) {
		return sqlSession.selectOne("store.select", storeNumber);
	}

	public void updateReadCount(int storeNumber) {
		sqlSession.update("store.updateViewCount", storeNumber);
	}

	public void delete(int storeNumber) {
		sqlSession.delete("store.delete", storeNumber);
	}

	public void update(StoreDTO storeDTO) {
		sqlSession.update("store.update", storeDTO);
	}
}
