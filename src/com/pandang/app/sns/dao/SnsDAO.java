package com.pandang.app.sns.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.sns.comment.dto.SnsCommentDTO;
import com.pandang.app.sns.comment.vo.SnsCommentVO;
import com.pandang.app.sns.dto.SnsDTO;
import com.pandang.app.sns.vo.SnsFollowVO;
import com.pandang.app.sns.vo.SnsHeaderVO;
import com.pandang.app.sns.vo.SnsPostInfoVO;
import com.pandang.app.sns.vo.SnsPostVO;
import com.pandang.app.sns.vo.SnsStoreVO;
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
	
	public List<SnsCommentVO> snsCommentList(Map<String, Integer> pageMap){
		return sqlSession.selectList("sns.snsCommentList", pageMap);
	}
	
	// sns. 은 namespace가 sns인 매퍼 안에 있는거 가져오려고 쓰는거임 
	public int getTotal(int memberNumber) {
		return sqlSession.selectOne("sns.getTotal", memberNumber);
	}
	
	public List<SnsPostVO> showSnsPost(Map<String, Integer> pageMap){
		return sqlSession.selectList("sns.showSnsPost", pageMap);
	}
	
	public void updateSnsViewCnt(int snsNumber) {
		sqlSession.update("sns.updateSnsViewCnt", snsNumber);
	}
	
	public void updateSnsLikeCnt(SnsDTO snsDTO) {
		sqlSession.insert("sns.updateSnsLikeCnt", snsDTO);
	}
	
	public void deleteSnsLikeCnt(SnsDTO snsDTO) {
		sqlSession.delete("sns.deleteSnsLikeCnt", snsDTO);
	}
	
	public void updateSnsFollow(SnsFollowVO snsFollowVO) {
		sqlSession.insert("sns.updateSnsFollow", snsFollowVO);
	}
	
	public void deleteSnsFollow(SnsFollowVO snsFollowVO) {
		sqlSession.delete("sns.deleteSnsFollow", snsFollowVO);
	}
	
	public void deleteSnsPost(int snsNumber) {
		sqlSession.delete("sns.deleteSnsPost", snsNumber);
	}
	
	public void deleteSnsLikeFromHost(int snsNumber) {
		sqlSession.delete("sns.deleteSnsLikeFromHost", snsNumber);
	}
	
	
	public void deleteSnsCommentFromHost(int snsNumber) {
		sqlSession.delete("sns.deleteSnsCommentFromHost", snsNumber);
	}
	
	public void snsCommentInsert(SnsCommentVO snsCommentVO){
		sqlSession.insert("sns.snsCommentInsert", snsCommentVO);
	}
	
	public void snsCommentDelete(int snsCommentNumber) {
		sqlSession.delete("sns.snsCommentDelete", snsCommentNumber);
	}

	public void snsCommentUpdate(SnsCommentDTO snsCommentDTO) {
		sqlSession.update("sns.snsCommentUpdate", snsCommentDTO);
	}
	
	public int getStoreTotal(int memberNumber) {
		return sqlSession.selectOne("sns.getStoreTotal", memberNumber);
	}
	
	public List<SnsStoreVO> storePostInfo(Map<String, Integer> pageMap){
		return sqlSession.selectList("sns.storePostInfo", pageMap);
	}
}
