package com.pandang.app.store.like.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.like.dto.StoreLikeDTO;

public class StoreLikeDAO {
	public SqlSession sqlSession;
	
	public StoreLikeDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public int select(StoreLikeDTO storeLikeDTO) {
		return sqlSession.selectOne("storeLike.select", storeLikeDTO);
	}
	
	public void insert(StoreLikeDTO storeLikeDTO) {
		sqlSession.insert("storeLike.insert", storeLikeDTO);
	}
	
	public void delete(StoreLikeDTO storeLikeDTO) {
		sqlSession.delete("storeLike.delete", storeLikeDTO);
	}
	
	public int selectLikeCount(int storeNumber) {
		return sqlSession.selectOne("storeLike.selectLikeCount", storeNumber);
	}
}
