package com.pandang.app.store.file.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.file.dto.StoreFileDTO;

public class StoreFileDAO {
	public SqlSession sqlSession;
	
	public StoreFileDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	public void insert(StoreFileDTO fileDTO) {
		sqlSession.insert("file.insert", fileDTO);
	}

	public List<StoreFileDTO> select(int storeNumber) {
		return sqlSession.selectList("storefile.select", storeNumber);
	}

	public void delete(int boardNumber) {
		sqlSession.delete("file.delete", boardNumber);
	}
}