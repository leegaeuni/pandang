package com.pandang.app.main.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.main.vo.MainVO;

public class MainDAO {
	public SqlSession sqlSession;
	
	public MainDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public List<MainVO> selectAll(Map<String, Integer> pageMap){
		return null;
	}
}
