package com.pandang.app.sns.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.sns.comment.vo.SnsCommentVO;
import com.pandang.app.sns.vo.SnsHeaderVO;
import com.pandang.app.sns.vo.SnsPostInfoVO;
import com.pandang.app.sns.vo.SnsPostVO;
import com.pandang.app.sns.vo.SnsVO;

public class SnsDAO {
	public SqlSession sqlSession;
	
	public SnsDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public List<SnsVO> selectAll(int memberNumber) {
		return sqlSession.selectList("sns.selectAll", memberNumber);
	}
	
	
	public SnsHeaderVO memberInfo(int memberNumber) {
		return sqlSession.selectOne("sns.memberInfo", memberNumber);
	}
	
	public List<SnsPostInfoVO> snsPostInfo(Map<String, Integer> pageMap) {
		return sqlSession.selectList("sns.snsPostInfo", pageMap);
	}
	
	public List<SnsCommentVO> snsCommentList(int snsNumber){
		return sqlSession.selectList("sns.snsCommentList", snsNumber);
	}
	
	// sns. 은 namespace가 sns인 매퍼 안에 있는거 가져오려고 쓰는거임 
	public int getTotal(int memberNumber) {
		return sqlSession.selectOne("sns.getTotal", memberNumber);
	}
	
	public List<SnsPostVO> showSnsPost(Map<String, Integer> pageMap){
		return sqlSession.selectList("sns.showSnsPost", pageMap);
	}
	
}
