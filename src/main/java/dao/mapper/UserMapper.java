package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {
	@Insert("insert into member (id, password, name, birthday, tel, email) "
			+ "values (#{id}, #{password}, #{name}, #{birthday}, #{tel}, #{email})")
	void insert(User user);
	
	@Select({"<script>",
			"select * from member",
			"<if test='id != null'> where id=#{id}</if>",
			"<if test='ids != null'> where id in ",
			"<foreach collection='ids' item='ids' separator=',' index='i' open='(' close=')'>#{ids}",
			"</foreach></if>",
			"</script>"})
	List<User> select(Map<String, Object> param);

	@Update("update member set name=#{name}, birthday=#{birthday}, tel=#{tel}, email=#{email} where id=#{id}")
	void update(User user);

	@Delete("delete from member where id=#{id}")
	void delete(Map<String, Object> param);

	@Update("update member set password=#{password} where id=#{id}")
	void passupdate(Map<String, Object> param);
	
	@Select("select id from member where name=#{name} and tel=#{tel}")
	String selectid(User user);
	
	@Select("select password from member where name=#{name} and id=#{id}")
	String selectpw(User user);
}
