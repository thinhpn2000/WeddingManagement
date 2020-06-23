var changeForm = (formName) => {
    console.log("hi");
    var arrForm = document.getElementsByClassName("loginForm");
    for (const form of Array.from(arrForm)) {
        form.classList.replace("active","disable");
      }
    var form = document.getElementById(formName);
    form.classList.replace("disable","active");
}
var checkEmail = (element) => {
	let email = element.value;
	let alert = document.getElementById('alert');
	var filter = /^([a-zA-Z0-9_\.\-])+\@gmail.com/; 
	if(filter.test(email)) {
		document.getElementById('btnSend').disabled = false;
		alert.style.display = "none";
	} else {
		document.getElementById('btnSend').disabled = true;
		console.log(document.getElementById('btnSend').disabled);
		alert.innerHTML = "Please check your email again. (Example: Example@gmail.com)";
		alert.style.display = "block";
	}
}