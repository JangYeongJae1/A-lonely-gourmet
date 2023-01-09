package spring.practice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.practice.vo.BoardVo;
import spring.practice.vo.LikeVo;
import spring.practice.vo.ReplyVo;
import spring.practice.vo.SearchVo;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVo> list(SearchVo searchVal){
		
		return sqlSession.selectList("spring.practice.mapper.boardMapper.list",searchVal);
	}
	
	public int write(BoardVo vo) {
		
		return sqlSession.insert("spring.practice.mapper.boardMapper.write",vo);	
	}
	
	public BoardVo selectByBidx(int bidx) {
		
		return sqlSession.selectOne("spring.practice.mapper.boardMapper.selectByBidx",bidx);
	}
	
	public int hitCnt(int bidx) {
		
		return sqlSession.update("spring.practice.mapper.boardMapper.hitCnt",bidx);		
	}
	
	public int updateByBidx(BoardVo vo) {
		
		return sqlSession.update("spring.practice.mapper.boardMapper.updateByBidx",vo);	
	}
	
	public int deleteByBidx(int bidx) {
		
		return sqlSession.delete("spring.practice.mapper.boardMapper.deleteByBidx", bidx);	
	}
	
	public int updateByLikeCnt(int bidx) {
		
		return sqlSession.update("spring.practice.mapper.boardMapper.updateByLikeCnt",bidx);
	}
	
	public int insertLiketb(LikeVo vo) {
		
		return sqlSession.insert("spring.practice.mapper.boardMapper.insertLiketb",vo);
	}
	
	public int updateByLikeCheck(LikeVo vo) {
		
		return sqlSession.update("spring.practice.mapper.boardMapper.updateByLikeCheck",vo);
	}
	
	public int likeCheck(LikeVo vo) {
		
		return sqlSession.selectOne("spring.practice.mapper.boardMapper.likeCheck",vo);
	}
	
	public int insertReplytb(ReplyVo vo) {
		
		return sqlSession.insert("spring.practice.mapper.boardMapper.insertReplytb",vo);
	}
	
	public List<ReplyVo> replyList(int bidx){
		
		return sqlSession.selectList("spring.practice.mapper.boardMapper.replyList",bidx);
	}
	
	
	
}
