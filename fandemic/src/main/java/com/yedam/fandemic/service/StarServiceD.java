package com.yedam.fandemic.service;

import java.util.List;

import com.yedam.fandemic.vo.Art;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Schedule;
import com.yedam.fandemic.vo.Star;

public interface StarServiceD {
	public List<Star> getStarMemberList(Star star); //스타회원 전체조회
	public Star getStarDetail(Star star); //스타회원 상세정보 조회
	public int getStarIdCheck(Star star); //스타회원가입 ID중복체크
	public int InsertStar(Star star);//스타회원 등록
	public int updateStarMember(Star star);//스타회원정보 수정
	public int deleteStarMember(Star star);//스타회원삭제
	public int insertStarSchedule(Schedule schedule); //스타 스케줄 등록
	public List<Schedule> getStartList(Schedule schedule); //스타 스케줄 목록조회
	public int updateStarSchedule(Schedule schedule); //스타 스케줄 수정하기
	public int deleteStarSchedule(Schedule schedule); //스타 스케줄 삭제하기
	public List<Art> getStarWorkList(Art art); //스타 작품 목록 요청
	public int insertStarWork(Art art); //스타작품 등록
	public int deleteStarWork(Art art); //스타작품 삭제
	public Art starWorkDetail(Art art); //스타작품 상세보기
	public int updateStarWork(Art art); //스타작품 수정
	public List<Fan> getStarFanList(Fan fan);//스타 팬 리스트 요청
	public int starFanBlack(Fan fan); //스타 팬 블랙리스트 해제
}
