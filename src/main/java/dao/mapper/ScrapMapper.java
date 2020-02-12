package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Recommend;
import logic.Scrap;

public interface ScrapMapper {
	
	@Insert("insert into scrap (id, url, title, type) values (#{id}, #{url}, #{title}, #{type})")
	void insert(Scrap scrap);

	@Select("select * from scrap where id=#{id} and type=1")
	List<Scrap> tripselect(String id);
	
	@Select("select * from scrap where id=#{id} and type=2")
	List<Scrap> foodselect(String id);
	
	@Select("select * from scrap where id=#{id} and type=3")
	List<Scrap> sleepselect(String id);
	
	@Select("select * from scrap where id=#{id} and type=4")
	List<Scrap> freeselect(String id);
	
	@Select("select * from scrap where id=#{id} and type=5")
	List<Scrap> infoselect(String id);

	@Select(" SELECT r.boardnum,r.id,r.url,b.subject  FROM board b LEFT OUTER JOIN recommend r ON b.num = r.boardnum WHERE r.id=#{id}")
	List<Recommend> brecom(String id);
	
}
