package spring.practice.service;

import java.util.List;

import spring.practice.vo.MemberVo;
import spring.practice.vo.SearchVo;

public interface MemberService {
	
	int join(MemberVo vo);
	MemberVo login(MemberVo vo);
	List<MemberVo> list(SearchVo searchVal);
	int selectById(String id);
	int selectByNickname(String nickname);
}
