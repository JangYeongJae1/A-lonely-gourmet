package spring.practice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.practice.vo.MemberVo;
import spring.practice.vo.SearchVo;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int join(MemberVo vo) {
		
		return sqlSession.insert("spring.practice.mapper.memberMapper.join",vo);
	}
	
	public MemberVo login(MemberVo vo) {
		
		return sqlSession.selectOne("spring.practice.mapper.memberMapper.login",vo);
	}

	public List<MemberVo> list(SearchVo searchVal){
		
		return sqlSession.selectList("spring.practice.mapper.memberMapper.list",searchVal);
	}

	public int selectById(String id) {
		
		return sqlSession.selectOne("spring.practice.mapper.memberMapper.selectById",id);	
	}
	
	public int selectByNickname(String nickname) {
		
		return sqlSession.selectOne("spring.practice.mapper.memberMapper.selectByNickname",nickname);	
	}
}
