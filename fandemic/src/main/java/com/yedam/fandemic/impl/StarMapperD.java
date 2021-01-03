package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Star;

public interface StarMapperD {
	public List<Star> getStarMemberList(Star star);
	public int getStarIdCheck(Star star); //스타회원가입 ID중복체크
	public int InsertStar(Star star);//스타회원 등록
	public Star getStarDetail(Star star); //스타회원 상세정보 조회
	public int updateStarMember(Star star); //스타회원정보 수정(업데이트)
	public int deleteStarMember(Star star); //스타회원삭제
}
