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
	document.getElementById('btnAddEmployee').disable = false;
    let employees = document.getElementsByTagName('input');
    employees = Array.from(employees).map(employee => { employee.value = '' });
    return true;
}
var checkDate = () => {
	let form = document.getElementById('newEmployee');
	let DOBString = form.querySelector('input[name="DOB"]').value;
	let joiningDateString = form.querySelector('input[name="joiningDate"]').value;
	let DOB = new Date(DOBString);
	let joiningDate = new Date(joiningDateString);
	if(DOB >= joiningDate) {
		document.getElementById('alert-date').style.display = "block";
		document.getElementById('btnAddEmployee').disable = true;
	} else {
		document.getElementById('alert-date').style.display = "none";
		document.getElementById('btnAddEmployee').disable = false;
	}	
}
var edit = (info) => {
	console.log("hi");
    let inputs = Array.from(document.getElementsByClassName('formAdd')[1].getElementsByTagName('input'));
    for(let i = 0; i < inputs.length; i++) {
    	if(info[i]) {
    		inputs[i].value = info[i];
    		console.log(inputs[i].value);
    	}
    }
}
var deleteEmployee = (id) => {
	document.getElementById('deleteEmployeeModal').querySelector('input[name="userID"]').value = id;
}