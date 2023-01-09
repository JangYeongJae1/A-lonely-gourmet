package spring.practice.service;

import java.util.List;

import spring.practice.vo.BoardVo;
import spring.practice.vo.LikeVo;
import spring.practice.vo.ReplyVo;
import spring.practice.vo.SearchVo;

public interface BoardService {
	
	List<BoardVo> list(SearchVo searchVal);
	int write(BoardVo vo);
	BoardVo selectByBidx(int bidx);
	int hitCnt(int bidx);
	int updateByBidx(BoardVo vo);
	int deleteByBidx(int bidx);
	int updateByLikeCnt(int bidx);
	int insertLiketb(LikeVo vo);
	int updateByLikeCheck(LikeVo vo);
	int likeCheck(LikeVo vo);
	int insertReplytb(ReplyVo vo);
	List<ReplyVo> replyList(int bidx);
}	
