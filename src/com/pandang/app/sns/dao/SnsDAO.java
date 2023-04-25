package com.pandang.app.sns.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;

import com.pandang.app.member.vo.MemberVO;
import com.pandang.app.report.sns.dto.ReportSnsDTO;
import com.pandang.app.report.store.dto.ReportStoreDTO;
import com.pandang.app.sns.comment.dto.SnsCommentDTO;
import com.pandang.app.sns.comment.vo.SnsCommentVO;
import com.pandang.app.sns.comment.vo.SnsStoreCommentVO;
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
	
	public String sessionProfileImg(int memberNumber) {
		return sqlSession.selectOne("sns.sessionProfileImg", memberNumber);
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
	
	public SnsPostVO showSnsPost(int snsNumber){
		return sqlSession.selectOne("sns.showSnsPost", snsNumber);
	}
	
	public void updateSnsViewCnt(int snsNumber) {
		sqlSession.update("sns.updateSnsViewCnt", snsNumber);
	}
	
	public void updateStoreViewCnt(int storeNumber) {
		sqlSession.update("sns.updateStoreViewCnt", storeNumber);
	}
	
	public int liked(Map<String,Integer> map) {
		return sqlSession.selectOne("sns.liked", map);
	}
	
	public void updateSnsLikeCnt(SnsDTO snsDTO) {
		sqlSession.insert("sns.updateSnsLikeCnt", snsDTO);
	}
	
	public void deleteSnsLikeCnt(SnsDTO snsDTO) {
		sqlSession.delete("sns.deleteSnsLikeCnt", snsDTO);
	}
	
	public int followed(Map<String,Integer> map) {
		return sqlSession.selectOne("sns.followed", map);
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
	public void deleteSnsFileFromHost(int snsNumber) {
		sqlSession.delete("sns.deleteSnsFileFromHost", snsNumber);
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
	
	public List<String> snsFile(int snsNumber) {
		return sqlSession.selectList("sns.snsFile", snsNumber);
	}
	
	public int getStoreTotal(int memberNumber) {
		return sqlSession.selectOne("sns.getStoreTotal", memberNumber);
	}
	
	public List<SnsStoreVO> storePostInfo(Map<String, Integer> pageMap){
		return sqlSession.selectList("sns.storePostInfo", pageMap);
	}
	
	public SnsStoreVO showStoreInfo(int storeNumber){
		return sqlSession.selectOne("sns.showStoreInfo", storeNumber);
	}
	
	public int showStoreLikeCnt(int storeNumber) {
		return sqlSession.selectOne("sns.showStoreLikeCnt", storeNumber);
	}
	
	public int showStoreCommentCnt(int storeNumber) {
		return sqlSession.selectOne("sns.showStoreCommentCnt", storeNumber);
	}
	
	public List<SnsStoreCommentVO> snsStoreCommentList(Map<String, Integer> pageMap){
		return sqlSession.selectList("sns.snsStoreCommentList", pageMap);
	}
	
	public void snsStoreCommentInsert(SnsStoreCommentVO snsStoreCommentVO){
		sqlSession.insert("sns.snsStoreCommentInsert", snsStoreCommentVO);
	}
	
	public void snsStoreCommentDelete(int storeCommentNumber) {
		sqlSession.delete("sns.snsStoreCommentDelete", storeCommentNumber);
	}
	
	public void snsStoreCommentUpdate(SnsStoreCommentVO snsStoreCommentVO) {
		sqlSession.update("sns.snsStoreCommentUpdate", snsStoreCommentVO);
	}
	
	public void updateStoreLikeCnt(SnsStoreVO snsStoreVO) {
		sqlSession.insert("sns.updateStoreLikeCnt", snsStoreVO);
	}
	
	public void deleteStoreLikeCnt(SnsStoreVO snsStoreVO) {
		sqlSession.delete("sns.deleteStoreLikeCnt", snsStoreVO);
	}
	
	public int ifLiked(Map<String, Integer> pageMap) {
		return sqlSession.selectOne("sns.ifLiked", pageMap);
	}
	
	public void reportPost(ReportSnsDTO reportSnsDTO){
		sqlSession.insert("sns.reportPost", reportSnsDTO);
	}
	
	public void updatePost(SnsDTO snsDTO) {
		sqlSession.update("sns.updatePost", snsDTO);
	}
	
	public void reportStorePost(ReportStoreDTO reportStoreDTO){
		sqlSession.insert("sns.reportStorePost", reportStoreDTO);
	}
	
	public MemberVO getSnsWriter(int memberNumber) {
		return sqlSession.selectOne("member.snsWrite", memberNumber);
	}
	
	public void snsWrite(SnsDTO snsDTO) {
		sqlSession.insert("sns.snsWrite", snsDTO);
	}
	
	public int getSequence() {
		return sqlSession.selectOne("sns.getSequence");
	}
}
