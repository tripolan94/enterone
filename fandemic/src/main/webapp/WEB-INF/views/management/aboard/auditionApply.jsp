<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.center {
  text-align: center;
}

.pagination {
  display: ;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: black;
  color: white;
  border: 1px solid black;
}
div #dataTable_filter{
		text-align:right;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<link
   href="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
      crossorigin="anonymous" />
   
<script
      src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
      crossorigin="anonymous"></script>
   
   <!-- 페이지네이션 날로먹는 빌드 끝 -->
<script>
	$(function() {
		
		auditionApplyList();//소속사 각오디션별 지원현황 리스트
		$(".pagination a").on("click",function(){
			$(".pagination a").removeClass("active");
			$(this).addClass("active");
		});
		
		
		
		//소속사 각오디션별 지원자 정보 상세보기
		var table = $('#dataTable');//datatable(공지사항목록)을 읽어옴
		table.on("click","tr a",function(){ //게시물 tr에 제목 클릭했을때 ~
			 //alert($(this).parent().prev().text());//클릭한 tr에 대한 게시물번호 
			var aud_no = $(this).parent().prev().text();
			location.href="${pageContext.request.contextPath}/management/aboard/auditionApplyDetail?aud_no="+aud_no;	
		});//end 게시물 제목 클릭
		
		
		//체크박스 클릭 이벤트
		table.on("click","input[type=checkbox]",function(){		 	
			if(!$(this).attr("checked")){
				$(this).attr("checked",true);
			}else{
				$(this).attr("checked",false)
			}
		});
		
		
		//소속사 오디션 공지사항 삭제
		$(".btn-delete").on("click",function(){
			 $.ajax({
				url:"${pageContext.request.contextPath}/management/aboard/auditionApplyDelete",
				type:"POST",
				data: $("#frm1").serialize(),
				dataType: 'json', //결과값 Json형태로
				success: function(response) {
			    	if(response != null && response !="") {
			    		alert("해당 항목이 삭제되었습니다.");
			    		$('#dataTable').DataTable().clear().destroy();
			    		aboardList();
			    	}  
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			});//end ajax
		});
		
		
	}); //end document ready
	
	//각 오디션별 지원형황 리스트 요청
	function auditionApplyList() {
		var com_id = "${company.com_id }";
		var abo_no = "${audition.abo_no}";
		$.ajax({
			url:'${pageContext.request.contextPath}/management/aboard/auditionApplyList', //요청할 url
			type:'POST',
			data: {com_id:com_id, abo_no:abo_no},
			//contentType:'application/json;charset=utf-8',
			dataType:'json', //값이 넘어오는 형식
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:auditionApplyListResult
		});
	}//end cnoticeList
	
	function auditionApplyListResult(data){
		/* console.log(data); */
		$("tbody").empty();
		$.each(data,function(idx,item){//idx=index, item=value
			$('<tr>').attr("class","cnoticeTr")
			.append($('<td>').html('<input type="checkbox" name="aud_nos" value="'+item.aud_no+'">'))
			.append($('<td>').html(item.aud_no))
			.append($('<td>').html('<a href="#">'+item.mem_id+'</a>'))
			.append($('<td>').html(item.mem_name))
			.append($('<td>').html(item.aud_type))
			.append($('<td>').html(item.aud_height))
			.append($('<td>').html(item.aud_weight))
			.appendTo('tbody');
			
		});//end each
		$('#dataTable').DataTable();
		
		/* $("input[type=checkbox]").click(function(){
			alert("뭔데")
		}) */
	}//end cnoticeListResult
</script>
     <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>오디션 지원자</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">오디션공지</li>
              <li class="breadcrumb-item active">오디션 지원자</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!--  공지 게시판 -->
    <form method="POST" id="frm1">
    <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><!-- 공지/이벤트 --></h3>
              </div>
              <!-- ./card-header -->
              <div class="card-body">
              
                <table id="dataTable" class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th></th>
                      <th>번호</th>
                      <th>회원ID</th>
                      <th>지원자이름</th>
                      <th>지원분야</th>
                      <th>키</th>
                      <th>몸무게</th>
                    </tr>
                  </thead>
                  <tbody>
                              <!-- body 들어간데 ~ -->   
                  </tbody>
                </table>
           
              </div>
              <!-- /.card-body -->
              <div>
              	<!-- 페이지네이션 들어가는 자리-->
              	<div class="cnotices-button">
              		<!-- <button type="button" class="btn-register">등록</button> -->
              		<!--  <button class="btn-update">수정</button>-->
              		<button type="button" class="btn-delete">삭제</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
    </form>
</div>