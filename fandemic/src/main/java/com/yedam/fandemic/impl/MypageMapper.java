package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Letter;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.QnA;
import com.yedam.fandemic.vo.Star;

public interface MypageMapper {
// 	메인페이지
	public List<Star> starmainselect(Fan fan); //스타 정보 나옴
	
//	내정보 수정
	public int memUpdate (Member member);
	
	// 스타 조회
	public int selectAllStarpag(Star star); //Star 페이지네이션
	public List<Star> selectStar(Star star); // QnA 조회하기
// 쪽지	
	public int SendMail (Letter letter); //쪽지 보내기
	public int getletterCount(Letter letter); //쪽지 페이지네이션
	public List<Member> selectmemberid(Member member); //ID 검색
	public List<Letter> selectMail(Letter letter); // 쪽지 조회하기
	public Letter OneMailSelect (Letter letter); //쪽지 단건 조회
	public int deletemail (Letter letter);	//쪽지 삭제
// 1o1 (qna)
	public int SendQnA (QnA qna); //QnA 보내기
	public int getQnACount(QnA qna); //Qna 페이지네이션
	public List<QnA> selectQnA(QnA qna); // QnA 조회하기
	public QnA OneQnASelect (QnA qna); //QnA 단건 조회
	public int deleteqna (QnA qna);	//QnA 삭제
	
	//회원탈퇴
	public int deleteMember(Member memeber);//회원탈퇴
	
	
}
