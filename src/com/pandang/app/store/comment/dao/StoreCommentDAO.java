package com.pandang.app.store.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.store.comment.dto.StoreCommentDTO;
import com.pandang.app.store.comment.vo.StoreCommentVO;

public class StoreCommentDAO {
	public SqlSession sqlSession;

	public StoreCommentDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	public List<StoreCommentVO> selectAll(int storeNumber) {
		return sqlSession.selectList("storeComment.selectAll", storeNumber);
	}

	public void insert(StoreCommentDTO storeCommentDTO) {
		sqlSession.insert("storeComment.insert", storeCommentDTO);
	}

	public void delete(int storeCommentNumber) {
		sqlSession.delete("storeComment.delete", storeCommentNumber);
	}

	public void update(StoreCommentDTO storeCommentDTO) {
		sqlSession.update("storeComment.update", storeCommentDTO);
	}
}
