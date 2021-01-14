package com.yedam.fandemic.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.yedam.fandemic.config.MvcConfiguration;
import com.yedam.fandemic.impl.MainMapper;
import com.yedam.fandemic.impl.MemberMapper;
import com.yedam.fandemic.service.MailService;
import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Star;

@Controller
public class LoginController {
	@Autowired MemberMapper memMapper;
	@Autowired MailService mailservice;
	@Autowired MainMapper mainDao;
	
	

	
	
	
	@RequestMapping("/no-tiles/find") // id,pw 찾기 팝업창  
	public ModelAndView findIdPw() throws IOException{

		return new ModelAndView("no-tiles/find");
	}
	
	@RequestMapping("/mailCode")
	@ResponseBody
	public String mailCode(@ModelAttribute Mail mail, HttpServletRequest request, Model model) throws IOException{
	
			String code = Password.getRamdomPw(8);
			System.out.println(request.getParameter("email"));
			
			mail.setReceiveMail(request.getParameter("email")); //받는 메일 주소
			mail.setSenderName("엔터원");
			mail.setSenderMail("haez119@gmail.com");
			mail.setSubject("엔터원 가입 인증메일 입니다.");

			String mainCon = "<p> 인증번호는 <h2 style='color : blue'>'" + code +"'</h2> 입니다. </p><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다.)";
            
			mail.setMessage(mainCon);
			
			try {
				mailservice.sendEmail(mail); 
				System.out.println("메일전송");
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("메일실패");
	        }
			
			return code;
		} 

	
	// 개인 id 찾기
	@RequestMapping("/memIdFind")
	@ResponseBody
	public String memIdFind(HttpServletRequest request, Model model, Member member) throws IOException{
			
			member.setMem_name(request.getParameter("mem_name"));
			member.setMem_email(request.getParameter("mem_email"));
			
			member = memMapper.memIdFind(member);
			
			if ( member != null) {
				return member.getMem_id(); //아이디만 넘김
			} else {
				return null;
			}
			
			
			
	}
	
	// 기업 id찾기
	@RequestMapping("/comIdFind")
	@ResponseBody
	public String comIdFind(HttpServletRequest request, Model model, Company company) throws IOException{
		
		company.setCom_name(request.getParameter("com_name"));
		company.setCom_email(request.getParameter("com_email"));

		company = memMapper.comIdFind(company);
		
		if ( company != null) {
			return company.getCom_id();
		} else {
			return null;
		}
			
			
	}
	// 개인 pw
	@RequestMapping("/memPwFind")
	@ResponseBody
	public String memPwFind(@ModelAttribute Mail mail, HttpServletRequest request, Model model, Member member) throws IOException{
			
		member.setMem_id(request.getParameter("mem_id"));
		member.setMem_email(request.getParameter("mem_email"));
		member = memMapper.memPwFind(member);
		
		if(member != null) {
			
			String pwKey = Password.getRamdomPw(6);
			
			member.setMem_pw(Password.encrypt(pwKey)); //임시비번 넣어서
			memMapper.pwUpdate(member); //업데이트 하고
			
			mail.setSenderName("엔터원");
			mail.setSenderMail("haez119@gmail.com");
			mail.setReceiveMail(member.getMem_email());
			mail.setSubject("임시 비밀번호가 발급되었습니다.");

			String mainCon = "<h2>안녕하세요 " +  member.getMem_id() +" 님 </h2><br><br>" 
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + pwKey +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "<h3><a href='http://localhost:1818/fandemic/login'></h3><br><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다.)";
            
			mail.setMessage(mainCon);
			
			try {
				mailservice.sendEmail(mail); 
				System.out.println("메일전송");
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("메일실패");
	        }

			
			return member.getMem_email();
		} else {
			return null;
		}
			
			
	}
	
	// 기업 pw
	@RequestMapping("/comPwFind")
	@ResponseBody
	public String comPwFind(@ModelAttribute Mail mail, HttpServletRequest request, Model model, Company company) throws IOException{
			
		company.setCom_id(request.getParameter("com_id"));
		company.setCom_email(request.getParameter("com_email"));
		company = memMapper.comPwFind(company);

		if(company != null) {
			
			String pwKey = Password.getRamdomPw(6);
			company.setCom_pw(Password.encrypt(pwKey)); //임시비번 넣어서
			memMapper.pwUpdateCom(company);
			
			mail.setSenderName("엔터원");
			mail.setSenderMail("haez119@gmail.com");
			mail.setReceiveMail(company.getCom_email());
			mail.setSubject("요청하신 비밀번호입니다.");
			
			String mainCon = "<h2>안녕하세요 " + company.getCom_id() +" 님 </h2><br><br>" 
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + pwKey +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "<h3><a href='http://localhost:1818/fandemic/login'></h3><br><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다.)";
			
			mail.setMessage(mainCon);
			
			try {
				mailservice.sendEmail(mail); 
				System.out.println("메일전송");
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("메일실패");
	        }
			return company.getCom_email();
		} else {
			return null;
		}
			
	}
	
