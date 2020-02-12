package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.RecommendMapper;
import logic.Recommend;

@Repository
public class RecommendDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	Map<String, Object> param = new HashMap<String, Object>();
	
	public void insert(Recommend recommend) {
		sqlSession.getMapper(RecommendMapper.class).insert(recommend);
		
	}
}
