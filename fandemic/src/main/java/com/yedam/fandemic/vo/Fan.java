package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Fan {
	
	String fan_no;		//팬번호
	String mem_id;		//개인ID
	String st_id;		//스타ID
	String fan_name;	//닉네임
	String fan_block;	//블랙리스트
	
	String[] fan_nos; //다중삭제시 이용
	
}