	@RequestMapping("/logout") 
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println("로그아웃");
		
		session.invalidate();
		
		return new ModelAndView("redirect:login");
	}
	    
	// 개인 로그인
	@RequestMapping(value="/memberLogin")
	public String memberLogin(HttpServletRequest request, HttpSession session,  Model model, Member member, RedirectAttributes redirect) throws IOException{

		member.setMem_pw(Password.encrypt(member.getMem_pw())); //비번 암호화
		
		member = memMapper.memLogin(member);
		
		
		if ( member != null) {
			
			session.setAttribute("member", member);
			return "redirect:index";
			
		} else {   
			redirect.addAttribute("login", "fail");
			return "redirect:login";
		}
		
	} // 개인 로그인
	
	
	//소속사
	@RequestMapping(value="/companyLogin")
	public String companyLogin(Model model, Company company, HttpSession session, RedirectAttributes redirect) {

		company.setCom_pw(Password.encrypt(company.getCom_pw()));
		
		company = memMapper.comLogin(company); 
		
		// 아이디가 있을 때
		if ( company != null) {
			
			// 일반기업(소속사) 일 때
			System.out.println("권한: " + company.getCom_class());
			

			if (company.getCom_class().equals("1")) {
				session.setAttribute("company", company);
				
				return "redirect:management"; 
				
			} else { // admin 일 때
				session.setAttribute("company", company);
				
				return "redirect:adminMain";
			}
		//아이디가 DB에없을때
		} else {
			redirect.addAttribute("login", "fail");
			
			return "redirect:login";
		}
		
		
	}// 소속사 로그인
	
	//스타 로그인 보류
	@RequestMapping(value="/starLogin")
	public String starLogin(HttpServletRequest request, Model model, Star star,  HttpSession session, RedirectAttributes redirect) throws IOException{
		System.out.println("스타로그인");
		
		star.setSt_id(request.getParameter("com_id"));
		star.setSt_pw(Password.encrypt(request.getParameter("com_pw")));
		
		star = memMapper.starLogin(star);
		
		// 아이디가 있을 때
		if ( star != null) {
			
			session.setAttribute("star", star);
			return "redirect:star/" + star.getSt_id(); 
				
		} else {
			redirect.addAttribute("login", "fail");
			return "redirect:login";
		}
	}

	
	// 회원가입 페이지
	@RequestMapping("/register")
	public ModelAndView register(Model model, Member member, Company company) throws IOException{

		return new ModelAndView("login/register");
	}
	
	// 개인 중복확인
	@RequestMapping("/checkId")
	@ResponseBody
	public int checkId(Model model, Member member) throws IOException{
		
			return memMapper.memIdCheck(member);
			
	}
	
	// 기업 중복확인
	@RequestMapping("/checkIdcom")
	@ResponseBody
	public int checkIdcom(Model model, Company company) throws IOException{

			return memMapper.comIdCheck(company);

	}
	
	// 개인 메일 중복 확인
	@RequestMapping("/memMail")
	@ResponseBody
	public int memMail(Model model, Member member, Errors errors) throws IOException{

		return memMapper.memMailCheck(member);
			
	}
	
	
	// 기업 메일 중복 확인
	@RequestMapping("/comMail")
	@ResponseBody
	public int comMail(Model model, Company company, Errors errors) throws IOException{
		
		return memMapper.comMailCheck(company);
			
	}
	
	
	// 개인 회원가입 처리
	@RequestMapping("/memRegister")
	public String memRegister(RedirectAttributes redirect, Model model,  Company company, Member member, Errors errors) throws IOException{
		
		new MemberValidator().validate(member, errors);
		
		if(errors.hasErrors()) {
			
			return "login/register";
		}

		member.setMem_pw(Password.encrypt(member.getMem_pw()));
		
		memMapper.memInsert(member);
		redirect.addAttribute("login", "insert");
		
		return "redirect:login";
	}
	
	
	
	// 기업 회원가입
	@RequestMapping("/comRegister")
	public String comRegister(RedirectAttributes redirect, Model model, Member member,  Company company, Errors errors) throws IOException{
		
		new CompanyValidator().validate(company, errors);
		model.addAttribute("tab", "tab-2");
		
		if(errors.hasErrors()) {
			
			return "login/register";
			
		}

		company.setCom_pw(Password.encrypt(company.getCom_pw()));
		
		memMapper.comInsert(company);
		redirect.addAttribute("login", "insert");
		
		return "redirect:login";
	}


}