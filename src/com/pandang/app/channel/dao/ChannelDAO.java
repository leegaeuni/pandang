package com.pandang.app.channel.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.channel.dto.ChannelDTO;

public class ChannelDAO {
	public SqlSession sqlSession;
	
	public ChannelDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);		
	}
	
	public void update(ChannelDTO channelDTO) {
		sqlSession.update("channel.update", channelDTO);
	}
}
