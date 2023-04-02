package com.pandang.app.channel.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class ChannelDAO {
	public SqlSession sqlSession;
	
	public ChannelDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		
	}
}
