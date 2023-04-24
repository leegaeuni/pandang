package com.pandang.app.buy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.config.MyBatisConfig;
import com.pandang.app.buy.dto.BuyDTO;
import com.pandang.app.buy.vo.BuyVO;

public class BuyDAO {
	public SqlSession sqlSession;

	public BuyDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	// BuyMapper에서 buySeleteAll의 resultType="BuyVO"
	// BuyVO의 Object를 여러개 가져와야하니까 selectList 사용.
	public List<BuyVO> buySeleteAll(Map<String, Integer> pageMap) {
		return sqlSession.selectList("buy.buySeleteAll", pageMap);
	}

	public int getTotal(int memberNumber) {
		return sqlSession.selectOne("buy.getTotal", memberNumber);
	}
	
	public void updatePost(BuyVO buyVO) {
		sqlSession.update("buy.updatePost", buyVO);
	}
	public void buyInsert(BuyDTO buyDTO) {
		sqlSession.insert("buy.buyInsert", buyDTO);
	}
	
	public void buyCancel(int buyNumber) {
		sqlSession.update("buy.buyCancel", buyNumber);

	}
	
}
