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
<<<<<<< HEAD

	public void insert(StoreFileDTO storeFileDTO) {
		sqlSession.insert("storeFile.insert", storeFileDTO);
	}

	public List<StoreFileDTO> select(int storeNumber) {
		return sqlSession.selectList("storeFile.select", storeNumber);
	}

	public void delete(int storeNumber) {
		sqlSession.delete("storeFile.delete", storeNumber);
	}
<<<<<<< HEAD
=======
}
=======
>>>>>>> 6427ba2c29035518344a18df98881571557e4a94
	
	public StoreFileDTO select(int storeNumber) {
		return sqlSession.selectOne("storeFile.select", storeNumber);	
	}
	
	public void delete(int storeNumber) {
		sqlSession.delete("storeFile.delete", storeNumber);
	}
}
<<<<<<< HEAD
=======
	
	public StoreFileDTO select(int storeNumber) {
		return sqlSession.selectOne("storeFile.select", storeNumber);	
	}
	
	public void delete(int storeNumber) {
		sqlSession.delete("storeFile.delete", storeNumber);
	}
}
=======
>>>>>>> 6427ba2c29035518344a18df98881571557e4a94
>>>>>>> c3f4f79f0951106e7025a7dcc0f3c7b6ad31eeb0
