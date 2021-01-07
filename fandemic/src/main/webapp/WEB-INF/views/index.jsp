<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>

<script>
	$(function() {
		$('ul.tabs li').click(function() {

			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');

		});

		var ctx = $('#myChart');
		var myChart = new Chart(ctx, {
				type : 'pie',
				data : {
					labels : [ '${stCnt[0].ST_NAME}', '${stCnt[1].ST_NAME}', '${stCnt[2].ST_NAME}' ],
					datasets : [ {
						label : '#',
						data : [ '${stCnt[0].CNT}', '${stCnt[1].CNT}', '${stCnt[2].CNT}' ],
						backgroundColor: ["rgba(255, 0, 0, 0.5)", "rgba(100, 255, 0, 0.5)", "rgba(200, 50, 255, 0.5)"]
						
					} ]
				},
				options : {
					 title: {
		                    display: true,
		                    text: 'FAN CLUB TOP3'
	                }
				}
			});

	});
</script>

<style>

.inputimg {
    margin: 10px;
    border-radius: 70%;
    object-fit: cover;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;  /* 이거 다르게 주면 줄바꿈 될거같은데 */
	padding: 10px 25px;
	cursor: pointer;
	/* border : 1px solid #8ac121; */
}

ul.tabs li.current {
	border-top: 2px solid #8ac121;
	background: #FDFDFD;
}

ul.tabs li.current span {
	color: #8ac121;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: inherit;
}

.sub_area {
	margin: 14px 8px 0 4px;
}

.sc_login {
	padding: 20px 16px 30px 30px;
	background-color: #f7f9fa;
	border: 1px solid #dae1e6;
}

.look_box {
	padding: 10px 5px 5px 10px;
	float: left;
}

.link_look {
	
}

.link_join {
	float: right;
	color: #505050;
}

.ffffsf {
	background-size: auto !important;
}
</style>



