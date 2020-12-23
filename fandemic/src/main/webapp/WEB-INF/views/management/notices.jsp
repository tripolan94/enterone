<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.center {
  text-align: center;
}

.pagination {
  display: inline-block;
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

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<script>
	$(function() {
		
		cnoticeList();//공지사항 목록요청
		$(".pagination a").on("click",function(){
			$(".pagination a").removeClass("active");
			$(this).addClass("active");
		});
		
		$(".btn-register").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/noticesInsertForm";
		});
	}); //end document ready
	
	//공지사항 목록 조회 요청
	function cnoticeList() {
		$.ajax({
			url:'${pageContext.request.contextPath}/management/noticesList', //요청할 url
			type:'POST',
			//contentType:'application/json;charset=utf-8',
			dataType:'json', //값이 넘어오는 형식
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:cnoticeListResult
		});
	}//end cnoticeList
	
	function cnoticeListResult(data){
		console.log(data);
		$("tbody").empty();
		$.each(data,function(idx,item){//idx=index, item=value
			$('<tr>')
			.append($('<td>').html('<input type="checkbox">'))
			.append($('<td>').html(item.cnoc_no))
			.append($('<td>').html(item.cnoc_title))
			.append($('<td>').html(item.com_id))
			.append($('<td>').html(item.cnoc_time))
			.append($('<td>').html(item.cnoc_subject))
			.appendTo('tbody');
			
		});//end each
	}//end cnoticeListResult
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
              <li class="breadcrumb-item active">공지사항</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!--  공지 게시판 -->
    <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><!-- 공지/이벤트 --></h3>
              </div>
              <!-- ./card-header -->
              <div class="card-body">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th></th>
                      <th>번호</th>
                      <th>제목</th>
                      <th>글쓴이</th>
                      <th>등록일</th>
                      <th>분류(이벤트/공지)</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- <tr data-widget="expandable-table" aria-expanded="false">
                      <td><input type="checkbox"></td>
                      <td>1</td>
                      <td>니얼굴쩔어 !!!!!!!!!!!!!!!</td>
                      <td>YG관리자</td>
                      <td>2020-12-17</td>
                      <td>공지사항</td>
                    </tr>     -->               
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div>
              	<div class="center">
				  <div class="pagination">
					  <a href="#">&laquo;</a>
					  <a href="#" class="active">1</a>
					  <a href="#">2</a>
					  <a href="#">3</a>
					  <a href="#">4</a>
					  <a href="#">5</a>
					  <a href="#">&raquo;</a>
				  </div>
				</div>
              	<div class="cnotices-button">
              		<button class="btn-register">등록</button>
              		<button class="btn-update">수정</button>
              		<button class="btn-delete">삭제</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
</div>