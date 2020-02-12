package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.Comment;

public interface BoardMapper {
	String boardcolumn = "select num,type,id,subject,content,file fileurl,regdate,readcnt,recommend,comment from board";

	//게시글
	@Select({"<script>",
			"select count(*) from board",
			"<if test='type != null'> where type = #{type}",
			"<if test='col != null'> and ${col} like #{content}</if></if>",
			"<if test='type == null'>",
			"<if test='col != null'> where ${col} like #{content}</if></if>",
			"</script>"})
	int count(Map<String, Object> param);

	@Select({"<script>",
			boardcolumn,
			"<if test='categorie != null'> where type = #{categorie}",
			"<if test='col != null'> and ${col} like #{content}</if></if>",
			"<if test='categorie == null'>",
			"<if test='col != null'> where ${col} like #{content}</if></if>",
			"<if test='num != null'> where num = #{num}</if>",
			"<if test='num == null'> order by num desc limit #{startrow}, #{limit}</if>",
			"</script>"})
	List<Board> select(Map<String, Object> param);

	@Select("select ifnull(max(num),0) from board")
	int maxnum();

	@Insert("insert into board (num,type,id,subject,content,file,regdate,readcnt,recommend,comment)"
			+ " values (#{num},#{type},#{id},#{subject},#{content},#{fileurl},now(),0,0,0)")
	void insert(Board board);

	@Update("update board set readcnt = readcnt + 1 where num = #{num}")
	void readcntadd(Map<String, Object> param);

	@Update("update board set recommend = recommend + 1 where num = #{num}")
	void recommendadd(Map<String, Object> param);
	
	@Update("update board set comment = comment + 1 where num = #{num}")
	void commentadd(Map<String, Object> param);
	
//	@Update("update board set comment = comment - 1 where num = #{num}")
//	void commentsub(Map<String, Object> param);

	@Update("update board set type = #{type}, subject = #{subject}, content = #{content}, file = #{fileurl} where num = #{num}")
	void update(Board board);

	@Delete("delete from board where num = #{num}")
	void delete(Map<String, Object> param);
	
	//댓글
	@Select("select ifnull(max(num),0) from comment")
	int commentmaxnum();

	@Insert("insert into comment (num,boardnum,id,content,regdate,grp,grplevel,grpstep)"
			+ " values (#{num},#{boardnum},#{id},#{content},now(),#{grp},#{grplevel},#{grpstep})")
	void commentinsert(Comment comment);
	
//	@Select({"<script>",
//			"select * from comment where boardnum = #{boardnum}",
//			"<if test='num != null'> and num = #{num}</if>",
//			"<if test='num == null'> order by regdate asc limit #{startrow}, #{limit}</if>",
//			"</script>"})
//	List<Comment> commentselect(Map<String, Object> param);
	
	@Select(
		"select * from comment where boardnum = #{boardnum} order by regdate asc limit #{startrow}, #{limit}")
	List<Comment> commentselect(Map<String, Object> param);

	@Update("update comment set content = #{content} where num = #{num}")
	void commentupdate(Comment comment);

	@Delete("delete from comment where num = #{num}")
	void commentdelete(Map<String, Object> param);
	
	@Select("select * from board order by regdate desc limit 5")
	List<Board> recent();

	

	
}
