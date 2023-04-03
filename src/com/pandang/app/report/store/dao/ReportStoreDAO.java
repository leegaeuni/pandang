package com.pandang.app.report.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.report.store.vo.ReportStoreVO;

public class ReportStoreDAO {
	public SqlSession sqlSession;
	
	public ReportStoreDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public List<ReportStoreVO> selectAll(Map<String, Integer> pageMap) {
		return sqlSession.selectList("report.selectStoreAll", pageMap);
	}
	
	public int getTotal() {
		return sqlSession.selectOne("report.getStoreTotal");
	}

}
