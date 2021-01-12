<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style>
c {
	color: red;
}
.error {
	color: red;
	font-weight: bold;
}
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 25px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #4176E0;
	color: white;
}

.tab-content {
	display: none;
	padding: 15px 0;

}

.tab-content.current {
	display: inherit;
}

</style>
<script>
	$(document).ready(function() {
		
		checkUser("개인회원");		
		
 		
		
 		// 유효성 검사 후 텝 고정
 		var tblId = "${tab}";
 		if(tblId != "") {
 			console.log(tblId);
 			
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current'); 
			
			$("#li2").addClass('current');
			$("#" + tblId).addClass('current');
			
		} 
		 

		$('ul.tabs li').click(function() { //기업회원, 개인회원 선택클릭
			var user = $(this).text();
			
			var tab_id = $(this).attr('data-tab');
			console.log($(this));

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			
			checkUser(user);			
		});
		
		
		
		// 아이디 중복확인
		$('#btnCheckm').on('click',function(){
			
			if($("#mem_id").val() == null || $("#mem_id").val() == '' ) {
				alert("아이디를 입력하세요");
			} else {
				memIdCheck();
				$("#mem_email").attr("disabled", false);
			}
			
			
		});
		$('#btnCheckc').on('click',function(){
			
			if($("#com_id").val() == null || $("#com_id").val() == '' ) {
				alert("아이디를 입력하세요");
			} else {
				comIdCheck();
				$("#com_email").attr("disabled", false);
			}
			
			
			
			
		});
		
		
		// 메일 중복 확인
		$('#memEmail').on('click',function(){
			
			if($("#mem_email").val() == null || $("#mem_email").val() == '' ) {
				alert("메일을 입력하세요");
			} else {
				memMail();
			}
			
			
		});
		$('#comEmail').on('click',function(){
			
			if($("#com_email").val() == null || $("#com_email").val() == '' ) {
				alert("메일을 입력하세요");
			} else {
				comMail();
			}
			
		});
		
		
		// 개인 주소검색
		/* $('#btnAddr').on('click',function(){ 
			openDaumZipAddress($("#mem_zipAddress"), $("#mem_address"), $("#mem_address2"));
		});  
		// 기업 주소검색 
		$('#btnAddrcom').on('click',function(){ 
			openDaumZipAddress($("#com_zipAddress"), $("#com_address"), $("#com_address2"));
		});   */

		
		
		
		
		// 유효성
		$('#btnAddMem').on('click',function(){ 
			
			if ($(':radio[name="mem_gender"]:checked').length < 1) {
				alert("성별을 선택하세요");
				event.preventDefault();
			}

		}); 
		
		
		
	}); //end ready function
	
	
	// 비밀번호 확인
   	function passwordChk(pw1, pw2, btn, div1, bTag) {
	      $(pw1).addClass('pw');
	      $(pw2).addClass('pw');
	      
	       $('.pw').focusout(function () {
	              var pwd1 = $(pw1).val();
	              var pwd2 = $(pw2).val();
	           
	              if ( pwd1 != '' && pwd2 == '' ) {
	                  null;
	              } else if (pwd1 != "" || pwd2 != "") {
	                  if (pwd1 == pwd2) {
	                      // 비밀번호 일치 이벤트 실행
	                      $(bTag).html(""); 
	                      $(bTag).html("일치합니다.").css("color","blue");
	                      $(div1).css("display", "none");
	                  } else {
	                      // 비밀번호 불일치 이벤트 실행
	                     $(bTag).html("");
	                	 $(bTag).html("일치하지 않습니다.").css("color","red");
	                     $(pw2).focus();
	                     $(div1).css("display", "");
	                  }
	              }
       });
	}
	
	
	
	// 개인/기업 나누기
	function checkUser(user) {
		
		if (user == "개인회원") { 

			passwordChk($("#mem_pw"), $("#mem_pwCheck"), $("#btnAddMem"), $("#memPwd"), $("#membTag"));

			$("#memFrm").attr("action", "${pageContext.request.contextPath}/memRegister");
			
		} else { 
		
			passwordChk($("#com_pw"), $("#com_pwCheck"), $("#btnAddCom"), $("#comPwd"), $("#combTag"));	

			$("#comFrm").attr("action", "${pageContext.request.contextPath}/comRegister");
		}
	}
	
	// 주소검색
	/* function openDaumZipAddress(zipAddress, address, address2 ) {

		new daum.Postcode({

			oncomplete:function(data) {

				$(zipAddress).val(data.zonecode); 

				$(address).val(data.address); // 주소

				$(address2).css("display","");
			}

		}).open();
	} */

	
	// 아이디 중복확인
	function memIdCheck() {
		
		var mem_id = $("#mem_id").val()
		var regexPattern = /^[a-z]+[a-z0-9]{5,19}$/g;

		if (regexPattern.test(mem_id)) {

			$.ajax({
	            url :'${pageContext.request.contextPath}/checkId',
	            type:"post",
	            data : {mem_id : mem_id },
	            
	            success:function(data){
	            	console.log("성공")		
	               if (data == 0) {
	            	   $("#checkId").html("");
	            	   $("#checkId").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#divId");
	            	   
	               } else {
	            	   $("#checkId").html("");
	            	   $("#checkId").html("중복된 아이디입니다.").css("color","red").appendTo("#divId");
	               }
	
	            },error:function(){ alert("실패"); }
	         });
			
		} else {
			 $("#checkId").html("");
      	     $("#checkId").html("영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.").css("color","red").appendTo("#divId");
		}
		
	}
	
	function comIdCheck() {
		
		var com_id = $("#com_id").val()
		var regexPattern = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if (regexPattern.test(com_id)) {

			$.ajax({
	            url :'${pageContext.request.contextPath}/checkIdcom',
	            type:"post",
	            data : {com_id : com_id },
	            
	            success:function(data){
	
	               if (data == 0) {
	            	   $("#checkIdcom").html("");
	            	   $("#checkIdcom").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#comDiv");
	            	   
	               } else {
	            	   $("#checkIdcom").html("");
	            	   $("#checkIdcom").html("중복된 아이디입니다.").css("color","red").appendTo("#comDiv")
	               }
	
	            },error:function(){ alert("실패"); }
	         });
		}else {
			$("#checkIdcom").html("");
     	    $("#checkIdcom").html("영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.").css("color","red").appendTo("#comDiv")
		} 
	}
	
	// 이메일 중복확인
	function memMail() {
		
		var mem_email = $("#mem_email").val(); 
		var regexPattern = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/;
		
		if (regexPattern.test(mem_email)) {
			$.ajax({
	            url :'${pageContext.request.contextPath}/memMail',
	            type:"post",
	            data : {mem_email : mem_email },
	            
	            success:function(data){
					
					console.log(data);
	               if (data == 0) {
	            	   $("#chkMemMail").html("");
	            	   $("#chkMemMail").html("사용 가능한 메일입니다.").css("color","blue").appendTo("#divMemEmail");
	            	   $('#btnAddMem').attr("disabled", false);
	            	   
	               } else if (data == 1){
	            	   $("#chkMemMail").html("");
	            	   $("#chkMemMail").html("중복된 메일입니다.").css("color","red").appendTo("#divMemEmail");
	            	   $('#btnAddMem').attr("disabled", true);
	               } 

	            },error:function(){ alert("실패"); }
	         });
		} else {
			$("#chkMemMail").html("");
     	    $("#chkMemMail").html("형식오류").css("color","red").appendTo("#divMemEmail");
     	    $('#btnAddMem').attr("disabled", true);
		}

		
	}
	
	function comMail() {
		
		var com_email = $("#com_email").val(); 
		var regexPattern = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/;

		if (regexPattern.test(com_email)) {

			$.ajax({
	            url :'${pageContext.request.contextPath}/comMail',
	            type:"post",
	            data : {com_email : com_email },
	            
	            success:function(data){
	
	               if (data == 0) {
	            	   $("#chkComMail").html("");
	            	   $("#chkComMail").html("사용 가능한 메일입니다.").css("color","blue").appendTo("#divComEmail");
	            	   $('#btnAddCom').attr("disabled", false);
	            	   
	               } else if (data == 1){
	            	   $("#chkComMail").html("");
	            	   $("#chkComMail").html("중복된 메일입니다.").css("color","red").appendTo("#divComEmail");
	            	   $('#btnAddCom').attr("disabled", true);
	               } 
	
	            },error:function(){ alert("실패"); }
	         });
		} else {
			$("#chkComMail").html("");
     	    $("#chkComMail").html("형식오류").css("color","red").appendTo("#divComEmail");
     	    $('#btnAddCom').attr("disabled", true);
		}
	}
	
