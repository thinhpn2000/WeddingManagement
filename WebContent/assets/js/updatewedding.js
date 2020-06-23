var currentTab = 0;
var isShownMenu = false;
var isShownServices = false;
var invoices;
var reservedLobby;
var isValidateTable = false;
var tab = document.getElementsByClassName("tab");
var showInvoice = () => {
    var obj = document;
    var tableTotal = parseInt(obj.getElementById('tableQuantity').value) + parseInt(obj.getElementById('reservedTable').value);
    
    
    invoices = {
        tableQuantity: tableTotal,
        unitPrice: totalFood,
        totalFood: totalFood * tableTotal,
        totalService: totalServices,
        total: totalFood * tableTotal + totalServices,
        //deposit: obj.getElementById('deposit').value,
        balance: totalFood * tableTotal + totalServices - parseInt(obj.getElementById('deposit').innerHTML),
    }
    console.log(invoices.balance);
    var invoice = document.getElementById("modalInvoice");
    info = invoice.getElementsByTagName('span');
    for(let i = 3; i<info.length-2; i++)
        info[i].innerHTML = invoices[[Object.keys(invoices)[i-3]]];
    
    let date = new Date();
    document.getElementById('payment-date').innerHTML = `${date.getDate()}/${date.getMonth()+1}/${date.getFullYear()}`;
    

}
var moveTab = (n) => {
    var btnPrev = document.getElementById("btnPrev");
    var btnNext = document.getElementById("btnNext");
    var step = document.getElementsByClassName("bs-wizard-step");
    tab[currentTab].style.display = "none"; 
    btnNext.dataset.target = "";
    btnNext.dataset.toggle = "";
    // Btn Next
    currentTab = currentTab + n;
    console.log('current tab',currentTab);
    if(currentTab <= 2) {
        //btn next
        if(n === 1) {
            showTab(currentTab);
            step[currentTab-1].className = step[currentTab-1].className.replace(" active", " complete");
            step[currentTab].className = step[currentTab].className.replace(" disable", " active");
            btnPrev.disabled = false;
        }
        else {
            showTab(currentTab);
            step[currentTab+1].className = step[currentTab+1].className.replace(" active", " disable");
            step[currentTab].className = step[currentTab].className.replace(" complete", " active");
            if(currentTab === 0) {
                btnPrev.disabled = true;
            }
        }
        
        if(currentTab === 2) {
            btnNext.children[0].className = btnNext.children[0].className.replace(" fa-angle-right"," fa-check");  
            
        }
        else {
            btnNext.children[0].className = btnNext.children[0].className.replace(" fa-check", " fa-angle-right")
        }
    } else {
        currentTab = 2;
        showTab(currentTab);
        btnNext.dataset.target = "#exampleModal";
        btnNext.dataset.toggle = "modal";
        // reset all
        showInvoice();
        
    }
    return true;
}

function showTab(n) {
    tab[n].style.display = "block";
    return true;
}
var successField = (field) => {
    if(field.classList.contains("danger"))
            field.className = field.className.replace(" danger", " success");
    if(!field.classList.contains("success"))
        field.className += (" success");
    return true;
}
var unsuccessField = (field) => {
    if(field.classList.contains("success"))
        field.className = field.className.replace(" success", " danger");
    if(!field.classList.contains("danger"))
        field.className += (" danger");
    return false;
}
var validate = (id) => {
    var field = document.getElementById(id);
    if (id === "tableQuantity" || id === "reservedTable") {
        isValidateTable = true;
        let table = parseInt(document.getElementById("tableQuantity").value) + parseInt(document.getElementById("reservedTable").value);
        let tableMax = parseInt(document.getElementById('maxTable').value);
        //console.log(tableMax);
        if(table > tableMax ||  table <= 0) {
            unsuccessField(document.getElementById("reservedTable"));
            return unsuccessField(document.getElementById("tableQuantity"));
        } else {
            successField(document.getElementById("reservedTable"));
            return successField(document.getElementById("tableQuantity"));
        }
    } else if(field.value == "") {
        return unsuccessField(field);
    } else return successField(field);
    
}

var validateTotal = () => {
	let costMin = parseInt(document.getElementById('costMin').innerHTML);
	
    if(totalFood < costMin) {
        document.getElementById('alert-food').className += " active";
        return false;
    }
    document.getElementById('alert-food').classList.remove('active');
    return true;
}
var confirm = () => {
    var isSuccess = true;
    var arr = document.getElementsByClassName('tab')[currentTab].getElementsByClassName('form-control');
    for(let i=0; i<arr.length; i++) {
        if(arr[i].id){
            isSuccess = validate(arr[i].id) && isSuccess;
        }
    }
    if(currentTab === 1) 
        isSuccess = validateTotal() && isSuccess;
    return isSuccess;
}
/* Lobby */


/* Food */
var reservedfood = [];

var totalFood = 0;

