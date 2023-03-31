package com.pandang.app.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.report.vo.ReportVO;

public class ReportDAO {
	public SqlSession sqlSession;
	
	public ReportDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public List<ReportVO> selectAll(Map<String, Integer> pageMap) {
		return sqlSession.selectList("report.selectAll", pageMap);
	}
	
	public int getTotal() {
		return sqlSession.selectOne("report.getTotal");
	}

}
