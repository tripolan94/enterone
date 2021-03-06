package com.yedam.fandemic.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Fboard {
	String fbo_sub_no;	//개별 스타의 게시물번호//실제 화면에 보여주는 게시글번호
	String fan_name;	//팬 닉네임
	
	String fbo_no;		//게시물번호
	String fbo_title;	//게시물제목
	String fbo_subject;	//게시물 말머리
	String st_id;		//스타ID
	String mem_id;		//회원ID
	String fbo_time;	//게시물등록일
	String fbo_content;	//게시물 내용
	String fbo_pic;		//게시물 사진
	String fbo_views;	//조회수
	String fbo_hashtag;	//해시태그
	ArrayList<String> fbo_hashtag_array;	//해시태그 배열 분류를 위한 VO
	
	private int fbo_first; // 페이지네이션
	private int fbo_last;
	
}