package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.LostComment;

@Repository
public class MybatisLostCommentDAO implements LostCommentDAO{
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   @Override
   public int insert(LostComment lostComment) {
      return sqlSessionTemplate.insert("LostComment.insert", lostComment);
   }
   @Override
   public List selectAll() {
      return sqlSessionTemplate.selectList("LostComment.selectAll");
   }
   @Override
   public int delete(int lostcomment_id) {
      return sqlSessionTemplate.delete("LostComment.delete",lostcomment_id);
   }
   @Override
   public int commentAdd(LostComment lostComment) {
      return sqlSessionTemplate.insert("LostComment.commentAdd", lostComment);
   }
   @Override
   public int deleteByTeam(LostComment lostcomment) {
      return sqlSessionTemplate.delete("LostComment.deleteByTeam",lostcomment);
   }
   @Override
   public int deleteByCommentId(int lostcomment_id) {
      return sqlSessionTemplate.delete("LostComment.deleteByCommentId", lostcomment_id);
   }
   
   /* 包府磊 */
   public List select(int lostboard_id) {
      return sqlSessionTemplate.selectList("LostComment.select", lostboard_id);
   }
   /*包府磊 + 蜡历 */
   @Override
   public int deleteByLostBoardId(int lostboard_id) {
      return sqlSessionTemplate.delete("LostComment.deleteByLostboardId",lostboard_id);
   }
@Override
public List selectByboardId(int lostboard_id) {
	List lostLost=sqlSessionTemplate.selectList("LostComment.selectByboardId", lostboard_id);
	return lostLost;
}
@Override
public int insertFirst(LostComment lostComment) {
	return sqlSessionTemplate.insert("LostComment.insertFirst", lostComment);
}

}