<section class="home">

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="headline">
					<div class="nav" id="headline-nav">
						<a class="left carousel-control" role="button" data-slide="prev">
							<span class="ion-ios-arrow-left" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" role="button" data-slide="next">
							<span class="ion-ios-arrow-right" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
					<div class="owl-carousel owl-theme" id="headline">
						<div class="item">
							<a href="#"><div class="badge">Tip!</div> Vestibulum ante
								ipsum primis in faucibus orci</a>
						</div>
						<div class="item">
							<a href="#">Ut rutrum sodales mauris ut suscipit</a>
						</div>
					</div>
				</div>

				<div class="owl-carousel owl-theme slide" id="featured">

					<c:forEach items="${goods}" var="gos">
						<div class="item">
							<article class="featured">
								<div class="overlay"></div>
								<figure class="ffffsf">
									<img
										src="${pageContext.request.contextPath}/images/goods/${gos.go_pic} "
										alt="TICKET" style="width: 500px; height: 800px;">
								</figure>
								<div class="details">
									<div style="color: white;" class="#">${gos.st_id}</div>
									<h1>
										<a href="#">${gos.go_name}</a>
									</h1>
									<!-- 클릭한 행사 상세페이지로 이동시킬꺼야 -->
									<div style="color: white;" class="#">${fn:substring(gos.go_untsdate,0,10)}</div>
								</div>
							</article>
						</div>
					</c:forEach>

				</div>
				<div class="line">
					<div>????</div>
				</div>
				<!-- 차트 -->
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div align="left" class="chart-container" style="position: relative; padding: 20px">
							<canvas id="myChart"  width="300" height="250"></canvas>
						</div>
					</div>
					
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="chart-container" style="position: relative; padding: 20px">
							<h1>SNS</h1>
						</div>
					</div>
				</div>
				
					
				<div class="banner">
					<a href="#"> <img
						src="${pageContext.request.contextPath}/resources/images/ads.png"
						alt="Sample Article">
					</a>
				</div>
				<a href="sns">sns로 가기</a>
				<div class="line transparent little"></div>
				<div class="row">
					<div class="col-md-6 col-sm-6 trending-tags">
						<h1 class="title-col">Trending Tags</h1>
						<div class="body-col">
							<ol class="tags-list">
								<li><a href="#">HTML5</a></li>
								<li><a href="#">CSS3</a></li>
								<li><a href="#">JavaScript</a></li>
								<li><a href="#">jQuery</a></li>
								<li><a href="#">Bootstrap</a></li>
								<li><a href="#">Responsive</a></li>
								<li><a href="#">AuteIrure</a></li>
								<li><a href="#">Voluptate</a></li>
								<li><a href="#">Veit</a></li>
								<li><a href="#">Reprehenderit</a></li>
							</ol>
						</div>
					</div>
					<div class="col-md-6 col-sm-6">
						<h1 class="title-col">
							Hot News
							<div class="carousel-nav" id="hot-news-nav">
								<div class="prev">
									<i class="ion-ios-arrow-left"></i>
								</div>
								<div class="next">
									<i class="ion-ios-arrow-right"></i>
								</div>
							</div>
						</h1>
						<div class="body-col vertical-slider" data-max="4"
							data-nav="#hot-news-nav" data-item="article">
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img09.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Lifestyle</a>
											</div>
											<div class="time">December 22, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img01.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Lifestyle</a>
											</div>
											<div class="time">December 22, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img05.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Lifestyle</a>
											</div>
											<div class="time">December 22, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img02.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Fusce ullamcorper elit at felis
												cursus suscipit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Travel</a>
											</div>
											<div class="time">December 21, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img13.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">International</a>
											</div>
											<div class="time">December 20, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img08.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Aliquam et metus convallis
												tincidunt velit ut rhoncus dolor</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Computer</a>
											</div>
											<div class="time">December 19, 2016</div>
										</div>
									</div>
								</div>
							</article>
						</div>
					</div>
				</div>
				<div class="line top">
					<div>Just Another News</div>
				</div>
				<div class="row">
					<article class="col-md-12 article-list">
						<div class="inner">
							<figure>
								<a href="single.html"> <img
									src="${pageContext.request.contextPath}/resources/images/news/img11.jpg"
									alt="Sample Article">
								</a>
							</figure>
							<div class="details">
								<div class="detail">
									<div class="category">
										<a href="#">Film</a>
									</div>
									<div class="time">December 19, 2016</div>
								</div>
								<h1>
									<a href="single.html">Donec consequat arcu at ultrices
										sodales quam erat aliquet diam</a>
								</h1>
								<p>Donec consequat, arcu at ultrices sodales, quam erat
									aliquet diam, sit amet interdum libero nunc accumsan nisi.</p>
								<footer>
									<a href="#" class="love"><i
										class="ion-android-favorite-outline"></i>
										<div>273</div></a> <a class="btn btn-primary more"
										href="single.html">
										<div>More</div>
										<div>
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
									</a>
								</footer>
							</div>
						</div>
					</article>
					<article class="col-md-12 article-list">
						<div class="inner">
							<div class="badge">Sponsored</div>
							<figure>
								<a href="single.html"> <img
									src="${pageContext.request.contextPath}/resources/images/news/img02.jpg"
									alt="Sample Article">
								</a>
							</figure>
							<div class="details">
								<div class="detail">
									<div class="category">
										<a href="#">Travel</a>
									</div>
									<div class="time">December 18, 2016</div>
								</div>
								<h1>
									<a href="single.html">Maecenas accumsan tortor ut velit
										pharetra mollis</a>
								</h1>
								<p>Maecenas accumsan tortor ut velit pharetra mollis. Proin
									eu nisl et arcu iaculis placerat sollicitudin ut est. In
									fringilla dui.</p>
								<footer>
									<a href="#" class="love"><i
										class="ion-android-favorite-outline"></i>
										<div>4209</div></a> <a class="btn btn-primary more"
										href="single.html">
										<div>More</div>
										<div>
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
									</a>
								</footer>
							</div>
						</div>
					</article>
					<article class="col-md-12 article-list">
						<div class="inner">
							<figure>
								<a href="single.html"> <img
									src="${pageContext.request.contextPath}/resources/images/news/img03.jpg"
									alt="Sample Article">
								</a>
							</figure>
							<div class="details">
								<div class="detail">
									<div class="category">
										<a href="#">Travel</a>
									</div>
									<div class="time">December 16, 2016</div>
								</div>
								<h1>
									<a href="single.html">Nulla facilisis odio quis gravida
										vestibulum Proin venenatis pellentesque arcu</a>
								</h1>
								<p>Nulla facilisis odio quis gravida vestibulum. Proin
									venenatis pellentesque arcu, ut mattis nulla placerat et.</p>
								<footer>
									<a href="#" class="love active"><i
										class="ion-android-favorite"></i>
										<div>302</div></a> <a class="btn btn-primary more"
										href="single.html">
										<div>More</div>
										<div>
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
									</a>
								</footer>
							</div>
						</div>
					</article>
					<article class="col-md-12 article-list">
						<div class="inner">
							<figure>
								<a href="single.html"> <img
									src="${pageContext.request.contextPath}/resources/images/news/img09.jpg"
									alt="Sample Article">
								</a>
							</figure>
							<div class="details">
								<div class="detail">
									<div class="category">
										<a href="#">Healthy</a>
									</div>
									<div class="time">December 16, 2016</div>
								</div>
								<h1>
									<a href="single.html">Maecenas blandit ultricies lorem id
										tempor enim pulvinar at</a>
								</h1>
								<p>Maecenas blandit ultricies lorem, id tempor enim pulvinar
									at. Curabitur sit amet tortor eu ipsum lacinia malesuada.</p>
								<footer>
									<a href="#" class="love"><i
										class="ion-android-favorite-outline"></i>
										<div>783</div></a> <a class="btn btn-primary more"
										href="single.html">
										<div>More</div>
										<div>
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
									</a>
								</footer>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="col-xs-6 col-md-4 sidebar" id="sidebar"
				style="padding-top: 80px;">
				<div class="sidebar-title for-tablet">Sidebar</div>
				<aside>
					<div class="aside-body">
						<div class="featured-author">
							<div class="featured-author-inner">

								<!-- 로그인 -->
								<c:if
									test="${sessionScope.member.mem_id eq null and sessionScope.company.com_id eq null }">
									<div class="sc_login" >
										<div class="sub_area">
											<a class="btn btn-primary btn-block" id="homeLogin"
												href="${pageContext.request.contextPath}/login">로그인</a>
											<div style="padding-bottom: 20px;">
												<a href="${pageContext.request.contextPath}/register"
													class="link_join" style="padding-top: 10px;">회원가입 </a>
											</div>
										</div>
									</div>
								</c:if>
								<!-- 프로필 -->
								<c:if
									test="${sessionScope.member.mem_id ne null or sessionScope.company.com_id ne null }">
									<div class="featured-author-cover"
										style="background-image: url('images/news/img15.jpg');">
										<div class="badges">
											<div class="badge-item">
												<i class="ion-star"></i> Featured
											</div>
										</div>
										<div class="featured-author-center">
											<figure class="featured-author-picture">

												<c:if
													test="${sessionScope.member.mem_pic ne null and sessionScope.member.mem_type eq 0 }">
													<img src="${sessionScope.member.mem_pic}"
														alt="member_profile">
												</c:if>
												<c:if
													test="${sessionScope.member.mem_pic eq null and sessionScope.company.com_pic eq null }">
													<img
														src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
														alt="no-profile">
												</c:if>

												<c:if
													test="${sessionScope.member.mem_pic ne null and sessionScope.company.com_pic eq null and sessionScope.member.mem_type eq 1}">
													<img
														src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.member.mem_pic}"
														alt="member_profile">
												</c:if>

												<c:if
													test="${sessionScope.company.com_pic ne null and sessionScope.member.mem_pic eq null }">
													<img
														src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.company.com_pic}"
														alt="company_profile">
												</c:if>
											</figure>
											<div class="featured-author-info">
												<h2 class="name" style="color: black;">${sessionScope.member.mem_name}</h2>
												<c:if test="${sessionScope.member.mem_type ne 0 }">
													<div class="desc" style="color: #f73f52;">${sessionScope.member.mem_id}</div>
												</c:if>
											</div>
										</div>


									</div>
									<!-- 내 스타목록 -->
									<div class="featured-author-center" align="center">
										<img class="inputimg"
											src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
											alt="member_profile"
											style="width: 50px; height: 50px; margin: 0px 15px 0px 15px">
										<img class="inputimg"
											src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
											alt="member_profile"
											style="width: 50px; height: 50px; margin: 0px 15px 0px 15px">
										<img class="inputimg"
											src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
											alt="member_profile"
											style="width: 50px; height: 50px; margin: 0px 15px 0px 15px">
									</div>
									<div class="featured-author-center" align="center">
										<b class="name"
											style="color: black; margin: 0px 25px 0px 25px;">스타1</b> <b
											class="name" style="color: black; margin: 0px 20px 0px 20px;">스타2</b>
										<b class="name"
											style="color: black; margin: 0px 25px 0px 25px;">스타3</b>
									</div>
								</c:if>

							</div>
						</div>



					</div>
				</aside>
				<aside>
					<div align="center">
						<ul class="tabs" style="padding-bottom: 10px">
							<li class="tab-link current" data-tab="tab-1"><a
								style="color: black;"><span>멜론차트</span></a></li>
							<li class="tab-link" data-tab="tab-2"><a
								style="color: black;"><span>박스오피스</span></a></li>
							<li class="tab-link" data-tab="tab-3"><a
								style="color: black;"><span>시청률</span></a></li>
						</ul>
					</div>

					<!-- 멜론차트 -->
					<div id="tab-1" class="tab-content current">
						<div align="right">
							<a style="color: #00b523;" href="https://www.melon.com/chart/index.htm" target="_blank"> >바로가기</a>
						</div>
						<table>
							<c:forEach items="${melon}" var="mel">
								<tr style="border-bottom: 1pt solid #8ac121;">
									<td style="padding: 5px; width: 50px"><h6>${mel.no}</h6></td>
									<td style="padding: 5px"><img src="${mel.img}" alt="melon"
										style="width: 35px; height: 35px;"></td>
									<td style="padding: 8px"><c:if
											test="${fn:length(mel.song) > 20 }">
											<div>${fn:substring(mel.song,0,20)}...</div>
										</c:if> <c:if test="${fn:length(mel.sing) > 20 }">
											<div>${fn:substring(mel.sing,0,20)}...</div>
										</c:if> <c:if test="${fn:length(mel.song) < 20 }">
											<div>${mel.song}</div>
										</c:if> <c:if test="${fn:length(mel.sing) < 20 }">
											<div>${mel.sing}</div>
										</c:if></td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<div id="tab-2" class="tab-content" style="width: 90%">
						<div align="right">
							<a style="color: #00b523;" href="https://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do" target="_blank"> >바로가기</a>
						</div>
						<table style="width: 100%">
							<c:forEach items="${movie}" var="mv">
								<tr style="border-bottom: 1pt solid #8ac121;">
									<td style="padding: 5px; width: 50px"><h6>${mv.rank}</h6></td>
									<td style="padding: 5px;">
										<div>${mv.movieNm}</div>
										<div>${mv.openDt}</div>
									</td>
									<td style="padding: 5px;">${mv.audiCnt}명</td>

								</tr>
							</c:forEach>
						</table>
					</div>

					<div id="tab-3" class="tab-content" style="width: 90%">
					<div align="right">
						<a style="color: #00b523;" href="http://www.nielsenkorea.co.kr/tv_terrestrial_day.asp?menu=Tit_1&sub_menu=1_1&area=01" target="_blank"> >바로가기</a>
					</div>
						<table style="width: 100%">
							<c:forEach items="${rating}" var="ra">
								<tr style="border-bottom: 1pt solid #8ac121;">
									<td style="padding: 5px; width: 50px"><h6>${ra.no}</h6></td>
									<td style="padding: 5px;">
										<c:if test="${fn:length(ra.name) > 10 }">
											<div>${fn:substring(ra.name,0,10)}...</div>
										</c:if> 
										<c:if test="${fn:length(ra.name) <= 10 }">
											<div>${ra.name}</div>
										</c:if>
									</td>
									<td style="padding: 5px;">${ra.ct}</td>
									<td style="padding: 5px;">${ra.rat}%</td>

								</tr>
							</c:forEach>
						</table>
					</div>



				</aside>
				<aside>
					<div class="aside-body">
						<form class="newsletter">
							<div class="icon">
								<i class="ion-ios-email-outline"></i>
								<h1>Newsletter</h1>
							</div>
							<div class="input-group">
								<input type="email" class="form-control email"
									placeholder="Your mail">
								<div class="input-group-btn">
									<button class="btn btn-primary">
										<i class="ion-paper-airplane"></i>
									</button>
								</div>
							</div>
							<p>By subscribing you will receive new articles in your
								email.</p>
						</form>
					</div>
				</aside>
				<aside>
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li class="active"><a href="#recomended"
							aria-controls="recomended" role="tab" data-toggle="tab"> <i
								class="ion-android-star-outline"></i> Recomended
						</a></li>
						<li><a href="#comments" aria-controls="comments" role="tab"
							data-toggle="tab"> <i class="ion-ios-chatboxes-outline"></i>
								Comments
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="recomended">
							<article class="article-fw">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img16.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="time">December 31, 2016</div>
											<div class="category">
												<a href="category.html">Sport</a>
											</div>
										</div>
										<h1>
											<a href="single.html">Donec congue turpis vitae mauris</a>
										</h1>
										<p>Donec congue turpis vitae mauris condimentum luctus. Ut
											dictum neque at egestas convallis.</p>
									</div>
								</div>
							</article>
							<div class="line"></div>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img05.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Lifestyle</a>
											</div>
											<div class="time">December 22, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img02.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Fusce ullamcorper elit at felis
												cursus suscipit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Travel</a>
											</div>
											<div class="time">December 21, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img
											src="${pageContext.request.contextPath}/resources/images/news/img10.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Healthy</a>
											</div>
											<div class="time">December 20, 2016</div>
										</div>
									</div>
								</div>
							</article>
						</div>
						<div class="tab-pane comments" id="comments">
							<div class="comment-list sm">
								<div class="item">
									<div class="user">
										<figure>
											<img
												src="${pageContext.request.contextPath}/resources/images/img01.jpg"
												alt="User Picture">
										</figure>
										<div class="details">
											<h5 class="name">Mark Otto</h5>
											<div class="time">24 Hours</div>
											<div class="description">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="user">
										<figure>
											<img
												src="${pageContext.request.contextPath}/resources/images/img01.jpg"
												alt="User Picture">
										</figure>
										<div class="details">
											<h5 class="name">Mark Otto</h5>
											<div class="time">24 Hours</div>
											<div class="description">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="user">
										<figure>
											<img
												src="${pageContext.request.contextPath}/resources/images/img01.jpg"
												alt="User Picture">
										</figure>
										<div class="details">
											<h5 class="name">Mark Otto</h5>
											<div class="time">24 Hours</div>
											<div class="description">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</aside>
				<aside>
					<h1 class="aside-title">
						Videos
						<div class="carousel-nav" id="video-list-nav">
							<div class="prev">
								<i class="ion-ios-arrow-left"></i>
							</div>
							<div class="next">
								<i class="ion-ios-arrow-right"></i>
							</div>
						</div>
					</h1>
					<div class="aside-body">
						<ul class="video-list"
							data-youtube='"carousel":true, "nav": "#video-list-nav"'>
							<li><a data-youtube-id="SBjQ9tuuTJQ" data-action="magnific"></a></li>
							<li><a data-youtube-id="9cVJr3eQfXc" data-action="magnific"></a></li>
							<li><a data-youtube-id="DnGdoEa1tPg" data-action="magnific"></a></li>
						</ul>
					</div>
				</aside>
				<aside id="sponsored">
					<h1 class="aside-title">Sponsored</h1>
					<div class="aside-body">
						<ul class="sponsored">
							<li><a href="#"> <img
									src="${pageContext.request.contextPath}/resources/images/sponsored.png"
									alt="Sponsored">
							</a></li>
							<li><a href="#"> <img
									src="${pageContext.request.contextPath}/resources/images/sponsored.png"
									alt="Sponsored">
							</a></li>
							<li><a href="#"> <img
									src="${pageContext.request.contextPath}/resources/images/sponsored.png"
									alt="Sponsored">
							</a></li>
							<li><a href="#"> <img
									src="${pageContext.request.contextPath}/resources/images/sponsored.png"
									alt="Sponsored">
							</a></li>
						</ul>
					</div>
				</aside>
			</div>
		</div>
	</div>
