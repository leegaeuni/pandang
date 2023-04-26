package com.pandang.app.store.dao;

import java.util.List;
import java.util.Map;



import org.apache.ibatis.session.SqlSession;
import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.vo.StoreVO;
import com.pandang.app.basket.vo.BasketVO;
import com.pandang.app.report.sns.dto.ReportSnsDTO;
import com.pandang.app.report.store.dto.ReportStoreDTO;
import com.pandang.app.sns.dto.SnsDTO;
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
	
	public List<StoreVO> selectAllByFree(Map<String, Integer> pageMap) {
		return sqlSession.selectList("store.selectAllByFree", pageMap);
	}
	
	public List<StoreVO> selectAllByLike(Map<String, Integer> pageMap) {
		return sqlSession.selectList("store.selectAllByLike", pageMap);
	}
	
	public List<StoreVO> selectAllByDate(Map<String, Integer> pageMap) {
		return sqlSession.selectList("store.selectAllByDate", pageMap);
	}
	
	public int getTotal(int hashtagNumber) {
		return sqlSession.selectOne("store.getTotal", hashtagNumber);
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

	public void deleteStorePost(int storeNumber) {
		sqlSession.delete("store.deleteStorePost", storeNumber);
	}
	
	public void deleteStoreLike(int storeNumber) {
		sqlSession.delete("store.deleteStoreLike", storeNumber);
	}
	public void deleteStoreFile(int storeNumber) {
		sqlSession.delete("store.deleteStoreFile", storeNumber);
	}
	
	public void deleteStoreComment(int storeNumber) {
		sqlSession.delete("store.deleteStoreComment", storeNumber);
	}

	public void update(StoreDTO storeDTO) {
		sqlSession.update("store.update", storeDTO);
	}
	
	public void updateViewCnt(int storeNumber) {
		sqlSession.update("store.updateViewCnt", storeNumber);
		//연재가 만들었음
	}
	
	public StoreUpdateVO selectModal(int storeNumber) {
		return sqlSession.selectOne("store.selectModal", storeNumber);
		//연재가 만들었음
	}

	public void storeWrite(StoreDTO storeDTO) {
		sqlSession.insert("store.storeWrite", storeDTO);
	}
	
	public List<StoreVO> search(Map<String, Object> map) {
		return sqlSession.selectList("store.search", map);
	}
	
	public int searchGetTotal(String searchInput) {
		return sqlSession.selectOne("store.searchGetTotal", searchInput);
	}

	
	public void reportStorePost(ReportStoreDTO reportStoreDTO){
		sqlSession.insert("store.reportStorePost", reportStoreDTO);
	}
	
	public void reportPost(ReportStoreDTO reportStoreDTO){
		sqlSession.insert("store.reportPost", reportStoreDTO);
	}
	

	// 가은이가 만들었음 

	public void updatePost(StoreDTO storeDTO) {
		sqlSession.update("store.updatePost", storeDTO);
	}
}
