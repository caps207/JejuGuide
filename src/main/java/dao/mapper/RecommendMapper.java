package dao.mapper;

import org.apache.ibatis.annotations.Insert;


import logic.Recommend;

public interface RecommendMapper {
	
	@Insert("insert into recommend (boardnum, id, url) values(#{boardnum}, #{id}, #{url})" )
	void insert(Recommend recommend);


}