</section>

<section class="best-of-the-week">
	<div class="container">
		<h1>
			<div class="text">Best Of The Week</div>
			<div class="carousel-nav" id="best-of-the-week-nav">
				<div class="prev">
					<i class="ion-ios-arrow-left"></i>
				</div>
				<div class="next">
					<i class="ion-ios-arrow-right"></i>
				</div>
			</div>
		</h1>
		<div class="owl-carousel owl-theme carousel-1">
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img
							src="${pageContext.request.contextPath}/resources/images/news/img03.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 11, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">tempor interdum Praesent tincidunt</a>
						</h2>
						<p>Praesent tincidunt, leo vitae congue molestie.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img
							src="${pageContext.request.contextPath}/resources/images/news/img16.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 09, 2016</div>
							<div class="category">
								<a href="category.html">Sport</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Maecenas porttitor sit amet turpis a
								semper</a>
						</h2>
						<p>Proin vulputate, urna id porttitor luctus, dui augue
							facilisis lacus.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img
							src="${pageContext.request.contextPath}/resources/images/news/img15.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Lifestyle</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Fusce ac odio eu ex volutpat
								pellentesque</a>
						</h2>
						<p>Vestibulum ante ipsum primis in faucibus orci luctus</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img
							src="${pageContext.request.contextPath}/resources/images/news/img14.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Nulla facilisis odio quis gravida
								vestibulum</a>
						</h2>
						<p>Proin venenatis pellentesque arcu, ut mattis nulla placerat
							et.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img
							src="${pageContext.request.contextPath}/resources/images/news/img01.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Fusce Ullamcorper Elit At Felis Cursus
								Suscipit</a>
						</h2>
						<p>Proin venenatis pellentesque arcu, ut mattis nulla placerat
							et.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img
							src="${pageContext.request.contextPath}/resources/images/news/img11.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Donec consequat arcu at ultrices
								sodales</a>
						</h2>
						<p>Proin venenatis pellentesque arcu, ut mattis nulla placerat
							et.</p>
					</div>
				</div>
			</article>
		</div>
	</div>
</section>


</body>
</html>