<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.table td{
		vertical-align: middle;
		padding : 0px;
		border : 1px solid #dddddd;
	}
	.table tr{
		background-color:rgba(0,0,0,.05);
	}
	td .cnoc_file{
		position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
		border: 0;
	}
	td .upload-name{
		border: 2px inset rgba(0,0,0,.10);
	}
	td .filebox{
		display:inline-block;
		padding:5px;
		margin:5px;
		border: 2px inset rgba(0,0,0,.05);
		border-radius: 10px;
	}
	td.fileboxi{
		text-align:left;
	}
	td .filetext{
		background-color:rgba(0,0,0,.05);
		border: 2px inset rgba(0,0,0,.10);
		width:100%;
	}
	
	
</style>
<script>

	$(function() {
		// Summernote 출력
		$('#summernote').summernote({
			height : 500
		});
		
		//공지사항/이벤트 분류에 따라 이벤트인원 칼럼 출력
		$(".custom-select").on("change",function(){
			if($(this).val()=="이벤트"){
				$("table .event").css("display","");
			}else{
				$("table .event").css("display","none");
			}
		});
		
		//취소버튼눌렀을경우 공지사항리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/notices";
		});
		
		//등록버튼눌렀을경우 
		$("#btnCnotice-register").on("click",function(){
			/* alert("등록버튼눌림"); */
			CnoticeFormCheck(); //유효성검사
		});
		//파일등록이벤트
		$(".uploadFile").text("${cnotice.cnoc_file}");
		
	 	var fileTarget = $("#file"); //input type=file
	 	fileTarget.on("change",function(){ // 값이변경되면
	 		var cur=$(".fileboxi input[type='file']").val(); //input file의 value값을 받아서
	 		$(".upload-name").val(cur); //업로드파일명 출력 
	 		
	 		
	 	});

	
	 	//이벤트/공지사항 분류 DB값 지정
	 	$(".custom-select option").each(function(){
	 		if($(this).val()=="${cnotice.cnoc_subject}"){
	 			$(this).attr("selected","selected");
	 		}
	 	});
	 	
	 	//분류가 이벤트일경우 , 이벤트참가인원 출력
	 	if($(".custom-select").val()=="이벤트"){
			$(".event").css("display","");
		}
	});//end ready function
	
	function CnoticeFormCheck(){
		if($("table .notice-title").val()==null || $("table .notice-title").val()==''){
			alert("제목을 입력하세요.")
			$("table .notice-title").focus();
			event.preventDefault();
		}
		else if($("table .notice-content").val()==null||$("table .notice-content").val()==''){
			alert("내용을 입력하세요.")
			$("table .notice-content").focus();
			event.preventDefault();
		}
		
	}
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>공지사항</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">공지사항</li>
              <li class="breadcrumb-item">상세보기</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-outline card-info">
				<div class="card-header">
					<h3 class="card-title">공지사항/이벤트</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="${pageContext.request.contextPath}/management/noticesUpdate" enctype="multipart/form-data">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="text" name="cnoc_no" value="${cnotice.cnoc_no }"/>
										<input type="text" name="com_id" value="${cnotice.com_id }"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr width="100%">
									<td width="10%" align="left"><label>분류</label></td>
									<td width="40%" align="left">								
				                        <select name="cnoc_subject" class="custom-select" style="width: auto;" value="${cnotice.cnoc_subject }">
				                        
				                          <option>공지사항</option>
				                          <option>이벤트</option>				                          
				                        </select>                     
				                        
									</td>
									<td class="event" style="display: none;"><label>인원</label></td>
									<td class="event" style="display: none;"><input type="text" name="cnoc_limit" class="form-control"/ value="${cnotice.cnoc_limit}"> </td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>제목</label></td>
									<td colspan="3"><input type="text" name="cnoc_title" class="notice-title form-control"
										placeholder="글 제목" maxlength="50" value="${cnotice.cnoc_title}"/>
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>내용</label></td>
									<td colspan="3">
										<textarea id="summernote" name="cnoc_content" class="notice-content" >${cnotice.cnoc_content}</textarea>
									</td>
								</tr>
								
								<tr>
									<td colspan="1" align="left"><label>첨부파일</label></td>
									<td colspan="3" class="fileboxi">
										<label class="filebox" for="file">업로드</label>
                      					<input type="file" id="file" class="cnoc_file" name="uploadFile" multiple>
                      					<input class="upload-name" value="파일선택"><br>
                      					<c:forTokens items="${cnotice.cnoc_file }" delims=" " var="cnotice">
                      						<input type="text" class="filetext" name="file_name" style="display:;" value="${cnotice }"><!--  여기 업로드된 파일 조회목록 -->
                      					</c:forTokens>
                      					
                      					              					
                     				</td>
								</tr>
								<tr>
									<td colspan="1" align="left"><label>메인홍보용배너</label></td>
									<td colspan="3">
                      					<input type="file" name="uploadbanner" >                     					
                     				</td>
								</tr>
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnCnotice-register" class="btn btn-primary pull-right">수정</button>
									<input type="button" id="btnCancel" class="btn btn-primary pull-right" value="취소" /></td>
								</tr>
							</tbody>
						</table>
						
					</form>
					
				</div>
				<div class="card-footer">
					Visit <a href="https://github.com/summernote/summernote/">Summernote</a>
					documentation for more examples and information about the plugin.
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>

	<!-- ./row -->
</section>