var bindTotal = (tablePrice, totalServicePrice) => {
	totalFood = tablePrice;
	totalServices = totalServicePrice;
}
var updateReservedFood = (checkboxElem, id, name, price) => {
    let foods = document.getElementById('food').getElementsByTagName('tbody')[0];
    if(checkboxElem.checked) {
        let food = {
            foodID: "MA" + id,
            foodName: name,
            foodPrice: parseInt(price)
        }
        totalFood += food.foodPrice;
        reservedfood.push(food);
    }
    else {
        if(!checkboxElem.checked){
            let menu = document.getElementById('menu').getElementsByTagName('tbody')[0].getElementsByTagName('input');
            var idMenu = "MA" + id + "menu";
            for(let i=0; i<menu.length ;i++){
                if(menu[i].id == idMenu){
                    menu[i].checked = false;
                    break;
                }
            }
            reservedfood = reservedfood.filter(food => {
                if(food.foodID == id) {
                	totalFood -= food.foodPrice;
                }
                return food.foodID != id;
            });
        
        }
    }
    document.getElementById('totalFood').innerHTML = totalFood;
    let newReservedFood = reservedfood.map((food) => {
    	food.foodID = food.foodID.replace("MA","");
        return `<tr><td>${food.foodName}</td><td class="costFood">${food.foodPrice}</td><td><input name="food" value='${food.foodID}' type="checkbox" id='MA${food.foodID}' onclick="updateReservedFood(this,'${food.foodID}','${food.foodName}','${food.foodPrice}')" checked></td></tr>`;
    });
    foods.innerHTML = newReservedFood.join('');
}
var recalculateFood = (element, price) => {
	
	if(element.checked) {
		totalFood += parseInt(price);
	} else {
		totalFood -= parseInt(price);
	}
	document.getElementById('totalFood').innerHTML = totalFood;
}
/* Service */
var reservedServices = [];
var totalServices = 0;
var oldQuantity = 0;
var currentID = 0;
var isGetQuantity = false;
var updateQuantity = (service, id) => {
    for(let i=0; i<reservedServices.length; i++)
    {
        let quantity = parseInt(service.value);
        if(id == reservedServices[i].serviceID) {
            if(quantity <= 0) {
                quantity = 1;
                service.textContent = 1;
            }
            totalAllServices(reservedServices[i], quantity);
            reservedServices[i].quantity = quantity;
            return;
        }
    }
}
var recalculateService = (element, price) => {
	var inputQuantity = document.getElementById(element.id + 'quantity');
	if(element.checked) {
		inputQuantity.value = 1;
		totalServices += price * inputQuantity.value;
		inputQuantity.disabled = false;
	} else {
		totalServices -= price * inputQuantity.value;
		inputQuantity.value = 1;
		inputQuantity.disabled = true;
	}
	document.getElementById('totalServices').innerHTML = totalServices;
}
var recalculateServiceQuantity = (element, price) => {
	if(element.value == "") 
		element.value = 1;
	totalServices = totalServices - price * oldQuantity + price * element.value;
	document.getElementById('totalServices').innerHTML = totalServices;
	currentID = 0;
}
var getQuantity = (element) => {
	if(currentID == 0) {
		currentID = element.id;
		oldQuantity = element.value;
	}
	if(currentID != element.id) {
		oldQuantity = element.value;
		currentID = element.id;
	}
}
var totalAllServices = (service, newQuantity) => {
    totalServices = totalServices - service.servicePrice * service.quantity + service.servicePrice * newQuantity;
    
    document.getElementById('totalServices').innerHTML = totalServices;
}
var updateReservedService = (checkboxElem, id, name, price) => {
    let services = document.getElementById('services').getElementsByTagName('tbody')[0];
    if(checkboxElem.checked) {
        let service = {
            serviceID: "DV" + id,
            serviceName: name,
            servicePrice: parseInt(price),
            quantity: 1
        }
        totalServices += service.servicePrice;
        reservedServices.push(service);
    }
    else {
        if(!checkboxElem.checked){
            let servicesMenu = document.getElementById('servicesMenu').getElementsByTagName('tbody')[0].getElementsByTagName('input');
            var idMenu = "DV" + id + "menu";
            for(let i=0; i<servicesMenu.length ;i++)
                if(servicesMenu[i].id == idMenu){
                    servicesMenu[i].checked = false;
                    break;
                }
            reservedServices = reservedServices.filter(service => {
                if(service.serviceID == id){
                	totalAllServices(service, 0);
                }
                return service.serviceID != id;
            });
        
        }
    }
    document.getElementById('totalServices').innerHTML = totalServices;
    let newReservedServices = reservedServices.map((service) => {
    	service.serviceID = service.serviceID.replace("DV","");
        return `<tr><td>${service.serviceName}</td><td><input id=`+ 'DV' +`${service.serviceID}quantity' type="number" min=1 name="quantity" value=${service.quantity} onblur="updateQuantity(this,'${service.serviceID}')"></td><td>${service.servicePrice}</td><td><input type="checkbox" name="service" value=${service.serviceID} id='DV${service.serviceID}' onclick="updateReservedService(this,'${service.serviceID}','${service.serviceName}','${service.servicePrice}')" checked></td></tr>`;
    });
    services.innerHTML = newReservedServices.join('');
}
