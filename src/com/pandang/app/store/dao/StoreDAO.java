package com.pandang.app.store.dao;

import java.util.List;
import java.util.Map;



import org.apache.ibatis.session.SqlSession;
import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.vo.StoreVO;
import com.pandang.app.basket.vo.BasketVO;
import com.pandang.app.basket.vo.BasketVO;
import com.pandang.app.store.vo.StoreUpdateVO;



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

	public BasketVO buy(int storeNumber) {
		return sqlSession.selectOne("store.buy", storeNumber);

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
	
	public void updateViewCnt(int storeNumber) {
		sqlSession.update("store.updateViewCnt", storeNumber);
	}
	
	public StoreUpdateVO selectModal(int storeNumber) {
		return sqlSession.selectOne("store.selectModal", storeNumber);
	}

}
