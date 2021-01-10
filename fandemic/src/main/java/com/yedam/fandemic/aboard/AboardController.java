package com.yedam.fandemic.aboard;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.fandemic.service.AboardService;
import com.yedam.fandemic.vo.Aboard;


@Controller
public class AboardController {
	@Autowired
	AboardService aboardService;

	//소속사 오디션 공지관리 페이지 이동
	@RequestMapping(value = "/management/aboard/aboard")
	public String Aboard() {
		return "mgt/aboard/aboard";
	}
	
	//소속사 오디션 공지사항 목록 요청
	@RequestMapping(value = "/management/aboard/aboardList")
	@ResponseBody //결과값 JSON
	public List<Aboard> AboardList(Aboard aboard){
		return aboardService.getAboardList(aboard);//com_id로 요청
	}
	
	//소속사 오디션 공지 등록 폼 이동
	@RequestMapping(value = "/management/aboard/aboardInsertForm")
	public String AboardInsertForm() {
		return "mgt/aboard/aboardInsertForm";
	}
	
	//소속사 오디션 공지 등록 
	@RequestMapping(value = "/management/aboard/aboardInsert")
	public String InsertAboard(HttpServletRequest request,Model model, Aboard aboard) throws IllegalStateException, IOException {
		
		// request multipart로 캐스팅
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      String sumFile="";
	   // 이미지파일, 공지사항 첨부파일
	      List<MultipartFile> multipartFile = multipartRequest.getFiles("uploadFile");
	      for(int i=0; i<multipartFile.size(); i++) {
		      if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/aboard");
		    	  System.out.println("path="+path);
		         multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
		         sumFile = sumFile + multipartFile.get(i).getOriginalFilename()+" ";
		         aboard.setAbo_pic(sumFile);
		      }else {
		    	  aboard.setAbo_pic("");
		      }
	      }
	      
	      aboardService.insertAboard(aboard);
	      model.addAttribute("msg","오디션이 등록되었습니다.");
		return "redirect:/management/aboard/aboard";
	}
	
	//소속사 오디션 공지사항 삭제
	@RequestMapping(value = "/management/aboard/aboardDelete")
	@ResponseBody
	public int DeleteAboard(Aboard aboard) {
		int result = aboardService.deleteAboard(aboard);
		return result;
	}
	
	//소속사 오디션 공지사항 상세보기
	@RequestMapping(value="/management/aboard/aboardDetail")
	public String AboardDetail(Model model, Aboard aboard) {
		model.addAttribute("aboard",aboardService.aboardDetail(aboard));  
		return "mgt/aboard/aboardDetail";
	}
	
	//소속사 오디션 공지사항 수정
	@RequestMapping(value="/management/aboard/aboardUpdate")
	public String UpdateAboard(HttpServletRequest request, Model model, Aboard aboard) throws IllegalStateException, IOException {
		// request multipart로 캐스팅
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      String sumFile="";
	   // 이미지파일, 공지사항 첨부파일
	      List<MultipartFile> multipartFile = multipartRequest.getFiles("uploadFile");
	      for(int i=0; i<multipartFile.size(); i++) {
		      if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
		    	  String path = request.getSession().getServletContext().getRealPath("/images/aboard");
		    	  System.out.println("path="+path);
		         multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
		         sumFile = sumFile + multipartFile.get(i).getOriginalFilename()+" ";
		         aboard.setAbo_pic(sumFile);
		      }
	      }
		aboardService.updateAboard(aboard);
		return "redirect:/management/aboard/aboard";
	}
	
}