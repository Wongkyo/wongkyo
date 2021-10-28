
let userPw = document.getElementById("userPw");
let userPw2 = document.getElementById("userPw2");

let userPwCheckResult = false; // pw check 결과
let userPwEqualResult = false; // pw equal 결과

userPw2.addEventListener("blur")

// PW EQUAL CHECK **********************************
userPw2.addEventListener("blur", function(){
	if(userPw.value != userPw2.value){
		userPw2.value="";
	}else {
		userPwEqualResult=true;
	}
});

userPw.addEventListener("change", function(){
	userPw2.value="";
});