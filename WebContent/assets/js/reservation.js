var currentTab = 0;
var isShownMenu = false;
var isShownServices = false;
var invoices;
var reservedLobby;
var isValidateTable = false;
var tab = document.getElementsByClassName("tab");
var showInvoice = (action) => {
    var obj = document;
    var tableTotal = parseInt(obj.getElementById('tableQuantity').value) + parseInt(obj.getElementById('reservedTable').value);
    
    
    invoices = {
        groom: obj.getElementById('nameGroom').value,
        bride: obj.getElementById('nameBride').value,
        date: obj.getElementById('dateWedding').value,
        tableQuantity: tableTotal,
        unitPrice: totalFood,
        totalFood: totalFood * tableTotal,
        totalService: totalServices,
        total: totalFood * tableTotal + totalServices,
        deposit: obj.getElementById('deposit').value,
        balance: totalFood * tableTotal + totalServices - parseInt(obj.getElementById('deposit').value),
        reservedServices: reservedServices,
        shift: document.querySelector('input[name="shift"]:checked').value,
        lobbyName: reservedLobby.name
    }
    
    var invoice = document.getElementById("modalInvoice");
    info = invoice.getElementsByTagName('span');
    for(let i=0; i<info.length; i++)
        info[i].innerHTML = invoices[[Object.keys(invoices)[i]]];
    let j = 0;
    let services = invoices.reservedServices.map((service) => {
        j++;
        return `<tr><td>${j}</td><td>${service.name}</td><td>${service.cost}</td><td>${service.quantity}</td><td>${service.cost * service.quantity}</td></tr>`;
    });
    let date = new Date();
    document.getElementById('payment-date').innerHTML = `${date.getDate()}/${date.getMonth()+1}/${date.getFullYear()}`;
    invoice.getElementsByTagName('tbody')[0].innerHTML = services.join('');
    

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
        
        var idLobby = document.querySelector('input[name="lobby"]:checked').value;
        reservedLobby = {
            name: document.getElementById(idLobby).getElementsByTagName('td')[0].innerHTML,
            tableMax: document.getElementById(idLobby).getElementsByTagName('td')[2].innerHTML,
            costMin: document.getElementById(idLobby).getElementsByTagName('td')[3].innerHTML
        }
        document.querySelector('input[name="tableMax"]').value = reservedLobby.tableMax;
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
    if(id === "dateWedding") {
        var date = new Date();
        var dateWedding = new Date(field.value);
        if(date < dateWedding) {
            return successField(field);
        } else {
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
    if(document.querySelector('input[name="lobby"]:checked') == null) {
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
        isSuccess = validateRadio() && isSuccess;
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
        return `<tr id='${lobby.idLobby}'><td>${lobby.nameLobby}</td><td>${lobby.typeLobby}</td><td>${lobby.tableMax}</td><td>${lobby.costMin}</td><td><div class="radio"><input type="radio" name="lobby" value=${lobby.idLobby}></div></td></tr>`;
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
var updateReservedFood = (checkboxElem, id) => {
    let foods = document.getElementById('food').getElementsByTagName('tbody')[0];
    if(checkboxElem.checked) {
        let result = menu.find(food => food.idFood == id);
        let food = {
            id: result.idFood,
            name: result.nameFood,
            cost: result.costFood,
            note: ''
        }
        totalFood += food.cost;
        reservedfood.push(food);
    }
    else {
        if(!checkboxElem.checked){
            let menu = document.getElementById('menu').getElementsByTagName('tbody')[0].getElementsByTagName('input');
            var idMenu = id + "menu";
            for(let i=0; i<menu.length ;i++){
                if(menu[i].id == idMenu){
                    menu[i].checked = false;
                    break;
                }
            }
            
            reservedfood = reservedfood.filter(food => {
                if(food.id == id)
                    totalFood -= food.cost;
                return food.id != id;
            });
        
        }
    }
    document.getElementById('totalFood').innerHTML = totalFood;
    let newReservedFood = reservedfood.map((food) => {
        return `<tr><td>${food.name}</td><td class="costFood">${food.cost}</td><td><input name="food" value='${food.id}' type="checkbox" id='${food.id}' onclick="updateReservedFood(this,'${food.id}')" checked></td></tr>`;
    });
    
    foods.innerHTML = newReservedFood.join('');
}

/* Service */
var reservedServices = [];

var servicesMenu = [
    {
        idService: 'DV1',
        nameService: 'Dịch vụ 1',
        costService: 100000,
        statusService: 0
    },
    {
        idService: 'DV2',
        nameService: 'Dịch vụ 2',
        costService: 200000,
        statusService: 1
    },
    {
        idService: 'DV3',
        nameService: 'Dịch vụ 3',
        costService: 300000,
        statusService: 1
    },
    {
        idService: 'DV4',
        nameService: 'Dịch vụ 4',
        costService: 400000,
        statusService: 1
    },
    {
        idService: 'DV5',
        nameService: 'Dịch vụ 5',
        costService: 500000,
        statusService: 1
    },
    {
        idService: 'DV6',
        nameService: 'Dịch vụ 6',
        costService: 300000,
        statusService: 1
    },
    {
        idService: 'DV7',
        nameService: 'Dịch vụ 7',
        costService: 400000,
        statusService: 1
    },
    {
        idService: 'DV8',
        nameService: 'Dịch vụ 8',
        costService: 500000,
        statusService: 1
    },
    {
        idService: 'DV9',
        nameService: 'Dịch vụ 9',
        costService: 300000,
        statusService: 1
    },
    {
        idService: 'DV10',
        nameService: 'Dịch vụ 10',
        costService: 400000,
        statusService: 1
    },
    {
        idService: 'DV11',
        nameService: 'Dịch vụ 11',
        costService: 500000,
        statusService: 1
    },
]

var showServices = () => {
    if(!isShownServices) {
        let newServices = servicesMenu.map((service) => {
            if(service.statusService === 1)
            return `<tr><td>${service.nameService}</td><td>${service.costService}</td><td><input type="checkbox" id='${service.idService}menu' onclick="updateReservedService(this,'${service.idService}')"></td></tr>`;
        });
        document.getElementById('servicesMenu').getElementsByTagName('tbody')[0].innerHTML = newServices.join('');
        isShownServices = true;
    }
}

var totalServices = 0;
var updateReservedService = (checkboxElem, id) => {
    let services = document.getElementById('services').getElementsByTagName('tbody')[0];
    if(checkboxElem.checked) {
        let result = servicesMenu.find(service => service.idService == id);
        let service = {
            id: result.idService,
            name: result.nameService,
            cost: result.costService,
            quantity: 1
        }
        totalServices += service.cost;
        reservedServices.push(service);
    }
    else {
        if(!checkboxElem.checked){
            let servicesMenu = document.getElementById('servicesMenu').getElementsByTagName('tbody')[0].getElementsByTagName('input');
            var idMenu = id + "menu";
            for(let i=0; i<servicesMenu.length ;i++)
                if(servicesMenu[i].id == idMenu){
                    servicesMenu[i].checked = false;
                    break;
                }
            reservedServices = reservedServices.filter(service => {
                if(service.id == id)
                    totalAllServices(service, 0);
                return service.id != id;
            });
        
        }
    }
    document.getElementById('totalServices').innerHTML = totalServices;
    let newReservedServices = reservedServices.map((service) => {
        return `<tr><td>${service.name}</td><td><input id='${service.id}quantity' type="number" min=1 name="quantity" value=${service.quantity} onblur="updateQuantity(this,'${service.id}')"></td><td>${service.cost}</td><td><input type="checkbox" name="service" value=${service.id} id='${service.id}' onclick="updateReservedService(this,'${service.id}')" checked></td></tr>`;
    });
    services.innerHTML = newReservedServices.join('');
}

var updateQuantity = (service, id) => {
    for(let i=0; i<reservedServices.length; i++)
    {
        quantity = parseInt(service.value);
        if(id == reservedServices[i].id) {
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
    totalServices = totalServices - service.cost*service.quantity + service.cost*newQuantity;
    document.getElementById('totalServices').innerHTML = totalServices;
}