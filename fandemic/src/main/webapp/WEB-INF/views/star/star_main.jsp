<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>



	$(function() {	
		var id = "${sessionScope.member.mem_id}"
		var fan = "${fan.mem_id}"
		var fan_block = "${fan.fan_block}"
		start(id, fan);
		
		//채널 가입 시 중복 체크
		$('#btnCheckc').on('click',function(){
			if($("#channelName").val() == null || $("#channelName").val() == '' ) {
				alert("닉네임을 입력하세요");
				$("#channelName").focus();
			} else {
				FanNameCheck();
			}
		});
		
		//채널 가입 모달 값 초기화
		$('#joinModal').on('click',function(){
			$("#channelName").val("")
			$("#checkFanName").html("")
     	   	$("#fanReturn").html("F")
		});
		
		
		//채널 가입 버튼
		$("#channelJoinAction").on("click",function(){
			if($("#fanReturn").html()=="T"){
				channelJoinAction();
			}else{
				alert("닉네임 중복검사를 해주세요");
			}
		});
		
		//메인에서 다 못들어오게 필터링
		$("body").on('click', 'a',function(e){
			if(id != fan && id != null){
				$("a").removeAttr("href")
				alert("채널에 가입해주세요");
				event.stopImmediatePropagation()
			}else if(fan_block == 1){
				$("a").removeAttr("href")
				alert("차단된 사용자입니다");
				event.stopImmediatePropagation()
			}
		});
	});
	
	function start(id,fan){
		if(id != fan && id != null){
			$("#joinModal").show();
			$("#btnChannelChoose").hide();
		}
	} 
	
	// 닉네임 중복확인
	function FanNameCheck() {
		var st_id = "${stVo.st_id}"
		var fan_name = $("#channelName").val()
		var regexPattern = /^[가-힣a-zA-Z0-9]{1,9}$/g;

		if (regexPattern.test(fan_name)) {

			$.ajax({
	            url :'${pageContext.request.contextPath}/star/fanNameCheck',
	            type:"GET",
	            data : {fan_name : fan_name, st_id : st_id},
	            
	            success:function(data){
	            	console.log("성공")		
	               if (data == 0) {
	            	   $("#checkFanName").html(""); 
	            	   $("#checkFanName").html("사용 가능한 닉네임입니다.").css("color","blue").appendTo("#divId");
	            	   $("#fanReturn").html("T");
	            	   
	            	   
	               } else {
	            	   $("#checkFanName").html("");
	            	   $("#checkFanName").html("사용 중인 닉네임입니다.").css("color","red").appendTo("#divId");
	            	   $("#fanReturn").html("F");
	               }
	
	            },error:function(){ alert("접속 실패"); }
	         });
			
		} else {
			 $("#checkFanName").html("");
      	     $("#checkFanName").html("부적절한 단어입니다.").css("color","red").appendTo("#divId");
      	     $("#fanReturn").html("F");
		}
	}
	
	//채널 가입
	function channelJoinAction() {
		var st_id = "${stVo.st_id}";
		var st_name = "${stVo.st_name}";
		var fan_name = $("#channelName").val();		
		$.ajax({
		    url: "${pageContext.request.contextPath}/star/fanBoard/fanJoin", 
		    type: 'POST', 
		    data : { st_id : st_id , fan_name : fan_name }, 
		    error:function(xhr, status, message) {
		        alert(" status: "+status+" er:"+message);
		    },
		    success: function(response) {
		    	if(response == true) {
		    		var text = st_name + "의 채널에 오신것을 환영합니다!"
		    		alert(text);
		    		location.href = "${pageContext.request.contextPath}/star/" + st_id;//새로고침
		    	}
		    }
		});
	}
</script>
	
	
	
	
<section class="ftco-section-no-padding bg-light">
	<div class="hero-wrap">
		<div class="d-flex align-items-center js-fullheight">
			<div class="author-image text img d-flex">
				<section class="home-slider js-fullheight owl-carousel">
					<div class="slider-item js-fullheight"
						style="background-image: url(${pageContext.request.contextPath}/images/star/${stVo.st_banner});">
					</div>
					<div class="slider-item js-fullheight"
						style="background-image:url(${pageContext.request.contextPath}/images/star/${stVo.st_pic});">
					</div>
				</section>
			</div>
		</div>
	</div>
