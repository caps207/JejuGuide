package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import exception.LoginException;
import logic.User;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	Map<String, Object> param = new HashMap<String, Object>();
	
	public void insert(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}
	public User selectOne(String id) {
		param.clear();
		param.put("id", id);
		List<User> list = sqlSession.getMapper(UserMapper.class).select(param);
		if(list==null || list.isEmpty()) 
		{
			throw new LoginException("해당 아이디가 없습니다.","");
		} else return list.get(0);
	}
	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
		
	}
	public void delete(String id) {
		param.clear();
		param.put("id",id);
		sqlSession.getMapper(UserMapper.class).delete(param);
	}
	public List<User> list() {
		return sqlSession.getMapper(UserMapper.class).select(null);
	}
	public List<User> list(String[] idchks) {
//		List<String> ids = Arrays.asList(idchks);
		param.clear();
		param.put("ids", idchks); //배열을 넣어줘도 상관없음
		return sqlSession.getMapper(UserMapper.class).select(param);
	}
	public void passupdate(String id, String chgpass) {
		param.clear();
		param.put("id",id);
		param.put("password",chgpass);
		sqlSession.getMapper(UserMapper.class).passupdate(param);
		
	}
	public String id(User user) {
		// 아이디찾기
		return sqlSession.getMapper(UserMapper.class).selectid(user);
	}
	public String pw(User user) {
		return sqlSession.getMapper(UserMapper.class).selectpw(user);
		
	}

}
