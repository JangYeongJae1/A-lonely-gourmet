package spring.practice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring.practice.dao.BoardDAO;
import spring.practice.vo.BoardVo;
import spring.practice.vo.LikeVo;
import spring.practice.vo.ReplyVo;
import spring.practice.vo.SearchVo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVo> list(SearchVo searchVal) {
		
		List<BoardVo> list = boardDAO.list(searchVal);
		
		return list;
	}

	@Override
	public int write(BoardVo vo) {
		
		return boardDAO.write(vo);
	}

	@Override
	public BoardVo selectByBidx(int bidx) {
		
		return boardDAO.selectByBidx(bidx);
	}
	
	@Override
	public int hitCnt(int bidx) {
		
		return boardDAO.hitCnt(bidx);
	}

	@Override
	public int updateByBidx(BoardVo vo) {
		
		return boardDAO.updateByBidx(vo);
	}

	@Override
	public int deleteByBidx(int bidx) {
		
		return boardDAO.deleteByBidx(bidx);
	}

	@Override
	public int updateByLikeCnt(int bidx) {
		
		return boardDAO.updateByLikeCnt(bidx);
	}

	@Override
	public int insertLiketb(LikeVo vo) {
		
		return boardDAO.insertLiketb(vo);
	}

	@Override
	public int updateByLikeCheck(LikeVo vo) {
		
		return boardDAO.updateByLikeCheck(vo);
	}

	@Override
	public int likeCheck(LikeVo vo) {
		
		return boardDAO.likeCheck(vo);
	}

	@Override
	public int insertReplytb(ReplyVo vo) {
		
		return boardDAO.insertReplytb(vo);
	}

	@Override
	public List<ReplyVo> replyList(int bidx) {
		
		List<ReplyVo> list = boardDAO.replyList(bidx);
		
		return list;
	}
	









	



	


	
}
