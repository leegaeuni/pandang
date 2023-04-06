package com.pandang.app.channel.file.dao;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.channel.file.dto.ChannelFileDTO;

public class ChannelFileDAO {
	public SqlSession sqlSession;
	
	public ChannelFileDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public void insert(ChannelFileDTO channelFileDTO) {
		sqlSession.insert("channelFile.insert", channelFileDTO);
	}
	
	public void update(ChannelFileDTO channelFileDTO) {
		sqlSession.update("channelFile.update", channelFileDTO);
	}
	
	public ChannelFileDTO select(int channelNumber) {
		return sqlSession.selectOne("channelFile.select", channelNumber);
	}
		

}
