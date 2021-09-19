<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script>
	
	var checkIdDuplicated = false;
	var randStr = "";
	
	
	$(document).ready(function() {
		
		
		
		$('#checkIdBtn').click(function() {
			checkId();
		})

	
		function checkId() {
			var id = document.getElementById('id').value;
			if (registerForm.id.value == "") {

				$('#checkIdSpan').text("아이디를 입력해주세요")
				return false;
			}

			$.ajax(
					{'type' : 'post',
					'data' : {
						"id" : id
					},
					'url' : '${ pageContext.request.contextPath }/register/checkId',
					'success' : function(data) {
						if (data == true) {
							$('#checkIdSpan').text("사용 가능한 아이디입니다")
							checkIdDuplicated = true;
						} else {
							$('#checkIdSpan').text("이미 사용중인 아이디입니다")
						}
					},
					'error' : function() {
						console.log(data)
						console.log("에러")
					}
			})
		}
		
		
		
		
		
		
	})
		
	
</script>
<script>
var phoneCertiCheck=false;


function validateForm() {
	var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식

	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var email = document.getElementById("email");

	// ------------ 이메일 까지 -----------

	if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
		return false;
	}

	if (!checkIdDuplicated) {
		alert("아이디 중복체크를 먼저해주세요");
		return false;
	}

	if (registerForm.name.value == "") {
		alert("이름을 입력해주세요");
		registerForm.name.focus();
		return false;
	}
	if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
		return false;
	}

	if (registerForm.pw.value != registerForm.checkpw.value) {
		alert("비밀번호가 다릅니다. 다시 확인해주세요.");
		registerForm.checkpw.value = "";
		registerForm.checkpw.focus();
		return false;
	}

	if (email.value == "") {
		alert("이메일을 입력해주세요");
		email.focus();
		return false;
	}

	if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}

	if (registerForm.phone.value == "") {
		alert("휴대전화 번호를 입력해주세요.");
		return false;
	}
	
	if(phoneCertiCheck==false){
		alert("휴대전화 인증을 진행해주세요.")
		return false;
	}

	if (registerForm.postcode.value == "") {
		alert("우편번호를 입력해주세요.");
		return false;
	}
	if (registerForm.detailAddress.value == "") {
		alert("상세주소를 선택해주세요");
		return false;
	}

	alert("회원가입이 완료되었습니다.");
}

	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		return false;
	}

function phoneCertificationBtnClick(){
	var div = document.getElementById('certificationDiv');
	var phone = document.getElementById("phone").value;
	
	
	if(phone==""){
		$('#phoneCertificationSpan').text("휴대전화 번호를 먼저 입력해주세요.")
		return false;
	}

	$('#phoneCertificationSpan').text("")
	div.style.display = 'block';
	console.log(phone)
	
	$.ajax(
			{'type' : 'post',
			'data' : {
				"phone" : phone
			},
			'url' : '${ pageContext.request.contextPath }/register/smsCertification',
			'success' : function(data) {
				randStr = data;
				console.log(randStr)
			},
			'error' : function() {
				console.log(data)
				console.log("에러")
			}
	}) 
	
}

function phoneCertificationCheck(){
	var phoneCerti = document.getElementById("phoneCertificationInput").value;
	
	if(phoneCerti==randStr){			
		$('#phoneCertificationResultSpan').text("휴대전화 인증을 성공했습니다.")
		phoneCertiCheck = true;
		return true;
	}else{
		$('#phoneCertificationResultSpan').text("인증번호를 다시 확인해주세요.")
		return false;
	}
}

</script>