</section>
<section class="ftco-section-number ftco-counter img"
	id="section-counter"
	style="background-image: url(resourcesStar/images/bg_1.jpg);">
	<div class="container">
		<div class="row justify-content-start">
			<div class="col-md-10">
				<div class="row">
					<div
						class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text d-flex align-items-center">
								<strong class="number" data-number="${countFan}">0</strong> <span>채널
									팬</span>
							</div>
						</div>
					</div>
					<div
						class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text d-flex align-items-center">
								<strong class="number" data-number="${countFboard}">0</strong> <span>팬
									게시물</span>
							</div>
						</div>
					</div>
					<div
						class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text d-flex align-items-center">
								<strong class="number" data-number="${countReply}">0</strong> <span>댓글</span>
							</div>
						</div>
					</div>
					<div
						class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text d-flex align-items-center">
								<strong class="number" data-number="${countSboard}">0</strong> <span>스타
									게시물</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<!-- 스타최신글 -->
	<div class="container">
		<div class="row justify-content-center mb-2 pb-3">
			<div
				class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
				<h2 class="mb-4">Today Star</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="blog-entry ftco-animate d-md-flex">
					<a href="${pageContext.request.contextPath}/star/starBoard/view/${sbVoNew.sbo_no}"
						class="img img-2 starBoardimg" id="${sbVoNew.sbo_no}"></a>
					<div class="text text-2 p-4">
						<h3 class="mb-2">
							<a href="${pageContext.request.contextPath}/star/starBoard/view/${sbVoNew.sbo_no}">${sbVoNew.sbo_title}</a>
						</h3>
						<div class="meta-wrap">
							<p class="meta">
								<span>${sbVoNew.sbo_time}</span>
							</p>
						</div>
						<div class="mb-4 sboardPrev" id="sbo_content">
							<div>${sbVoNew.sbo_content}</div>
						</div>
						<p>
							<a
								href="${pageContext.request.contextPath}/star/starBoard/view/${sbVoNew.sbo_no}"
								class="btn-custom">Read More <span
								class="ion-ios-arrow-forward"></span></a>
						</p>
					</div>
				</div>
			</div>

			<script>
				var imgView = function() {
					var sentence = '${sbVoNew.sbo_content}';
					var start = sentence.indexOf('src="');
					var end = sentence.indexOf('"', start + 5);
					var list = sentence.substring(start + 5, end);

					if (list.length < 130) {//이미지 없을때 대체 이미지로 해당 스타의 아이콘 출력
						var icon = '${stVo.st_icon}';
						var depa = '${pageContext.request.contextPath}/images/star/' + icon;
						$("#${sbVoNew.sbo_no}").css("background-image", "url(" + depa + ")");
					} else if (list != null) {
						$("#${sbVoNew.sbo_no}").css("background-image", "url(" + list + ")");
					}
					$("#sbo_content p img").remove("")//게시글 미리 보기에서 이미지 삭제 
					$("#sbo_content br").remove("")
					$("#sbo_content a").remove("")
					$("#sbo_content span").removeAttr("style")
					$("#sbo_content p").removeAttr("style")
				}
				imgView();
			</script>

		</div>
	</div>
	
	
	<!-- 유저 조회수 5건 -->
	<div class="container">
		<div class="row justify-content-center mb-2 pb-3">
			<div
				class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
				<h2 class="mb-4">Best Fan</h2>
			</div>
		</div>
		<div class ="row">
			<table class ="table trFboardList">
				<thead>
					<tr>
						<th class = "thList0">#</th>
						<th class = "thList1">제목</th>
						<th class = "thList2">작성자</th>
						<th class = "thList3">작성일</th>
						<th class = "thList4">조회수</th>
					</tr>
				</thead>
				<c:forEach var="fboard" items="${fbVoList}">
					<tbody>
						<tr class = "candahar">
							<td class = "boardListColor">${fboard.fbo_sub_no}</td>
							<td>[${fboard.fbo_subject}] <span>${fboard.fbo_title}</span></td>
							<td class = "boardCenter">${fboard.fan_name}</td>
							<td class = "boardListColor">${fboard.fbo_time}</td>
							<td class = "boardListColor">${fboard.fbo_views}</td>
						</tr>
					</tbody>
				</c:forEach>
					<tr>
						<td colspan =5>
						<div class="row justify-content-end">
							<a
							href="${pageContext.request.contextPath}/star/fanBoard/${stVo.st_id}"
							class="btn-custom">View More <span
							class="ion-ios-arrow-forward"></span></a>
						</div>
								
						</td>
					</tr>
			</table>
		</div>
	</div>
</section>


<section class="ftco-section instagram">
	<div class="container">
		<div class="row justify-content-center mb-2 pb-3">
			<div
				class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
				<h2 class="mb-4">Follow me on Channel</h2>
			</div>
		</div>
		<div class="row no-gutters">
			
			<c:forEach var="sboard" items="${sbVoPicList}" begin="1" end = "10">
				
				<div class="col-sm-12 col-md ftco-animate">
					<a href ="" class="insta-img image-popup" id="${sboard.sbo_no}">
						<div class="icon d-flex justify-content-center">
							<span class="icon-instagram align-self-center"></span>
						</div>
					</a>
				</div>
				
				<script>
					var imgView = function() {
						var sentence = '${sboard.sbo_content}';
						var start = sentence.indexOf('src="');
						var end = sentence.indexOf('"', start + 5);
						var list = sentence.substring(start + 5, end);
						
						if (list.length < 130) {
							$("#${sboard.sbo_no}").parent().remove();
						} else if(list != null){
							$("#${sboard.sbo_no}").css("background-image", "url(" + list + ")");
							$("#${sboard.sbo_no}").attr("href", list);
						}
					}
					imgView();
				</script>
				
				
			</c:forEach>
		</div>
	</div>
</section>