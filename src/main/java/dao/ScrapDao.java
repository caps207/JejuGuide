package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.RecommendMapper;
import dao.mapper.ScrapMapper;
import logic.Board;
import logic.Recommend;
import logic.Scrap;

@Repository
public class ScrapDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	Map<String, Object> param = new HashMap<String, Object>();
	
	public void scrap(Scrap scrap) {
		sqlSession.getMapper(ScrapMapper.class).insert(scrap);
		
	}

	public List<Scrap> tripselect(String id) {
		return sqlSession.getMapper(ScrapMapper.class).tripselect(id);
	}
	public List<Scrap> foodselect(String id) {
		return sqlSession.getMapper(ScrapMapper.class).foodselect(id);
	}
	public List<Scrap> sleepselect(String id) {
		return sqlSession.getMapper(ScrapMapper.class).sleepselect(id);
	}
	public List<Scrap> freeselect(String id) {
		return sqlSession.getMapper(ScrapMapper.class).freeselect(id);
	}
	public List<Scrap> infoselect(String id) {
		return sqlSession.getMapper(ScrapMapper.class).infoselect(id);
	}

	public List<Recommend> brecom(String id) {
		return sqlSession.getMapper(ScrapMapper.class).brecom(id);
	}
}
