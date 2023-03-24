package com.pandang.app.sns.comment.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class SnsCommentDAO {
	public SqlSession sqlSession;
	
	public SnsCommentDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