<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>

	<header>
		<jsp:include page="../include/topMenu.jsp" />
	</header>
	<!-- header-end -->

	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_1">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>회원가입</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->

	<!-- Start Sample Area -->
	<section class="sample-text-area align-center">
		<div class="container box_1170 align-center">
			<div class="col-lg-8 col-md-8 align-center">
				<p class="sample-text txt-left">
				<h3 class="mb-20">다이나믹하나는 다음과 같은 기능을 제공합니다.</h3>
				<div class="">
					<ul class="unordered-list">
						<li>간단한 검사로 내게 맞는 카드를 찾아줍니다.
						<li>실시간 카드내역을 가장 쉽게 보여줍니다.
						<li>월 카드 내역서를 레포트로 보내드립니다.
						<li>회원님의 모든 거래를 분석해드립니다.</li>

					</ul>
				</div>

			</div>
		</div>
	</section>
	<!-- End Sample Area -->


	<div class="container box_1170">
		<div class="" id="phoneCertification">
			<div class="col-lg-8 col-md-8 align-center">
				<br>
				<h3 class="mb-30 txt-center">회원 가입</h3>
				<form:form name="registerForm" onsubmit="return validateForm();"
					method="post" modelAttrubute="memberVO">
					<div class="mt-10">
						<div>
							<p class="txt-left">아이디</p>
						</div>

						<div class="form-select" style="display: flex">
							<input type="text" id="id" name="id" placeholder=""
								onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'"
								class="single-input" style="width: 60%" value="test11"> <span><button
									type="button" class="genric-btn info circle" id="checkIdBtn">중복확인</button>
							</span>
						</div>
						<span id="checkIdSpan"></span>

					</div>

					<div class="mt-10">
						<p class="txt-left">이름</p>
						<input type="text" id="name" name="name" placeholder=""
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Name'" class="single-input" value="김김김">
					</div>
					<div class="mt-10">
						<p class="txt-left">비밀번호</p>
						<input type="password" id="pw" name="pw" placeholder="10자리 이하로 입력"
							onfocus="this.placeholder = ''" onblur="this.placeholder = 'Pw'"
							class="single-input" value="qwer1234">
					</div>
					<div class="mt-10">
						<p class="txt-left">비밀번호 확인</p>
						<input type="password" id="checkpw" name="pw_check"
							placeholder="비밀번호와 동일하게 입력" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Pw_check'" class="single-input" value="qwer1234">
					</div>
					<div class="mt-10">
						<p class="txt-left">주민등록번호</p>
						<input type="text" id="rrn" name="rrn" placeholder="'-'를 제외하고 입력"
							onfocus="this.placeholder = ''" onblur="this.placeholder = 'Rrn'"
							class="single-input" value="9501011360718">
					</div>
					<div class="mt-10">
						<p class="txt-left">생년월일</p>
						<input type="text" id="birthday" name="birthday" placeholder="yyyymmdd 형식으로 입력"
							onfocus="this.placeholder = ''" onblur="this.placeholder = 'Birthday'"
							class="single-input" value="19950602">
					</div>
					<div class="mt-10">
						<div class="form-select">
							<p class="txt-left">성별</p>
							<select id="gender" name="gender">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</div>
					</div>
					<div class="mt-10">
						<p class="txt-left">이메일</p>
						<input type="text" id="email" name="email"
							placeholder="'-'를 제외하고 입력" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Email'" class="single-input">
					</div>


					<div class="mt-10">
						<div class="form-select">
							<p class="txt-left">내/외국인</p>
							<select id="isNative" name="isNative">
								<option value="N">내국인</option>
								<option value="F">외국인</option>
							</select>
						</div>
					</div>
					<div class="mt-10">
						<div>
							<p class="txt-left">휴대전화 번호</p>
						</div>
						<div class="form-select" style="display: flex">
							<input type="text" id="phone" name="mobileNo"
								placeholder="'-' 제외하고 입력" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Phone'" class="single-input"
								style="width: 60%"> <span><button type="button"
									id="phoneCertificationBtn" class="genric-btn info circle" onclick ="phoneCertificationBtnClick()">인증</button></span>
						</div>
						<span id="phoneCertificationSpan"></span>
					</div>
					<div class="mt-10" id="certificationDiv" style="display: none">
						<div>
							<p class="txt-left">인증번호</p>
						</div>
						<div class="form-select" style="display: flex">
							<input type="text" id="phoneCertificationInput" name="phoneCertification"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'PhoneCertification'" class="single-input"
								style="width: 60%"> <span><button type="button" 
								id="phoneCertificationCheckBtn" class="genric-btn info circle" onclick="phoneCertificationCheck()">인증확인</button></span>
						</div>
						<span id="phoneCertificationResultSpan">인증번호를 입력해주세요.</span>
					</div>


					<div class="mt-10">
						<div>
							<p class="txt-left">우편번호</p>
						</div>

						<div class="form-select" style="display: flex">
							<input type="text" id="postcode" name="postcode"
								placeholder="우편번호 찾기를 클릭하여 검색" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Postcode'" class="single-input"
								style="width: 60%"> <span><input type="button"
								class="genric-btn info circle" onclick="execDaumPostcode()"
								value="우편번호 찾기" /> </span>
						</div>


					</div>
					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼" />
					</div>					

					<div class="mt-10">
						<p class="txt-left">주소</p>
						<input type="text" id="address" name="address" placeholder=""
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Address'" class="single-input">
					</div>

					<div class="mt-10">
						<p class="txt-left">상세주소</p>
						<input type="text" id="detailAddress" name="addressDetail"
							placeholder="" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Address'" class="single-input">
					</div>




					<div class="mt-30">
						<div class="col-md-offset-3 col-md-9 align-center" align="center">
							<button id="btn-signup" type="submit"
								class="genric-btn info circle align-center txt-center">회원가입</button>

						</div>
					</div>
					<div class="mt-30"></div>


				</form:form>
			</div>
		</div>
	</div>















	<!-- Start Button -->
	<section class="button-area">
		<div class="container box_1170 border-top-generic">
			<h3 class="text-heading">Sample Buttons</h3>
			<div class="button-group-area">
				<a href="#" class="genric-btn default">Default</a> <a href="#"
					class="genric-btn primary">Primary</a> <a href="#"
					class="genric-btn success">Success</a> <a href="#"
					class="genric-btn info">Info</a> <a href="#"
					class="genric-btn warning">Warning</a> <a href="#"
					class="genric-btn danger">Danger</a> <a href="#"
					class="genric-btn link">Link</a> <a href="#"
					class="genric-btn disable">Disable</a>
			</div>
			<div class="button-group-area mt-10">
				<a href="#" class="genric-btn default-border">Default</a> <a
					href="#" class="genric-btn primary-border">Primary</a> <a href="#"
					class="genric-btn success-border">Success</a> <a href="#"
					class="genric-btn info-border">Info</a> <a href="#"
					class="genric-btn warning-border">Warning</a> <a href="#"
					class="genric-btn danger-border">Danger</a> <a href="#"
					class="genric-btn link-border">Link</a> <a href="#"
					class="genric-btn disable">Disable</a>
			</div>
			<div class="button-group-area mt-40">
				<a href="#" class="genric-btn default radius">Default</a> <a
					href="#" class="genric-btn primary radius">Primary</a> <a href="#"
					class="genric-btn success radius">Success</a> <a href="#"
					class="genric-btn info radius">Info</a> <a href="#"
					class="genric-btn warning radius">Warning</a> <a href="#"
					class="genric-btn danger radius">Danger</a> <a href="#"
					class="genric-btn link radius">Link</a> <a href="#"
					class="genric-btn disable radius">Disable</a>
			</div>
			<div class="button-group-area mt-10">
				<a href="#" class="genric-btn default-border radius">Default</a> <a
					href="#" class="genric-btn primary-border radius">Primary</a> <a
					href="#" class="genric-btn success-border radius">Success</a> <a
					href="#" class="genric-btn info-border radius">Info</a> <a href="#"
					class="genric-btn warning-border radius">Warning</a> <a href="#"
					class="genric-btn danger-border radius">Danger</a> <a href="#"
					class="genric-btn link-border radius">Link</a> <a href="#"
					class="genric-btn disable radius">Disable</a>
			</div>
			<div class="button-group-area mt-40">
				<a href="#" class="genric-btn default circle">Default</a> <a
					href="#" class="genric-btn primary circle">Primary</a> <a href="#"
					class="genric-btn success circle">Success</a> <a href="#"
					class="genric-btn info circle">Info</a> <a href="#"
					class="genric-btn warning circle">Warning</a> <a href="#"
					class="genric-btn danger circle">Danger</a> <a href="#"
					class="genric-btn link circle">Link</a> <a href="#"
					class="genric-btn disable circle">Disable</a>
			</div>
			<div class="button-group-area mt-10">
				<a href="#" class="genric-btn default-border circle">Default</a> <a
					href="#" class="genric-btn primary-border circle">Primary</a> <a
					href="#" class="genric-btn success-border circle">Success</a> <a
					href="#" class="genric-btn info-border circle">Info</a> <a href="#"
					class="genric-btn warning-border circle">Warning</a> <a href="#"
					class="genric-btn danger-border circle">Danger</a> <a href="#"
					class="genric-btn link-border circle">Link</a> <a href="#"
					class="genric-btn disable circle">Disable</a>
			</div>
			<div class="button-group-area mt-40">
				<a href="#" class="genric-btn default circle arrow">Default<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn primary circle arrow">Primary<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn success circle arrow">Success<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn info circle arrow">Info<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn warning circle arrow">Warning<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn danger circle arrow">Danger<span
					class="lnr lnr-arrow-right"></span></a>
			</div>
			<div class="button-group-area mt-10">
				<a href="#" class="genric-btn default-border circle arrow">Default<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn primary-border circle arrow">Primary<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn success-border circle arrow">Success<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn info-border circle arrow">Info<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn warning-border circle arrow">Warning<span
					class="lnr lnr-arrow-right"></span></a> <a href="#"
					class="genric-btn danger-border circle arrow">Danger<span
					class="lnr lnr-arrow-right"></span></a>
			</div>
			<div class="button-group-area mt-40">
				<a href="#" class="genric-btn primary e-large">Extra Large</a> <a
					href="#" class="genric-btn success large">Large</a> <a href="#"
					class="genric-btn primary">Default</a> <a href="#"
					class="genric-btn success medium">Medium</a> <a href="#"
					class="genric-btn primary small">Small</a>
			</div>
			<div class="button-group-area mt-10">
				<a href="#" class="genric-btn primary-border e-large">Extra
					Large</a> <a href="#" class="genric-btn success-border large">Large</a>
				<a href="#" class="genric-btn primary-border">Default</a> <a
					href="#" class="genric-btn success-border medium">Medium</a> <a
					href="#" class="genric-btn primary-border small">Small</a>
			</div>
		</div>
	</section>
	<!-- End Button -->

	<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<h3 class="mb-30">Left Aligned</h3>
				<div class="row">
					<div class="col-md-3">
						<img
							src="${ pageContext.request.contextPath }/resources/img/elements/d.jpg"
							alt="" class="img-fluid">
					</div>
					<div class="col-md-9 mt-sm-20">
						<p>Recently, the US Federal government banned online casinos
							from operating in America by making it illegal to transfer money
							to them through any US bank or payment system. As a result of
							this law, most of the popular online casino networks such as
							Party Gaming and PlayTech left the United States. Overnight,
							online casino players found themselves being chased by the
							Federal government. But, after a fortnight, the online casino
							industry came up with a solution and new online casinos started
							taking root. These began to operate under a different business
							umbrella, and by doing that, rendered the transfer of money to
							and from them legal. A major part of this was enlisting
							electronic banking systems that would accept this new
							clarification and start doing business with me. Listed in this
							article are the electronic banking systems that accept players
							from the United States that wish to play in online casinos.</p>
					</div>
				</div>
			</div>
			<div class="section-top-border text-right">
				<h3 class="mb-30">Right Aligned</h3>
				<div class="row">
					<div class="col-md-9">
						<p class="text-right">Over time, even the most sophisticated,
							memory packed computer can begin to run slow if we donât do
							something to prevent it. The reason why has less to do with how
							computers are made and how they age and more to do with the way
							we use them. You see, all of the daily tasks that we do on our PC
							from running programs to downloading and deleting software can
							make our computer sluggish. To keep this from happening, you need
							to understand the reasons why your PC is getting slower and do
							something to keep your PC running at its best. You can do this
							through regular maintenance and PC performance optimization
							programs</p>
						<p class="text-right">Before we discuss all of the things that
							could be affecting your PCâs performance, letâs talk a little
							about what symptoms</p>
					</div>
					<div class="col-md-3">
						<img
							src="${ pageContext.request.contextPath }/resources/img/elements/d.jpg"
							alt="" class="img-fluid">
					</div>
				</div>
			</div>
			<div class="section-top-border">
				<h3 class="mb-30">Definition</h3>
				<div class="row">
					<div class="col-md-4">
						<div class="single-defination">
							<h4 class="mb-20">Definition 01</h4>
							<p>Recently, the US Federal government banned online casinos
								from operating in America by making it illegal to transfer money
								to them through any US bank or payment system. As a result of
								this law, most of the popular online casino networks</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="single-defination">
							<h4 class="mb-20">Definition 02</h4>
							<p>Recently, the US Federal government banned online casinos
								from operating in America by making it illegal to transfer money
								to them through any US bank or payment system. As a result of
								this law, most of the popular online casino networks</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="single-defination">
							<h4 class="mb-20">Definition 03</h4>
							<p>Recently, the US Federal government banned online casinos
								from operating in America by making it illegal to transfer money
								to them through any US bank or payment system. As a result of
								this law, most of the popular online casino networks</p>
						</div>
					</div>
				</div>
			</div>
			<div class="section-top-border">
				<h3 class="mb-30">Block Quotes</h3>
				<div class="row">
					<div class="col-lg-12">
						<blockquote class="generic-blockquote">âRecently,
							the US Federal government banned online casinos from operating in
							America by making it illegal to transfer money to them through
							any US bank or payment system. As a result of this law, most of
							the popular online casino networks such as Party Gaming and
							PlayTech left the United States. Overnight, online casino players
							found themselves being chased by the Federal government. But,
							after a fortnight, the online casino industry came up with a
							solution and new online casinos started taking root. These began
							to operate under a different business umbrella, and by doing
							that, rendered the transfer of money to and from them legal. A
							major part of this was enlisting electronic banking systems that
							would accept this new clarification and start doing business with
							me. Listed in this article are the electronic bankingâ</blockquote>
					</div>
				</div>
			</div>
			<div class="section-top-border">
				<h3 class="mb-30">Table</h3>
				<div class="progress-table-wrap">
					<div class="progress-table">
						<div class="table-head">
							<div class="serial">#</div>
							<div class="country">Countries</div>
							<div class="visit">Visits</div>
							<div class="percentage">Percentages</div>
						</div>
						<div class="table-row">
							<div class="serial">01</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f1.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-1" role="progressbar"
										style="width: 80%" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<div class="table-row">
							<div class="serial">02</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f2.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-2" role="progressbar"
										style="width: 30%" aria-valuenow="30" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<div class="table-row">
							<div class="serial">03</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f3.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-3" role="progressbar"
										style="width: 55%" aria-valuenow="55" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<div class="table-row">
							<div class="serial">04</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f4.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-4" role="progressbar"
										style="width: 60%" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<div class="table-row">
							<div class="serial">05</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f5.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-5" role="progressbar"
										style="width: 40%" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<div class="table-row">
							<div class="serial">06</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f6.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-6" role="progressbar"
										style="width: 70%" aria-valuenow="70" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<div class="table-row">
							<div class="serial">07</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f7.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-7" role="progressbar"
										style="width: 30%" aria-valuenow="30" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
						<div class="table-row">
							<div class="serial">08</div>
							<div class="country">
								<img
									src="${ pageContext.request.contextPath }/resources/img/elements/f8.jpg"
									alt="flag">Canada
							</div>
							<div class="visit">645032</div>
							<div class="percentage">
								<div class="progress">
									<div class="progress-bar color-8" role="progressbar"
										style="width: 60%" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="section-top-border">
				<div class="row">
					<div class="col-md-4">
						<h3 class="mb-20">Image Gallery</h3>
						<div class="typography">
							<h1>This is header 01</h1>
							<h2>This is header 02</h2>
							<h3>This is header 03</h3>
							<h4>This is header 04</h4>
							<h5>This is header 01</h5>
							<h6>This is header 01</h6>
						</div>
					</div>
					<div class="col-md-4 mt-sm-30">
						<h3 class="mb-20">Unordered List</h3>
						<div class="">
							<ul class="unordered-list">
								<li>Fta Keys</li>
								<li>For Women Only Your Computer Usage</li>
								<li>Facts Why Inkjet Printing Is Very Appealing
									<ul>
										<li>Addiction When Gambling Becomes
										<li>sdfa
											<ul>
												<li>Protective Preventative Maintenance</li>
											</ul>
										</li>
									</ul>
								</li>
								<li>Dealing With Technical Support 10 Useful Tips</li>
								<li>Make Myspace Your Best Designed Space</li>
								<li>Cleaning And Organizing Your Computer</li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 mt-sm-30">
						<h3 class="mb-20">Ordered List</h3>
						<div class="">
							<ol class="ordered-list">
								<li><span>Fta Keys</span></li>
								<li><span>For Women Only Your Computer Usage</span></li>
								<li><span>Facts Why Inkjet Printing Is Very
										Appealing</span>
									<ol class="ordered-list-alpha">
										<li><span>Addiction When Gambling Becomes</span>
											<ol class="ordered-list-roman">
												<li><span>Protective Preventative Maintenance</span></li>
											</ol></li>
									</ol></li>
								<li><span>Dealing With Technical Support 10 Useful
										Tips</span></li>
								<li><span>Make Myspace Your Best Designed Space</span></li>
								<li><span>Cleaning And Organizing Your Computer</span></li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<div class="section-top-border">
				<div class="row">
					<div class="col-lg-8 col-md-8">
						<h3 class="mb-30">Form Element</h3>
						<form action="#">
							<div class="mt-10">
								<input type="text" name="first_name" placeholder="First Name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'First Name'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<input type="text" name="last_name" placeholder="Last Name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Last Name'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<input type="text" name="last_name" placeholder="Last Name"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Last Name'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<input type="email" name="EMAIL" placeholder="Email address"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Email address'" required
									class="single-input">
							</div>
							<div class="input-group-icon mt-10">
								<div class="icon">
									<i class="fa fa-thumb-tack" aria-hidden="true"></i>
								</div>
								<input type="text" name="address" placeholder="Address"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Address'" required
									class="single-input">
							</div>
							<div class="input-group-icon mt-10">
								<div class="icon">
									<i class="fa fa-plane" aria-hidden="true"></i>
								</div>
								<div class="form-select" id="default-select"">
									<select>
										<option value=" 1">City</option>
										<option value="1">Dhaka</option>
										<option value="1">Dilli</option>
										<option value="1">Newyork</option>
										<option value="1">Islamabad</option>
									</select>

								</div>
							</div>
							<div class="input-group-icon mt-10">
								<div class="icon">
									<i class="fa fa-globe" aria-hidden="true"></i>
								</div>
								<div class="form-select" id="default-select"">
									<select>
										<option value=" 1">Country</option>
										<option value="1">Bangladesh</option>
										<option value="1">India</option>
										<option value="1">England</option>
										<option value="1">Srilanka</option>
									</select>
								</div>
							</div>

							<div class="mt-10">
								<textarea class="single-textarea" placeholder="Message"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Message'" required></textarea>
							</div>
							<!-- For Gradient Border Use -->
							<!-- <div class="mt-10">
										<div class="primary-input">
											<input id="primary-input" type="text" name="first_name" placeholder="Primary color" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Primary color'">
											<label for="primary-input"></label>
										</div>
									</div> -->
							<div class="mt-10">
								<input type="text" name="first_name" placeholder="Primary color"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Primary color'" required
									class="single-input-primary">
							</div>
							<div class="mt-10">
								<input type="text" name="first_name" placeholder="Accent color"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Accent color'" required
									class="single-input-accent">
							</div>
							<div class="mt-10">
								<input type="text" name="first_name"
									placeholder="Secondary color" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Secondary color'" required
									class="single-input-secondary">
							</div>
						</form>
					</div>
					<div class="col-lg-3 col-md-4 mt-sm-30">
						<div class="single-element-widget">
							<h3 class="mb-30">Switches</h3>
							<div class="switch-wrap d-flex justify-content-between">
								<p>01. Sample Switch</p>
								<div class="primary-switch">
									<input type="checkbox" id="default-switch"> <label
										for="default-switch"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>02. Primary Color Switch</p>
								<div class="primary-switch">
									<input type="checkbox" id="primary-switch" checked> <label
										for="primary-switch"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>03. Confirm Color Switch</p>
								<div class="confirm-switch">
									<input type="checkbox" id="confirm-switch" checked> <label
										for="confirm-switch"></label>
								</div>
							</div>
						</div>
						<div class="single-element-widget mt-30">
							<h3 class="mb-30">Selectboxes</h3>
							<div class="default-select" id="default-select">
								<select>
									<option value=" 1">English</option>
									<option value="1">Spanish</option>
									<option value="1">Arabic</option>
									<option value="1">Portuguise</option>
									<option value="1">Bengali</option>
								</select>
							</div>
						</div>
						<div class="single-element-widget mt-30">
							<h3 class="mb-30">Checkboxes</h3>
							<div class="switch-wrap d-flex justify-content-between">
								<p>01. Sample Checkbox</p>
								<div class="primary-checkbox">
									<input type="checkbox" id="default-checkbox"> <label
										for="default-checkbox"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>02. Primary Color Checkbox</p>
								<div class="primary-checkbox">
									<input type="checkbox" id="primary-checkbox" checked> <label
										for="primary-checkbox"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>03. Confirm Color Checkbox</p>
								<div class="confirm-checkbox">
									<input type="checkbox" id="confirm-checkbox"> <label
										for="confirm-checkbox"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>04. Disabled Checkbox</p>
								<div class="disabled-checkbox">
									<input type="checkbox" id="disabled-checkbox" disabled>
									<label for="disabled-checkbox"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>05. Disabled Checkbox active</p>
								<div class="disabled-checkbox">
									<input type="checkbox" id="disabled-checkbox-active" checked
										disabled> <label for="disabled-checkbox-active"></label>
								</div>
							</div>
						</div>
						<div class="single-element-widget mt-30">
							<h3 class="mb-30">Radios</h3>
							<div class="switch-wrap d-flex justify-content-between">
								<p>01. Sample radio</p>
								<div class="primary-radio">
									<input type="checkbox" id="default-radio"> <label
										for="default-radio"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>02. Primary Color radio</p>
								<div class="primary-radio">
									<input type="checkbox" id="primary-radio" checked> <label
										for="primary-radio"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>03. Confirm Color radio</p>
								<div class="confirm-radio">
									<input type="checkbox" id="confirm-radio" checked> <label
										for="confirm-radio"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>04. Disabled radio</p>
								<div class="disabled-radio">
									<input type="checkbox" id="disabled-radio" disabled> <label
										for="disabled-radio"></label>
								</div>
							</div>
							<div class="switch-wrap d-flex justify-content-between">
								<p>05. Disabled radio active</p>
								<div class="disabled-radio">
									<input type="checkbox" id="disabled-radio-active" checked
										disabled> <label for="disabled-radio-active"></label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Align Area -->

	<!-- footer start -->
	<footer class="footer">
		<jsp:include page="../include/bottom.jsp" />
	</footer>
	<!--/ footer end  -->



	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
	</script>
	<script>
		var element_wrap = document.getElementById('wrap');
	</script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script
		src="${ pageContext.request.contextPath }/resources/js/custom/postcodeFunction.js"></script>
</body>
</html>