package com.pandang.app.store.file.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.file.dto.StoreFileDTO;

public class StoreFileDAO {
	public SqlSession sqlSession;
	
	public StoreFileDAO() {
		sqlSession= MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public StoreFileDTO select(int storeNumber) {
		return sqlSession.selectOne("storeFile.select", storeNumber);	
	}
	
	public void delete(int storeNumber) {
		sqlSession.delete("storeFile.delete", storeNumber);
	}
}
