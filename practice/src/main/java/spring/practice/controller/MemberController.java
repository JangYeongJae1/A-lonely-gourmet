package spring.practice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.practice.service.MemberService;
import spring.practice.vo.MemberVo;
import spring.practice.vo.SearchVo;

@RequestMapping(value="/member")
@Controller
public class MemberController{
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String join() {
		
		return "member/join";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public String join(MemberVo vo) {
		
		int result = memberService.join(vo);
		
		return "redirect:login.do";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(MemberVo vo, HttpSession session) {
		
		MemberVo login = memberService.login(vo);
		if(login != null) {
			session.setAttribute("login",login);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value="/list.do")
	public String list(Model model,SearchVo searchVal) {
		
		List<MemberVo> list = memberService.list(searchVal);
		model.addAttribute("datalist",list);
		return "member/list";	
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId.do",method=RequestMethod.POST)
	public String checkId(String id) {
		
		int result = memberService.selectById(id);
		
		if(result >0) {
			return "1";
		}else {
			return "0";
		}		
	}
	
	@ResponseBody
	@RequestMapping(value="/checkNickname.do",method=RequestMethod.POST)
	public String checkNickname(String nickname) {
		
		int result = memberService.selectByNickname(nickname);
		
		if(result >0) {
			return "1";
		}else {
			return "0";
		}		
	}











}

       
  

