package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.Comment;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	Map<String, Object> param = new HashMap<String, Object>();
	
	//게시글
	public int count(String col, String content) {
		param.clear();
		param.put("col",col);
		param.put("content", "%"+content+"%");
		return sqlSession.getMapper(BoardMapper.class).count(param);
	}
	
	public int typecount(int categorie, String col, String content) {
		param.clear();
		param.put("type",categorie);
		param.put("col",col);
		param.put("content", "%"+content+"%");
		return sqlSession.getMapper(BoardMapper.class).count(param);
	}
	
	public List<Board> list(Integer pageNum, int limit, String col, String content) {
		param.clear();
		param.put("col", col);
		param.put("content", "%"+content+"%");
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		return sqlSession.getMapper(BoardMapper.class).select(param);
	}
	public List<Board> list(Integer pageNum, int limit, String col, String content, int categorie) {
		param.clear();
		param.put("col", col);
		param.put("content", "%"+content+"%");
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("categorie", categorie);
		return sqlSession.getMapper(BoardMapper.class).select(param);
	}
	public int maxnum() {
		return sqlSession.getMapper(BoardMapper.class).maxnum();
	}
	public void insert(Board board) {
		sqlSession.getMapper(BoardMapper.class).insert(board);
		
	}
	public void readcntadd(Integer num) {
		param.clear();
		param.put("num",num);
		sqlSession.getMapper(BoardMapper.class).readcntadd(param);
	}
	public void recommendadd(Integer num) {
		param.clear();
		param.put("num",num);
		sqlSession.getMapper(BoardMapper.class).recommendadd(param);
	}
	public void commentadd(Integer num) {
		param.clear();
		param.put("num",num);
		sqlSession.getMapper(BoardMapper.class).commentadd(param);
	}
//	public void commentsub(Integer num) {
//		param.clear();
//		param.put("num",num);
//		sqlSession.getMapper(BoardMapper.class).commentsub(param);
//		
//	}
	public Board selectOne(Integer num) {
		param.clear();
		param.put("num",num);
		return sqlSession.getMapper(BoardMapper.class).select(param).get(0);
	}
	public void update(Board board) {
		sqlSession.getMapper(BoardMapper.class).update(board);
	}
	public void delete(int num) {
		param.clear();
		param.put("num", num);
		sqlSession.getMapper(BoardMapper.class).delete(param);
	}
	
	//댓글
	public int commentmaxnum() {
		return sqlSession.getMapper(BoardMapper.class).commentmaxnum();
	}
	public void commentinsert(Comment comment) {
		sqlSession.getMapper(BoardMapper.class).commentinsert(comment);
		
	}
	public List<Comment> commentlist(Integer num, Integer pageNum, int limit) {
		param.clear();
		param.put("boardnum", num);
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		return sqlSession.getMapper(BoardMapper.class).commentselect(param);
	}
//	public void commentupdate(Comment comment) {
//		sqlSession.getMapper(BoardMapper.class).commentupdate(comment);
//		
//	}
	public void commentdelete(int num) {
		param.clear();
		param.put("num", num);
		sqlSession.getMapper(BoardMapper.class).commentdelete(param);
	}
//	public Comment commentselectOne(Integer num) {
//		param.clear();
//		param.put("boardnum",num);
//		return sqlSession.getMapper(BoardMapper.class).commentselect(param).get(0);
//	}
	public List<Board> recentlist() {
		return sqlSession.getMapper(BoardMapper.class).recent();
	}
}
