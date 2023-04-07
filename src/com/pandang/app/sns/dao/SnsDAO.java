package com.pandang.app.sns.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.member.vo.MemberVO;
import com.pandang.app.sns.comment.vo.SnsCommentVO;
import com.pandang.app.sns.vo.SnsHeaderVO;
import com.pandang.app.sns.vo.SnsPostInfoVO;
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
	
	public List<SnsPostInfoVO> snsPostInfo(int memberNumber) {
		return sqlSession.selectList("sns.snsPostInfo", memberNumber);
	}
	
	public List<SnsCommentVO> snsCommentList(int snsNumber){
		return sqlSession.selectList("sns.snsCommentList", snsNumber);
	}
	
	public MemberVO getSnsWriter(int memberNumber) {
		return sqlSession.selectOne("member.snsWrite", memberNumber);
	}
}
