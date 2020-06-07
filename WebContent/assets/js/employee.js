var isShownForm = false;
var idEmployee
var employees = [
    {
        idEmployee:'NV1',
        nameEmployee: 'A',
        role: 'Admin',
        gender: 'Nam',
        status: 'Active',
        birthday:'18/2/2000',
        joiningDate:'20/4/2020',
        salary: 1000,
        isWorking: true
    },
    {
        idEmployee:'NV2',
        nameEmployee: 'B',
        role: 'Admin',
        gender: 'Nữ',
        status: 'Offline',
        birthday:'19/2/2000',
        joiningDate:'20/4/2020',
        salary: 10000,
        isWorking: true
    },
    {
        idEmployee:'NV3',
        nameEmployee: 'C',
        role: 'Employee',
        gender: 'Nam',
        status: 'Active',
        birthday:'20/2/2000',
        joiningDate:'20/4/2020',
        salary: 3000,
        isWorking: true
    },
    {
        idEmployee:'NV4',
        nameEmployee: 'D',
        role: 'Employee',
        gender: 'Nữ',
        status: 'Active',
        birthday:'22/2/2000',
        joiningDate:'20/4/2020',
        salary: 5000,
        isWorking: true
    },
    {
        idEmployee:'NV5',
        nameEmployee: 'E',
        role: 'Employee',
        gender: 'Nam',
        status: 'Offline',
        birthday:'24/2/2000',
        joiningDate:'20/4/2020',
        salary: 1000,
        isWorking: true
    },
    {
        idEmployee:'NV6',
        nameEmployee: 'F',
        role: 'Admin',
        gender: 'Nữ',
        status: 'Active',
        birthday:'20/2/2000',
        joiningDate:'20/4/2020',
        salary: 3000,
        isWorking: true
    },
    {
        idEmployee:'NV7',
        nameEmployee: 'G',
        role: 'Admin',
        gender: 'Nữ',
        status: 'Active',
        birthday:'22/2/1998',
        joiningDate:'20/4/2020',
        salary: 5000,
        isWorking: true
    },
    {
        idEmployee:'NV8',
        nameEmployee: 'H',
        role: 'Employee',
        gender: 'Nữ',
        status: 'Offline',
        birthday:'24/2/2000',
        joiningDate:'20/4/2020',
        salary: 1000,
        isWorking: true
    },

]
var showListEmployee = () => {
    let i = 0;
    var listEmployee = employees.map(employee => {
        if(employee.isWorking === true) {
            i++;
            return `<tr id='${employee.idEmployee}'><td contenteditable="false">${i}</td><td>${employee.nameEmployee}</td><td>${employee.gender}</td><td>${employee.birthday}</td><td>${employee.salary}</td><td>${employee.joiningDate}</td><td>${employee.status}</td><td>${employee.role}</td><td><button type="button" class="btn btn-danger btn-sm" onclick="getIdEmployee('${employee.idEmployee}')" data-toggle="modal" data-target="#deleteEmployeeModal" >Delete</button> <button type="button" class="btn btn-warning btn-sm" onclick="showForm(1) && editEmployee('${employee.idEmployee}')">Edit</button></td></tr>`;

        }
    })
    document.getElementById('listEmployee').getElementsByTagName('tbody')[0].innerHTML = listEmployee.join('');
    return true;
}
var getIdEmployee = (id) => {
    idEmployee = id;
}
var deleteEmployee = () => {
    console.log(idEmployee);
}
var editEmployee = (id) => {
    console.log(id);
}

var showForm = (n) => {
    if (!isShownForm) {
        document.getElementsByClassName('title-employee')[n].className = document.getElementsByClassName('title-employee')[0].className.replace("disable","active");
        
        document.getElementsByClassName('filter')[0].className += " disable";

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
    document.getElementsByClassName('filter')[0].classList.remove("disable");
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
var searchEmployee = () => {
    let role = document.getElementById('roleEmployee').value;
    let status = document.getElementById('statusEmployee').value;
    console.log('role', role);
    console.log('status', status);
}
var checkDate = () => {
	let form = document.getElementById('newEmployee');
	let DOBString = form.querySelector('input[name="DOB"]').value;
	let joiningDateString = form.querySelector('input[name="joiningDate"]').value;
	let DOB = new Date(DOBString);
	let joiningDate = new Date(joiningDateString);
	if(DOB >= joiningDate) {
		console.log('error');
		document.getElementById('alert-date').style.display = "block";
		document.getElementById('btnAddEmployee').disable = true;
	} else {
		document.getElementById('alert-date').style.display = "none";
		document.getElementById('btnAddEmployee').disable = false;
	}	
}