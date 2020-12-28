package com.yedam.fandemic.sns;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.SnsMapper;
import com.yedam.fandemic.vo.Cnotice;
import com.yedam.fandemic.vo.Sns;
@Controller
public class SnsController {
	@Autowired
	SnsMapper snsdao;
	
	
	
	@RequestMapping(value = "/sns")
	public ModelAndView sns(HttpServletResponse response, Sns sns) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("snslist", snsdao.selectSns(sns));
		mav.addObject("mysnslist", snsdao.selectMySns(sns));
		mav.setViewName("sns/sns");
		return mav;
	}
	// SNS 등록
	@RequestMapping(value = "/sns/snsInsert")
	public String snsInsert(Sns sns) {
		snsdao.insertSns(sns);
		return "sns/sns";
	}

		

}
