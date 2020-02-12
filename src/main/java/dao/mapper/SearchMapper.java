package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Search;

public interface SearchMapper {

	@Insert("insert into mainsearch (id, keyword) values (#{userid}, #{keyword})")
	void insert(Search search);

	@Select("select keyword from mainsearch where id=#{userid} order by num desc limit 30")
	List<Search> select(String userid);

	@Select("select keyword,count(keyword) cnt from mainsearch GROUP BY keyword order by cnt desc LIMIT 10")
	List<Search> selectrank();

}
