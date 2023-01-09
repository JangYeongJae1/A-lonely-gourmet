package spring.practice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.practice.service.BoardService;
import spring.practice.vo.BoardVo;
import spring.practice.vo.LikeVo;
import spring.practice.vo.MemberVo;
import spring.practice.vo.ReplyVo;
import spring.practice.vo.SearchVo;

@RequestMapping(value="/board")
@Controller
public class BoardController{
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value="/list.do")
	public String list(Model model,SearchVo searchVal) {
		
		//게시물 리스트 보기
		List<BoardVo> list = boardService.list(searchVal);
		model.addAttribute("datalist",list);
		
		return "board/list";	
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write() {
		
		return "board/write";
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String write(BoardVo vo, HttpSession session) {
		
		//로그인 후 midx,nickname을 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		vo.setNickname(login.getNickname());
		int result = boardService.write(vo);
		
		return "redirect:list.do";
	}
	

	@RequestMapping(value="/view.do",method=RequestMethod.GET)
	public String view(int bidx,Model model,HttpSession session) {
		
		MemberVo login = (MemberVo)session.getAttribute("login");
	
		//게시물 번호로 선택한 게시물 db를 vo에 담기
		BoardVo vo = boardService.selectByBidx(bidx);
		model.addAttribute("vo",vo);
		
		//게시물의 댓글 db를 list에 담기
		List<ReplyVo> list = boardService.replyList(bidx);
		model.addAttribute("list",list);
		//조회수 
		int hit = 0;
		boardService.hitCnt(bidx);
		
		return "board/view";	
	}
	
	
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public String modify(int bidx, Model model) {
		
		BoardVo vo = boardService.selectByBidx(bidx);
		model.addAttribute("vo", vo);
		
		return "board/modify";
	}
	
	@RequestMapping(value ="/modify.do",method=RequestMethod.POST)
	public String modify(BoardVo vo) {
		
		int result = boardService.updateByBidx(vo);
		
		if(result>0) {
			return "redirect:view.do?bidx="+vo.getBidx();
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public String delete(int bidx, Model model) {
		
		BoardVo vo = boardService.selectByBidx(bidx);
		model.addAttribute("vo", vo);
		
		return "board/delete";
	}
	
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public String delete(int bidx,HttpSession session) {
		
		MemberVo login = (MemberVo)session.getAttribute("login");
		
		int result = boardService.deleteByBidx(bidx);
		
		return "redirect:list.do";	
		
	}
	
	@ResponseBody
	@RequestMapping(value="/like.do",method=RequestMethod.GET)
	public int like(int bidx,LikeVo vo,HttpSession session){
		
		//로그인하면 id를 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setId(login.getId());
		//좋아요 클릭시 liketb에서 id와 bidx로 likeCheck 총 갯수 카운트
		int likeCheck = boardService.likeCheck(vo);
		if(likeCheck == 0) { //좋아요 처음 클릭시
			//좋아요 총 횟수 증가
			boardService.updateByLikeCnt(bidx);
			//liketb에 insert
			boardService.insertLiketb(vo);
			//LikeCheck를 1로 바꾸어 중복방지
			boardService.updateByLikeCheck(vo);
		}
		
		return likeCheck;
	}
	
	@ResponseBody
	@RequestMapping(value="/reply.do",method=RequestMethod.GET)
	public List<ReplyVo> replyde(ReplyVo vo,HttpSession session,int bidx,Model model) {
		
		//로그인하면 닉네임을 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setWriter(login.getNickname());
		boardService.insertReplytb(vo);
		List<ReplyVo> list = boardService.replyList(bidx);
		
		return list;
	}




}

       
  

