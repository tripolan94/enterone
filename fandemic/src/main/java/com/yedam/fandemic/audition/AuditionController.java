package com.yedam.fandemic.audition;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.AuditionMapper;
import com.yedam.fandemic.login.Password;
import com.yedam.fandemic.service.AuditionService;
import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Activity;
import com.yedam.fandemic.vo.Audition;
import com.yedam.fandemic.vo.Cart;
import com.yedam.fandemic.vo.Fboard;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Member;
import com.yedam.fandemic.vo.Paging;
import com.yedam.fandemic.vo.Star;
import com.yedam.fandemic.vo.Trainee;

@Controller
public class AuditionController {
	@Autowired
	AuditionService auditionservice;
	@Autowired
	AuditionMapper auditionMapper;
	
	String no=null;

	// 연습생 등록 페이지
	@RequestMapping(value = "/audition/traineeinsert") // 주소
	public ModelAndView traineeinsert(HttpServletResponse response) throws IOException {
		return new ModelAndView("audition/trainee_insert");

	}

	// 연습생 수정 페이지
	@RequestMapping(value = "/audition/traineeupdate") // 주소
	public ModelAndView traineeUpdateselect(Model model, Trainee trainee, HttpSession session) throws IOException {

		Member member = (Member) session.getAttribute("member");
		trainee.setMem_id(member.getMem_id());
		model.addAttribute("TrList", auditionMapper.traineeUpdateselect(trainee));
		return new ModelAndView("mypage/my_trainee_update");
	}

	// 연습생 수정
	@RequestMapping(value = "/audition/traineeupdatesend")
	public String traineeupdate(HttpServletRequest request, Model model, Trainee trainee)
			throws IllegalStateException, IOException {
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String sumFile = "";

		List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/audition");
				System.out.println("path=" + path);
				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
				sumFile = sumFile + multipartFile.get(i).getOriginalFilename() + " ";
				trainee.setTr_pic(sumFile);
			}
		}
		auditionservice.traineeUpdate(trainee);
		return "redirect:/audition/auditionwork";
	}
// 연습생 글 등록

	@RequestMapping(value = "/audition/traineeinsertsend")

	public String Inserttr(HttpServletRequest request, Model model, Trainee trainee)
			throws IllegalStateException, IOException {
		System.out.println("++++++"); // request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String sumFile = "";
		List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/audition");
				System.out.println("path=" + path);
				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
				sumFile = sumFile + multipartFile.get(i).getOriginalFilename() + " ";
				trainee.setTr_pic(sumFile);
			} else {
				trainee.setTr_pic("");
			}
		}

		auditionservice.inserttr(trainee);
		model.addAttribute("msg", "등록됐습니다.");
		return "redirect:/audition/auditionwork";
	}

	// 연습생 닉네임인 중복확인
	@RequestMapping(value = "/audition/nickCheck")
	@ResponseBody
	public int nickId(Model model, Trainee trainee) throws IOException {
		return auditionMapper.nickCheck(trainee);

	}

	// 연습생 활동 페이지
	@RequestMapping(value = "/audition/auditionwork") // 주소
	public ModelAndView auditionwork(Model model, HttpServletRequest request, Activity activity) throws IOException {
		model.addAttribute("AcworkList", auditionMapper.selectac());
		model.addAttribute("trainee", auditionMapper.selecttr());// 세션에 없으면 디비에서 가져와야함 selecttr안에 값들이 들어있음
		
		model.addAttribute("selectnew", auditionMapper.selectnew());

		return new ModelAndView("audition/activity_list");

	}

