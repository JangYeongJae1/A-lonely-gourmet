package spring.practice.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.practice.dao.MemberDAO;
import spring.practice.vo.MemberVo;
import spring.practice.vo.SearchVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int join(MemberVo vo) {
		
		return memberDAO.join(vo);
	}

	@Override
	public MemberVo login(MemberVo vo) {
		
		return memberDAO.login(vo);
	}

	@Override
	public List<MemberVo> list(SearchVo searchVal) {
		
		return memberDAO.list(searchVal);
	}

	@Override
	public int selectById(String id) {
		
		return memberDAO.selectById(id);
	}

	@Override
	public int selectByNickname(String nickname) {
		
		return memberDAO.selectByNickname(nickname);
	}
	

	
	
}
