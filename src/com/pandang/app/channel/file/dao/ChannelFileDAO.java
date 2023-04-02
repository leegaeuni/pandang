package com.pandang.app.channel.file.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

public class ChannelFileDAO {
	public SqlSession sqlSession;
	
	public ChannelFileDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
}
