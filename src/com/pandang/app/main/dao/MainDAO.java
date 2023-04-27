package com.pandang.app.main.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.main.vo.MainFollowVO;
import com.pandang.app.main.vo.MainFollowingVO;
import com.pandang.app.main.vo.MainLikeViewVO;
import com.pandang.app.main.vo.MainVO;
import com.pandang.app.sns.vo.SnsFollowVO;
import com.pandang.app.store.like.dto.StoreLikeDTO;

public class MainDAO {
	public SqlSession sqlSession;
	
	public MainDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	public List<MainVO> selectAll(){
		return sqlSession.selectList("main.selectAll");
	}
	
	public List<MainLikeViewVO> select(int memberNumber){
		return sqlSession.selectList("main.select", memberNumber);
	}
	
	public List<MainLikeViewVO> selectLastest(int memberNumber){
		return sqlSession.selectList("main.selectLastest", memberNumber);
	}
	
	public List<MainFollowVO> selectFollow(int memberNumber) {
		return sqlSession.selectList("main.selectFollow", memberNumber);
	}
	
	public int selectFollowing(MainFollowingVO mainFollowingVO) {
		return sqlSession.selectOne("main.selectFollowing", mainFollowingVO);
	}
	
	public void insertFollow(MainFollowingVO mainFollowingVO) {
		sqlSession.insert("main.insertFollow", mainFollowingVO);
	}
	
	public void deleteFollow(MainFollowingVO mainFollowingVO) {
		sqlSession.delete("main.deleteFollow", mainFollowingVO);
	}
	

//	public List<MainDTO> select(){
//		return sqlSession.selectList("main.select");
//	}
//	public void follow(MainFollowVO mainFollowVO){
//		sqlSession.insert("MainFollow.insert", mainFollowVO);
//	}
	
//	public  MainDTO selectOne(MainDTO mainDTO){
//		sqlSession.selectOne("main.selectOne", mainDTO);
	
	
//	public MainDTO selectChannel(MainDTO mainDTO) {
//		return sqlSession.selectOne("main.selectOne", mainDTO);
//	}
	
}
