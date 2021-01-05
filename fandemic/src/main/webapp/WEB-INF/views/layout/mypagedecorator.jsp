<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
<meta name="author" content="Kodinger">
<meta name="keyword"
	content="magz, html5, css3, template, magazine template">
<!-- Shareable -->
<meta property="og:title"
	content="HTML5 & CSS3 magazine template is based on Bootstrap 3" />
<meta property="og:type" content="article" />
<meta property="og:url" content="http://github.com/nauvalazhar/Magz" />
<meta property="og:image"
	content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" />
<title>Enter One</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/skins/all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/demo.css">
<style type="text/css">
#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: absolute;
	width: 250px;
	height: 800px;
	margin-top: 28px;
	margin-left:-281px;
	background: #A4B7D4;
	overflow-x: hidden;
	overflow-y: auto;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #111726;
	font-size: 18px;
	font-weight: 600;
}

.sidebar-nav li a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}
</style>
</head>

<body>
	<header class="primary">
		<div class="firstbar" style="padding: 0px">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="${pageContext.request.contextPath}/"> <img
								src="${pageContext.request.contextPath}/resources/images/logo.png"
								alt="Magz Logo">
							</a>
						</div>
					</div>
					<div class="col-md-6 col-sm-12">
						<form class="search" autocomplete="off">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="q" class="form-control"
										placeholder="Type something here">
									<div class="input-group-btn">
										<button class="btn btn-primary">
											<i class="ion-search"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="help-block">
								<div>Popular:</div>
								<ul>
									<li><a href="#">소속사</a></li>
									<li><a href="#">스타</a></li>
								</ul>
							</div>
						</form>
					</div>
					<div class="col-md-3 col-sm-12 text-right">
						<ul class="nav-icons">
							<c:if test="${member.mem_id eq null and company.com_id eq null }">
								<li><a href="register"><i class="ion-person-add"></i>
										<div>회 원 가 입</div></a></li>
								<li><a href="login"><i class="ion-person"></i>
										<div>로 그 인</div></a></li>
							</c:if>
							<c:if test="${member.mem_id ne null or company.com_id ne null }">
								<!-- <li><a href="#"><i class="ion-person-add"></i><div>마 이 페 이 지</div></a></li> -->
								<li><a href="logout"><i class="ion-person"></i>
										<div>로 그 아 웃</div></a></li>
							</c:if>



						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Start nav -->
		<nav class="menu">
			<div class="container">
				<div class="brand">
					<a href="#"> <img
						src="${pageContext.request.contextPath}/resources/images/logo.png"
						alt="Magz Logo">
					</a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="menu" data-target="#menu-list"><i
						class="ion-navicon-round"></i></a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="sidebar" data-target="#sidebar"><i
						class="ion-ios-arrow-left"></i></a>
				</div>
				<div id="menu-list">
					<ul class="nav-list">
						<li class="for-tablet nav-title"><a>Menu</a></li>
						<li class="for-tablet"><a href="login.html">Login</a></li>
						<li class="for-tablet"><a href="register">Register</a></li>


						<li><a href="${pageContext.request.contextPath}/company">소
								속 사</a></li>


						<li><a href="${pageContext.request.contextPath}/untact">언
								택 트</a></li>


						<!--                      magz-dropdown 클래스 제거 -->
						<li class="dropdown"><a
							href="${pageContext.request.contextPath}/auditionwork">연 습 생<i
								class="ion-ios-arrow-right"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">연습생 등록</a></li>
								<li><a href="#">연습생 활동</a></li>
								<li><a href="#">오디션 공고</a></li>

							</ul></li>
						<!--                      magz-dropdown 클래스 제거 -->
						<li class="dropdown "><a
							href="${pageContext.request.contextPath}/goods">굿 즈 샵<i
								class="ion-ios-arrow-right"></i></a>

							<ul class="dropdown-menu">
								<li><a href="#">CHEERING</a></li>
								<li><a href="#">MUSIC</a></li>
								<li><a href="#">FASHION</a></li>
								<li><a href="#">ACC</a></li>
								<li><a href="#">TECH</a></li>
								<li><a href="#">ETC</a></li>
							</ul></li>

						<li><a href="#">연 예 뉴 스</a></li>

						<li><a href="${pageContext.request.contextPath}/sns">S N
								S</a></li>
						<c:if test="${member.mem_id ne null or company.com_id ne null }">
							<!--  magz-dropdown 클래스 제거ㅊ -->
							<li class="dropdown "><a href="mypagemain">마 이 페 이 지 <i
									class="ion-ios-arrow-right"></i></a>
								<ul class="dropdown-menu">
									<li><a href="myupdate"><i class="icon ion-person"></i>
											회원정보</a></li>
									<li><a href="mystar"><i class="icon ion-heart"></i> 내
											스타</a></li>
									<li><a href="mytrainee"><i class="icon ion-chatbox"></i>
											연습생</a></li>
									<li><a href="mypurchase"><i class="icon ion-key"></i>
											결제내역</a></li>
									<li><a href="myevent"><i class="icon ion-settings"></i>
											이벤트 참여</a></li>
									<li><a href="mymail"><i class="icon ion-chatbox"></i>
											쪽지함</a></li>
									<li><a href="my1o1"><i class="icon ion-chatbox"></i>
											1:1문의 내역</a></li>
									<li class="divider"></li>
									<li><a href="#"><i class="icon ion-log-out"></i> 로그아웃</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End nav -->
	</header>
	<section class="page">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<!--  body 추가 부분 -->

					<div class="col-md-4 sidebar" id="sidebar">
						<!-- 						side bar -->
						<aside>

							<div id="page-wrapper">
								<!-- 사이드바 -->
								<div id="sidebar-wrapper">
									<ul class="sidebar-nav">	
										<li class="sidebar-brand"><a href="mypagemain"
											style="font-size: 30px; font-weight: 900;">마이페이지</a></li>
										<li><a href="myupdate">내정보 수정</a></li>
										<li><a href="mystar">내 스타 관리</a></li>
										<li><a href="mytrainee">연습생 정보 관리</a></li>
										<li><a href="mypurchase">결제내역</a></li>
										<li><a href="myevent">이벤트 참여내역</a></li>
										<li><a href="mymail">쪽지함</a></li>
										<li><a href="my1o1">1:1 문의 내역</a></li>
									</ul>
								</div>
								
								<div style="min-height: 600px; margin-top: -45px;">
									<tiles:insertAttribute name="body" />
								</div>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Start footer -->
	<footer class="footer" style="position: relative;
    z-index: 1;">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="block">
						<h1 class="block-title">Company Info</h1>
						<div class="block-body">
							<figure class="foot-logo">
								<img
									src="${pageContext.request.contextPath}/resources/images/logo.png"
									class="img-responsive" alt="Logo">
							</figure>
							<p class="brand-description">Magz is a HTML5 &amp; CSS3
								magazine template based on Bootstrap 3.</p>
							<a href="page.html" class="btn btn-magz white">About Us <i
								class="ion-ios-arrow-thin-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="block">
						<h1 class="block-title">
							Popular Tags
							<div class="right">
								<a href="#">See All <i class="ion-ios-arrow-thin-right"></i></a>
							</div>
						</h1>
						<div class="block-body">
							<ul class="tags">
								<li><a href="#">HTML5</a></li>
								<li><a href="#">CSS3</a></li>
								<li><a href="#">Bootstrap 3</a></li>
								<li><a href="#">Web Design</a></li>
								<li><a href="#">Creative Mind</a></li>
								<li><a href="#">Standing On The Train</a></li>
								<li><a href="#">at 6.00PM</a></li>
							</ul>
						</div>
					</div>
					<div class="line"></div>

				</div>

				<div class="col-md-3 col-xs-12 col-sm-6">
					<div class="block">
						<h1 class="block-title">Follow Us</h1>
						<div class="block-body">
							<p>Follow us and stay in touch to get the latest news</p>
							<ul class="social trp">
								<li><a href="#" class="facebook"> <svg>
											<rect width="0" height="0" /></svg> <i class="ion-social-facebook"></i>
								</a></li>
								<li><a href="#" class="twitter"> <svg>
											<rect width="0" height="0" /></svg> <i
										class="ion-social-twitter-outline"></i>
								</a></li>
								<li><a href="#" class="youtube"> <svg>
											<rect width="0" height="0" /></svg> <i
										class="ion-social-youtube-outline"></i>
								</a></li>
								<li><a href="#" class="googleplus"> <svg>
											<rect width="0" height="0" /></svg> <i
										class="ion-social-googleplus"></i>
								</a></li>
								<li><a href="#" class="instagram"> <svg>
											<rect width="0" height="0" /></svg> <i
										class="ion-social-instagram-outline"></i>
								</a></li>
								<li><a href="#" class="tumblr"> <svg>
											<rect width="0" height="0" /></svg> <i class="ion-social-tumblr"></i>
								</a></li>
								<li><a href="#" class="dribbble"> <svg>
											<rect width="0" height="0" /></svg> <i class="ion-social-dribbble"></i>
								</a></li>
								<li><a href="#" class="linkedin"> <svg>
											<rect width="0" height="0" /></svg> <i class="ion-social-linkedin"></i>
								</a></li>
								<li><a href="#" class="skype"> <svg>
											<rect width="0" height="0" /></svg> <i class="ion-social-skype"></i>
								</a></li>
								<li><a href="#" class="rss"> <svg>
											<rect width="0" height="0" /></svg> <i class="ion-social-rss"></i>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="line"></div>
					<div class="block">
						<div class="block-body no-margin">
							<ul class="footer-nav-horizontal">
								<li><a href="index.html">Home</a></li>
								<li><a href="#">Partner</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="page.html">About</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<!-- JS -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.migrate.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/jquery-number/jquery.number.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/easescroll/jquery.easeScroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/toast/jquery.toast.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/demo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/e-magz.js"></script>
</body>
</html>