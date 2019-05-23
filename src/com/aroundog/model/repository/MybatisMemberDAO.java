
package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.Admin;
import com.aroundog.model.domain.Member;

@Repository
public class MybatisMemberDAO implements MemberDAO{
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;

   
   //아이디 중복체크
   public Member idCheck(String id) {
      Member member=sqlSessionTemplate.selectOne("Member.idCheck", id);
      return member;
   }
   
   //멤버 로그인 체크
   public Member loginCheck(Member member) {
      return sqlSessionTemplate.selectOne("Member.loginCheck", member);
   }

   //이름으로 멤버조회
   public Member selectByName(String name) {
      Member member=sqlSessionTemplate.selectOne("Member.selectByName",name);
      return member;
   }
   
   
   //CRUD
   public List selectAll() {
      return sqlSessionTemplate.selectList("Member.selectAll");
   }

   public Member select(int member_id) {
      return sqlSessionTemplate.selectOne("Member.select", member_id);
   }

   public int insert(Member member) {
      return sqlSessionTemplate.insert("Member.insert", member);
   }

   public int update(Member member) {
      return sqlSessionTemplate.update("Member.update", member);
   }
   public int updateUser(Member member) {
      return sqlSessionTemplate.update("Member.updateUser", member);
   }
   public int delete(int member_id) {
      return sqlSessionTemplate.delete("Member.delete", member_id);
   }
   
   
}