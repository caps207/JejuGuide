package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SearchMapper;
import logic.Search;

@Repository
public class SearchDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insert(Search search) { // 검색기록 추가
		sqlSession.getMapper(SearchMapper.class).insert(search);
	}

	public List<Search> list(String userid) { // 검색기록 리스트로 뽑아줌

		return sqlSession.getMapper(SearchMapper.class).select(userid);
	}

	public List<Search> ranklist() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(SearchMapper.class).selectrank();
	}

}
