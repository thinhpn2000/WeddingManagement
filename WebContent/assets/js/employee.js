var isShownForm = false;


var showForm = (n) => {
    if (!isShownForm) {
        document.getElementsByClassName('title-employee')[n].className = document.getElementsByClassName('title-employee')[0].className.replace("disable","active");
        
        

        document.getElementsByClassName('formAdd')[n].className += (" active");
        isShownForm = true;
        document.getElementsByClassName('scroll')[0].className = document.getElementsByClassName('scroll')[0].className.replace("scroll", "scroll-shrink");
        return true;
    }
}
var closeForm = (n) => {
    let form = document.getElementsByClassName('formAdd')[n];
    clearData();
    form.classList.remove("active");
    document.getElementsByClassName('title-employee')[n].className = document.getElementsByClassName('title-employee')[n].className.replace("active","disable");
    if (Array.from(document.getElementsByClassName('scroll-shrink')).length > 0)
    document.getElementsByClassName('scroll-shrink')[0].className = document.getElementsByClassName('scroll-shrink')[0].className.replace('scroll-shrink', 'scroll');
    isShownForm = false;
}
var clearData = () => {
	document.getElementById('alert-date').style.display = "none";
	document.getElementById('btnAddEmployee').disabled = false;
	document.getElementById('alert-update').style.display = "none";
	document.getElementById('alert-add').style.display = "none";
	document.getElementById('btnUpdateEmployee').disabled = false;
    let employees = document.getElementsByTagName('input');
    employees = Array.from(employees).map(employee => { employee.value = '' });
    return true;
}
var alert = document.getElementById('alert-date');
var checkDate = () => {
	let form = document.getElementById('newEmployee');
	let DOBString = form.querySelector('input[name="DOB"]').value;
	let joiningDateString = form.querySelector('input[name="joiningDate"]').value;
	let DOB = new Date(DOBString);
	let joiningDate = new Date(joiningDateString);
	
	if(DOB >= joiningDate) {
		alert.innerHTML = "Please check DOB and joining date again.";
		alert.style.display = "block";
		document.getElementById('btnAddEmployee').disabled = true;
	} else {
		alert.style.display = "none";
		document.getElementById('btnAddEmployee').disabled = false;
	}	
}
var edit = (info) => {
    let inputs = Array.from(document.getElementsByClassName('formAdd')[1].getElementsByTagName('input'));
    for(let i = 0; i < inputs.length; i++) {
    	if(info[i]) {
    		inputs[i].value = info[i];
    	}
    }
}
var deleteEmployee = (id) => {
	document.getElementById('deleteEmployeeModal').querySelector('input[name="userID"]').value = id;
}
var resetPassword = (id) => {
	document.getElementById('resetPasswordModal').querySelector('input[name="userID"]').value = id;
}

var checkEmail = (element, id) => {
	let email = element.value;
	var alertMail = document.getElementById(id);
	if(id == 'alert-update') {
		btnId = 'btnUpdateEmployee';
	} else 
		btnId = 'btnAddEmployee';
	
	var filter = /^([a-zA-Z0-9_\.\-])+\@gmail.com/; 
	var btn = document.getElementById(btnId);
	
	if(filter.test(email)) {
		btn.disabled = false;
		alertMail.style.display = "none";
	} else {
		btn.disabled = true;
		alertMail.innerHTML = "Please check your email again. (Example: Example@gmail.com)";
		alertMail.style.display = "block";
	}
}