//연습생 활동 글등록 페이지 
	@RequestMapping(value = "/audition/activityinsert")
	public ModelAndView activityinsert(Model model, Activity activity, HttpSession session) throws IOException {
		return new ModelAndView("audition/activity_insert");
	}

	// 연습생 활동 글 등록
	@RequestMapping(value = "/audition/activityinsertsend")
	public String Insertac(HttpServletRequest request, Model model, Activity activity)
			throws IllegalStateException, IOException {
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String sumFile = "";
		List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/audition");
				System.out.println("path=" + path);
				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
				sumFile = sumFile + multipartFile.get(i).getOriginalFilename() + " ";
				activity.setAc_file(sumFile);
			} else {
				activity.setAc_file("");
			}
		}

		auditionservice.insertac(activity);
		model.addAttribute("msg", "등록됐습니다.");
		return "redirect:/audition/auditionwork";

	}

	// 연습생 활동 글수정 페이지
	@RequestMapping(value = "/audition/activityupdate")
	public ModelAndView activityupdate(Model model, Activity activity, HttpSession session) throws IOException {
		Member member = (Member) session.getAttribute("member"); // 세션에 저장해둔 member 불러오기
		activity.setMem_id(member.getMem_id()); // activity에 아이디를 넣은거
		model.addAttribute("AcworkList", auditionMapper.activityUpdateselect(activity));

		return new ModelAndView("audition/activity_update");
	}

	// 연습생 활동 글 수정
	@RequestMapping(value = "/audition/activityupdatesend")
	public String UpdateActivity(HttpServletRequest request, Model model, Activity activity)
			throws IllegalStateException, IOException {
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String sumFile = "";

		List<MultipartFile> multipartFile = multipartRequest.getFiles("ex2_file");
		for (int i = 0; i < multipartFile.size(); i++) {
			if (!multipartFile.get(i).isEmpty() && multipartFile.get(i).getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/images/audition");
				System.out.println("path=" + path);
				multipartFile.get(i).transferTo(new File(path, multipartFile.get(i).getOriginalFilename()));
				sumFile = sumFile + multipartFile.get(i).getOriginalFilename() + " ";
				activity.setAc_file(sumFile);
			}
		}
		auditionservice.activityUpdate(activity);
		return "redirect:/audition/auditionwork";
	}

	// 연습생 활동 지원 글 삭제
	@RequestMapping(value = "/audition/activitydelete", method = RequestMethod.POST)
	@ResponseBody
	public boolean activitydelete(HttpServletRequest request, Activity activity) throws IOException {
		activity.setAc_no(request.getParameter("ac_no"));
		auditionservice.activityDelete(activity);
		return true;
	}

	// 활동 상세 프로필
	@RequestMapping(value = "/ActivityDetail/{mem_id}")
	public ModelAndView ActivityDetail(@PathVariable String mem_id, Activity activity, Model model) throws IOException {
		// 단건
		activity.setMem_id(mem_id);
		model.addAttribute("activity", auditionMapper.activityDetail(activity));
		return new ModelAndView("audition/trainee_profile");
	}

	@RequestMapping(value = "/audition/auditionapply") // 주소
	public ModelAndView auditioninsert(HttpServletResponse response ,HttpServletRequest request) throws IOException {
		 no = request.getParameter("no");
		
		return new ModelAndView("audition/audition_apply");

	}

	// 오디션 지원자 등록
	@RequestMapping(value = "/audition/auditioninsertsend")
	public String Insertau(HttpServletRequest request, Model model, Audition audition,HttpSession session, Aboard aboard,String no)
			throws IllegalStateException, IOException {
			Member member = (Member) session.getAttribute("member"); //세션 멤버에서 가져와서 멤버컬럼을 다 가져옴

			
			  aboard.setAbo_no(no); 
			  System.out.println("+++++"+no);
			  
			model.addAttribute("no",auditionMapper.insertselect(aboard));

			model.addAttribute(auditionMapper.getAboardInfo(aboard));

			audition.setMem_id(member.getMem_id());//거기서 아이디만 가져와서 값 담아주고
			System.out.println("=========="+no);
			/*
			 * aboard.setAbo_no(no);//어보드에서 가져온 no를 넣고
			 * model.addAttribute("no",auditionMapper.insertselect(aboard));
			 */
			//aboard=auditionMapper.insertselect(aboard);//리턴값
			audition.setCom_id(aboard.getCom_id());//com_id		
			System.out.println("====================="+aboard.getCom_id());
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request; // request 를 multipart로 캐스팅
			
			if(multipartRequest!=null) {
				MultipartFile multipartFile = multipartRequest.getFile("ex2_file");
				System.out.println("사진");
				
				if(! multipartFile.isEmpty() && multipartFile.getSize() > 0) { // 임시폴더에 업로드된 파일을 실제 폴더로 transfer 이동
					System.out.println("if");
					   String path = request.getSession().getServletContext().getRealPath("/images/audition");
					  System.out.println("====path : " + path); 
					  multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
					  audition.setAud_pic(multipartFile.getOriginalFilename()); 
					  audition.setAud_file(multipartFile.getOriginalFilename()); 
				}
			}

		auditionservice.insertau(audition);
		model.addAttribute("msg", "등록됐습니다.");

		return "redirect:/audition/audition_apply";
	}

	// 연습생 활동 조회수 증가
	@RequestMapping(value = "/audtion/hitsUpdate", method = RequestMethod.POST)
	@ResponseBody
	public boolean hitsUpdate(HttpServletRequest request, Activity activity) throws IOException {
		activity.setAc_no(request.getParameter("ac_no"));
		auditionservice.updateActivityhits(activity);
		return true;
	}

}
