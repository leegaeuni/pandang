package com.pandang.app.report.sns.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.report.sns.vo.ReportSnsVO;

public class ReportSnsDAO {
	public SqlSession sqlSession;
	
	public ReportSnsDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public List<ReportSnsVO> selectAll(Map<String, Integer> pageMap) {
		return sqlSession.selectList("report.selectSnsAll", pageMap);
	}
	
	public int getTotal() {
		return sqlSession.selectOne("report.getSnsTotal");
	}

}
