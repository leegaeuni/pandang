package com.pandang.app.sns.file.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.sns.file.dto.SnsFileDTO;

public class SnsFileDAO {
	public SqlSession sqlSession;
	
	public SnsFileDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public void snsWrite(SnsFileDTO snsFileDTO) {
		sqlSession.insert("snsFile.snsWrite", snsFileDTO);
	}
	
	
}