</script>


<section class="login first grey">

	<div style="text-align: center;">
		<div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">개인회원</li>
				<li id="li2" class="tab-link" data-tab="tab-2" >기업회원</li>
			</ul>
		</div>
	</div>


	<div id="tab-1" class="tab-content current" >
		<div class="box-wrapper">
			<div class="box box-border">
				<div class="box-body" style="border: 3px solid #A4B7D4;">
					<h4>회원가입</h4>
					<form:form id="memFrm" name="memFrm" method="post" modelAttribute="member" >
						<div class="form-group" id="divId">
							<div style="text-align: right;">
								<form:radiobutton path="mem_gender" value="남" label="남자"/>&nbsp;&nbsp;
								<form:radiobutton path="mem_gender" value="여" label="여자"/>
								
								
							</div>
							<label>아이디</label><c>*</c>
							<div style="position:relative">
								<form:input type="text" path="mem_id" id="mem_id" Class="form-control" style="papadding: 50px; display: inline-block;" />
								<form:input type="button" path="" value="중복확인" id="btnCheckm" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
								<b id="checkId"></b>
							</div>
						</div>
						<div class="form-group">
							<label>이름</label><c>*</c>
							<form:input type="text" path="mem_name" id="mem_name" class="form-control" />
							<form:errors path="mem_name" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group" id="mem_pw1" >
							<label class="fw">비밀번호<c>*</c></label>
							<form:input type="password" id="mem_pw" path="mem_pw" class="form-control" />
							<b id="membTag"></b>
							<form:errors path="mem_pw" cssClass="error" htmlEscape="false"/> <br>
						</div>
						<div class="form-group" id="memPwd" >
							<label class="fw">비밀번호 확인<c>*</c></label> 
							<form:input type="password" id="mem_pwCheck" path="" class="form-control" />
						</div>

						<div class="form-group">
							<label>생년월일</label> <c>*</c>
							<form:input type="date" path="mem_birth" id="mem_birth" class="form-control" />
							<form:errors path="mem_birth" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group">
							<label>연락처</label> <c>*</c>
							<form:input type="text" path="mem_phone" id="mem_phone" class="form-control" placeholder="ex) 000-0000-0000"/>
							<form:errors path="mem_phone" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group" id="divMemEmail">
							
							
							<div style="position:relative">
							<label>이메일</label><c>*</c>
								<b id="chkMemMail"></b>
								<form:input type="email" id="mem_email" path="mem_email" class="form-control" style="papadding: 50px; " disabled="true" placeholder="ex) xxx@xxx.xx"/>
								<form:input type="button" path="" value="중복확인" id="memEmail" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
							</div>
	
						</div>

						<div class="form-group text-right">
							<button class="btn btn-primary btn-block" id="btnAddMem" disabled="disabled">가입</button>
						</div>
						<div class="form-group text-right">
							<a href="login">로그인</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	
		<div id="tab-2" class="tab-content" >
		<div class="box-wrapper">
			<div class="box box-border">
				<div class="box-body" style="border: 3px solid #A4B7D4;">
					<h4>회원가입</h4>
					<form:form id="comFrm" name="comFrm" method="post" modelAttribute="company" >
						<div id="comDiv" class="form-group">

							<label>아이디</label><c>*</c>
							<div style="position:relative">
								<form:input type="text" path="com_id" id="com_id" class="form-control" style="papadding: 50px; display: inline-block;" />
								<form:input path="" type="button" value="중복확인" id="btnCheckc" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
								<b id="checkIdcom"></b>
							</div>
							
						</div>
						<div class="form-group">
							<label>이름</label> <c>*</c>
							<form:input type="text" path="com_name" id="com_name" class="form-control" />
							<form:errors path="com_name" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group"  >
							<label class="fw">비밀번호<c>*</c></label> 
							<form:input type="password" id="com_pw" path="com_pw" class="form-control" />
							<b id="combTag"></b>
							<form:errors path="com_pw" cssClass="error" htmlEscape="false"/> <br>
						</div>
						
						<div class="form-group" id="comPwd" >
							<label class="fw">비밀번호 확인<c>*</c></label> 
							<form:input type="password" id="com_pwCheck" path="" class="form-control" />
						</div>

						<div class="form-group">
							<label>연락처</label> <c>*</c>
							<form:input type="text" path="com_phone" id="com_phone" class="form-control" placeholder="ex) 000-0000-0000"/>
							<form:errors path="com_phone" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group" id="divComEmail">

							<div style="position:relative">
								<label>이메일</label> <c>*</c>
								<b id="chkComMail"></b>
								<form:input type="email" id="com_email" path="com_email" class="form-control" disabled="true" placeholder="ex) xxx@xxx.xx"/>
								<form:input type="button" path="" value="중복확인" id="comEmail" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
							</div>
							
						</div>

						<div class="form-group text-right">
							<button class="btn btn-primary btn-block" id="btnAddCom" disabled="disabled">가입</button>
						</div>
						<div class="form-group text-right">
							<a href="login">로그인</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	
	
</section>