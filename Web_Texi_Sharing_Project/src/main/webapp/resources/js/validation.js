function CheckAddUser() {//먼저 아이디 중복부터 확인하는 것.
	var userId = document.getElementById("userId");
	// 중복 체크 먼저 수행하고 나머지 validation 실행
	checkDuplicateId(userId.value, function (isDuplicate) {
		if (isDuplicate) {
			alert("[아이디]\n이미 사용 중인 아이디입니다.");
			userId.focus();
			return;
		}
		// 중복이 아니면 나머지 유효성 검사 실행
		if (!runFullValidation()) {
			return;
		}
		document.newUser.submit();
	});
}
function runFullValidation() {
	var userId = document.getElementById("userId");
	var password = document.getElementById("password");
	var name = document.getElementById("name");
	var age = document.getElementById("age");
	var birthYear = document.getElementById("birthYear");
	var birthMonth = document.getElementById("birthMonth");
	var birthDay = document.getElementById("birthDay");
		
	// 아이디 체크: 4~10자, 영문+숫자
	if (!check(/^[A-Za-z0-9]{4,10}$/, userId, "[아이디]\n영문자와 숫자 조합으로 4~10자까지 입력하세요."))
		return false;

	// 비밀번호 체크
	if (!checkPassword(password.value)) {
		alert("[비밀번호]\n8~20자 사이의 길이로,\n대문자, 소문자, 숫자, 특수문자를 각각 1개 이상 포함해야 합니다.");
		password.focus();
		return false;
	}

	// 이름 체크: 한글만 허용 (2~20자)
	if (!check(/^[가-힣]{2,20}$/, name, "[이름]\n한글로 2~20자까지 입력하세요."))
		return false;

	// 나이 체크: 숫자 + 10~100 사이
	if (age.value.length == 0 || isNaN(age.value)) {
		alert("[나이]\n숫자만 입력하세요.");
		age.focus();
		return false;
	}
	if (age.value < 10 || age.value > 100) {
		alert("[나이]\n10세 이상 100세 이하만 입력 가능합니다.");
		age.focus();
		return false;
	}

	// 생년월일 유효성 검사
	if (!checkValidDate(birthYear.value, birthMonth.value, birthDay.value)) {
		alert("[생년월일]\n올바른 날짜를 입력하세요.");
		birthYear.focus();
		return false;
	}

	

	// 공통 정규식 검사 함수
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}

	// 비밀번호 복합성 검사
	function checkPassword(pw) {
		var lengthCheck = /^.{8,20}$/;
		var upper = /[A-Z]/;
		var lower = /[a-z]/;
		var digit = /[0-9]/;
		var special = /[!@#$%^&*(),.?":{}|<>]/;
		return (
			lengthCheck.test(pw) &&
			upper.test(pw) &&
			lower.test(pw) &&
			digit.test(pw) &&
			special.test(pw)
		);
	}

	// 날짜 유효성 검사 함수
	function checkValidDate(y, m, d) {
		var year = parseInt(y);
		var month = parseInt(m) - 1; // JS는 0~11월
		var day = parseInt(d);

		var date = new Date(year, month, day);//실제하지 않는 날짜 걸러줌. ex) 2월 30일.

		// 날짜가 실제로 존재하는지 확인
		return (
			date.getFullYear() === year &&
			date.getMonth() === month &&
			date.getDate() === day
		);
	}
	return true;
}
// Ajax로 userId 중복 확인(이건 안 배운 건데 그냥 넣어봄=아이디 중복 금지)
function checkDuplicateId(userId, callback) {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "checkUserId.jsp?userId=" + encodeURIComponent(userId), true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4 && xhr.status === 200) {
			callback(xhr.responseText.trim() === "DUPLICATE");
		}
	};
	xhr.send();
}
