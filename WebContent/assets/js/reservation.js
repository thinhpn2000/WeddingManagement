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
        groom: obj.getElementById('groom').value,
        bride: obj.getElementById('bride').value,
        date: obj.getElementById('weddingDate').value,
        tableQuantity: tableTotal,
        unitPrice: totalFood,
        totalFood: totalFood * tableTotal,
        totalService: totalServices,
        total: totalFood * tableTotal + totalServices,
        balance: totalFood * tableTotal + totalServices,
        reservedServices: reservedServices,
        shift: document.querySelector('input[name="shift"]:checked').value,
        lobbyName: reservedLobby.name,
        reservedfood: reservedfood
    }
    
    var invoice = document.getElementById("modalInvoice");
    info = invoice.getElementsByTagName('span');
    for(let i=0; i<info.length; i++)
        info[i].innerHTML = invoices[[Object.keys(invoices)[i]]];
    let j = 0;
    let services = invoices.reservedServices.map((service) => {
        j++;
        return `<tr><td>${j}</td><td>${service.serviceName}</td><td>${service.servicePrice}</td><td>${service.quantity}</td><td>${service.servicePrice * service.quantity}</td></tr>`;
    });
    j = 0;
    let foods = invoices.reservedfood.map((food) => {
        j++;
        return `<tr><td>${j}</td><td>${food.foodName}</td><td>${food.foodPrice}</td></tr>`;
    });
    let date = new Date();
    document.getElementById('payment-date').innerHTML = `${date.getDate()}/${date.getMonth()+1}/${date.getFullYear()}`;
    console.log(foods);
    invoice.getElementsByTagName('tbody')[0].innerHTML = services.join('');
    document.getElementById('menuInvoice').getElementsByTagName('tbody')[0].innerHTML= foods.join('');
    

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
    if(currentTab <= 3) {
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
        
        if(currentTab === 3) {
            btnNext.children[0].className = btnNext.children[0].className.replace(" fa-angle-right"," fa-check");  
            console.log(btnNext.children[0]);
        }
        else {
            btnNext.children[0].className = btnNext.children[0].className.replace(" fa-check", " fa-angle-right")
        }
    } else {
        currentTab = 3;
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
    if(currentTab !== 0) 
        document.getElementById('filterLobby').style.display = "none";
    else 
        document.getElementById('filterLobby').style.display = "flex";
    if(currentTab === 1) {
        
        var idLobby = 'S' + document.querySelector('input[name="lobbyID"]:checked').value;
        console.log(idLobby);
        reservedLobby = {
            name: document.getElementById(idLobby).getElementsByTagName('td')[0].innerHTML,
            tableMax: document.getElementById(idLobby).getElementsByTagName('td')[2].innerHTML,
            costMin: document.getElementById(idLobby).getElementsByTagName('td')[3].innerHTML
        }
        document.querySelector('input[name="maxTable"]').value = reservedLobby.tableMax;
        document.getElementById("costMin").innerHTML = "Minimum price per table: <i>"+reservedLobby.costMin+"</i>";
        if(isValidateTable) {
            validate("tableQuantity");
        }
    }
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
    if(id === "weddingDate") {
        var date = new Date();
        var dateWedding = new Date(field.value);
        if(date < dateWedding) {
        	document.getElementById('btnFilter').disabled = false;
            return successField(field);
        } else {
        	document.getElementById('btnFilter').disabled = true;
            return unsuccessField(field);
        }
    } else if (id === "tableQuantity" || id === "reservedTable") {
        isValidateTable = true;
        let table = parseInt(document.getElementById("tableQuantity").value) + parseInt(document.getElementById("reservedTable").value);
        if(table > reservedLobby.tableMax ||  table <= 0 || document.getElementById("tableQuantity").value == '' || document.getElementById("reservedTable").value == '') {
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
var validateRadio = () => {
    if(document.querySelector('input[name="lobbyID"]:checked') == null) {
        document.getElementById('alert-lobby').className += " active";
        return false;
    }
    document.getElementById('alert-lobby').classList.remove('active');
    return true;
}
var validateTotal = () => {
    if(totalFood < reservedLobby.costMin) {
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
    if(currentTab === 0) 
        isSuccess = validateRadio() && isSuccess && validate('weddingDate');

    if(currentTab === 2) 
        isSuccess = validateTotal() && isSuccess;
    return isSuccess;
}
/* Lobby */
var lobbies = [
    {
        idLobby: 'S1',
        nameLobby: 'Sảnh A',
        typeLobby: 'A',
        tableMax: 40,
        costMin: 1000000,
        note: 'A',
        statusLobby: 1
    },
    {
        idLobby: 'S2',
        nameLobby: 'Sảnh B',
        typeLobby: 'B',
        tableMax: 50,
        costMin: 1100000,
        note: 'B',
        statusLobby: 1
    },
    {
        idLobby: 'S3',
        nameLobby: 'Sảnh C',
        typeLobby: 'C',
        tableMax: 40,
        costMin: 1200000,
        note: '',
        statusLobby: 1
    },
    {
        idLobby: 'S4',
        nameLobby: 'Sảnh D',
        typeLobby: 'D',
        tableMax: 60,
        costMin: 1400000,
        note: '',
        statusLobby: 1
    },
    {
        idLobby: 'S5',
        nameLobby: 'Sảnh E',
        typeLobby: 'E',
        tableMax: 50,
        costMin: 1600000,
        note: 'E',
        statusLobby: 1
    },
    {
        idLobby: 'S6',
        nameLobby: 'Sảnh F',
        typeLobby: 'F',
        tableMax: 40,
        costMin: 1200000,
        note: '',
        statusLobby: 1
    },
    {
        idLobby: 'S7',
        nameLobby: 'Sảnh G',
        typeLobby: 'G',
        tableMax: 60,
        costMin: 1400000,
        note: 'G',
        statusLobby: 1
    },
    {
        idLobby: 'S8',
        nameLobby: 'Sảnh H',
        typeLobby: 'H',
        tableMax: 50,
        costMin: 1600000,
        note: 'H',
        statusLobby: 1
    }
]
var filter = () => {
    
    var newLobby = lobbies.map((lobby) => {
        if(lobby.statusLobby === 1)
        return `<tr id='${lobby.idLobby}'><td>${lobby.nameLobby}</td><td>${lobby.typeLobby}</td><td>${lobby.tableMax}</td><td>${lobby.costMin}</td><td><div class="radio"><input type="radio" name="lobbyID" value=${lobby.idLobby}></div></td></tr>`;
    });
    if(newLobby.length === 0) 
        document.getElementById('tableLobby').getElementsByTagName('tbody')[0].innerHTML = "Không tồn tại sảnh phù hợp";
    else
        document.getElementById('tableLobby').getElementsByTagName('tbody')[0].innerHTML = newLobby.join('');
}

/* Food */
var reservedfood = [];

var menu = [
    {
        idFood: 'MA1',
        nameFood: 'Món A',
        costFood: 100000,
        note: 'Khai vị',
        statusFood: 1,
    },
    {
        idFood: 'MA2',
        nameFood: 'Món B',
        costFood: 200000,
        note: ' Món chính',
        statusFood: 1,
    },
    {
        idFood: 'MA3',
        nameFood: 'Món C',
        costFood: 300000,
        note: 'Món chính',
        statusFood: 1,
    },
    {
        idFood: 'MA4',
        nameFood: 'Món D',
        costFood: 400000,
        note: 'Món chính',
        statusFood: 1,
    },
    {
        idFood: 'MA5',
        nameFood: 'Món E',
        costFood: 500000,
        note: 'Tráng miệng',
        statusFood: 1,
    },
    {
        idFood: 'MA6',
        nameFood: 'Món F',
        costFood: 600000,
        note: 'Tráng miệng',
        statusFood: 1,
    },
    {
        idFood: 'MA7',
        nameFood: 'Món G',
        costFood: 300000,
        note: 'Món chính',
        statusFood: 1,
    },
    {
        idFood: 'MA8',
        nameFood: 'Món H',
        costFood: 400000,
        note: 'Món chính',
        statusFood: 1,
    },
    {
        idFood: 'MA9',
        nameFood: 'Món I',
        costFood: 500000,
        note: 'Tráng miệng',
        statusFood: 1,
    },
    {
        idFood: 'MA10',
        nameFood: 'Món G',
        costFood: 600000,
        note: 'Tráng miệng',
        statusFood: 1,
    }
]

var showMenu = () => { 
    if(!isShownMenu) {
        var newMenu = menu.map((food) => {
            if(food.statusFood === 1)
            return `<tr><td>${food.nameFood}</td><td>${food.note}</td><td>${food.costFood}</td><td><input type="checkbox" id='${food.idFood}menu' onclick="updateReservedFood(this,'${food.idFood}')"></td></tr>`;
        });
        document.getElementById('menu').getElementsByTagName('tbody')[0].innerHTML = newMenu.join('');
        isShownMenu = true;
    }
}

var totalFood=0;
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
                	console.log(id);
                	console.log(food.foodID);
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

/* Service */
var reservedServices = [];


var validateDeposit = () => {
	let deposit = document.getElementById('deposit');
	if(deposit.value > invoices.total || deposit.value == ""){
		document.getElementById('btnConfirm').disabled = true;
		return unsuccessField(document.getElementById("deposit"));
	}
	else{
		document.getElementById('btnConfirm').disabled = false;
		document.querySelector('input[name="deposit"]').value = deposit.value;
		document.getElementById('balance').innerHTML = invoices.total - deposit.value;
		return successField(document.getElementById("deposit"));
	}
}
var totalServices = 0;

var updateQuantity = (service, id) => {
    for(let i=0; i<reservedServices.length; i++)
    {
        let quantity = parseInt(service.value);
        console.log(quantity);
        

        if(id == reservedServices[i].serviceID) {
            if(quantity <= 0) {
                quantity = 1;
                service.textContent = 1;
            }
            totalAllServices(reservedServices[i], quantity);
            reservedServices[i].quantity = quantity;
            console.log(service.value);
            return;
        }
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