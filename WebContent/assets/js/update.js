var titleTab = document.getElementsByClassName('title');
var activeTab = 0;
var isShownForm = false;
var idLobby;
var idFood;
var idService;
// var changeTitle = (currentTitle) => {
//     if (!currentTitle.classList.contains("active")) {
//         let preActiveTab = activeTab;
//         currentTitle.className += " active";
//         titleTab[activeTab].classList.remove("active");
//         activeTab = Array.from(titleTab).indexOf(currentTitle);
//         moveContent(preActiveTab);
//     }
// }
// var moveContent = (preActiveTab) => {
//     var content = document.getElementsByClassName('content');
//     content[activeTab].className += (" active");
//     content[preActiveTab].classList.remove("active");
//     closeForm(preActiveTab);
//     if (activeTab === 0)
//         showLobbyUpdated();
//     if (activeTab === 1)
//         showFoodUpdated();
//     if (activeTab === 2)
//         showServiceUpdated();
// }
var showForm = (id) => {
    if (!isShownForm) {
        document.getElementsByClassName('formAdd')[id].className += (" active");
        isShownForm = true;
        document.getElementsByClassName('scroll')[0].className = document.getElementsByClassName('scroll')[0].className.replace("scroll", "scroll-shrink");
        return true;
    }
}
var closeForm = (id) => {
    let form = document.getElementsByClassName('formAdd')[id];
    form.classList.remove("active");
    if (Array.from(document.getElementsByClassName('scroll-shrink')).length > 0)
        document.getElementsByClassName('scroll-shrink')[0].className = document.getElementsByClassName('scroll-shrink')[0].className.replace('scroll-shrink', 'scroll');
    clearData();
    isShownForm = false;
}
var clearData = () => {
    let elements = document.getElementsByTagName('input');
    elements = Array.from(elements).map(element => { element.value = '' })
    return true;
}
// var update = (element, name, id = 0) => {
//     // Alow edit
//     if (element.getElementsByTagName('button')[1].innerHTML === "Edit") {
//         element.getElementsByTagName('button')[0].innerHTML = "Cancel";
//         element.getElementsByTagName('button')[1].innerHTML = "Save";
//         element.setAttribute("contenteditable", "true");
//     }
//     else { // save
//         element.setAttribute("contenteditable", "false");
//         element.getElementsByTagName('button')[0].innerHTML = "Delete";
//         element.getElementsByTagName('button')[1].innerHTML = "Edit";
//         if (name === 'lobby')
//             updateLobby(element, id);
//         if (name === 'food')
//             updateFood(element, id);
//         if (name === 'service')
//             updateService(element, id);
//     }
// }
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
var showLobbyUpdated = () => {
    var newLobby = lobbies.map((lobby) => {
        if (lobby.statusLobby === 1)
            return `<tr id='${lobby.idLobby}update'><td>${lobby.nameLobby}</td><td>${lobby.typeLobby}</td><td>${lobby.tableMax}</td><td>${lobby.costMin}</td><td>${lobby.note}</td><td><button type="button" class="btn btn-danger btn-sm" onclick="getIdLobby('${lobby.idLobby}')" data-toggle="modal" data-target="#deleteLobbyModal">Delete</button> <button type="button" class="btn btn-warning btn-sm" onclick="showForm(0) && editLobby('${lobby.idLobby}')">Edit</button></td></tr>`;
    });
    document.getElementById('updatedLobby').getElementsByTagName('tbody')[0].innerHTML = newLobby.join('');
    return true;
}
var getIdLobby = (id) => {
    idFood = id;
}
var deleteLobby = () => {
    console.log(idFood);
}
var editLobby = (id) => {
    console.log(id);
}
// var addLobby = () => {
//     let lobby = document.getElementById('newLobby').getElementsByTagName('input');
//     let newLobby = {
//         idLobby: 'S' + (lobbies.length + 1),
//         nameLobby: lobby[0].value,
//         typeLobby: lobby[1].value,
//         tableMax: lobby[2].value,
//         costMin: parseInt(lobby[3].value),
//         note: lobby[4].value,
//         statusLobby: 1
//     }
//     // Need to update lobbies in DB
//     lobbies.push(newLobby);
//     lobby[0].value = lobby[1].value = lobby[2].value = lobby[3].value = lobby[4].value = '';
//     showLobbyUpdated();
//     console.log(lobbies);
//     return true;
// }
// var updateLobby = (lobby, id) => {
//     let newLobby = lobbies.find(x => x.idLobby === id);
//     let info = lobby.getElementsByTagName('td');
//     newLobby.nameLobby = info[0].innerHTML;
//     newLobby.typeLobby = info[1].innerHTML;
//     newLobby.tableMax = info[2].innerHTML;
//     newLobby.costMin = parseInt(info[3].innerHTML);
//     newLobby.note = info[4].innerHTML;
// }
// var deleteLobby = (lobby, id) => {
//     console.log(lobby);
//     // Cancel edit lobby
//     if (lobby.getElementsByTagName('button')[0].innerHTML === "Cancel") {
//         lobby.getElementsByTagName('button')[0].innerHTML = "Delete";
//         lobby.getElementsByTagName('button')[1].innerHTML = "Edit";
//         showLobbyUpdated();
//     }
//     else { // delete lobby
//         // cant call confirm???
//         let msg = confirm("Are you sure?");
//         console.log(msg);
//         if (msg == true) {
//             for (let i = 0; i < lobbies.length; i++)
//                 if (lobbies[i].idLobby === id)
//                     lobbies[i].statusLobby = 0;
//             showLobbyUpdated();
//         } else {
//             lobby.getElementsByTagName('button')[0].innerHTML = "Delete";
//             lobby.getElementsByTagName('button')[1].innerHTML = "Edit";
//         }

//     }
//     console.log(lobbies);
// }

/* Food */
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
var showFoodUpdated = () => {
    var newFood = menu.map((food) => {
        if (food.statusFood === 1)
            return `<tr id='${food.idFood}update'><td>${food.nameFood}</td><td>${food.note}</td><td>${food.costFood}</td><td><button type="button" class="btn btn-danger btn-sm"  onclick="getIdFood('${food.idFood}')" data-toggle="modal" data-target="#deleteFoodModal">Delete</button> <button type="button" class="btn btn-warning btn-sm" onclick="showForm(0) && editFood('${food.idFood}')">Edit</button></td></tr>`;
    });
    document.getElementById('updateFood').getElementsByTagName('tbody')[0].innerHTML = newFood.join('');
    console.log(document.getElementById('updateFood'));
    //update menu bên phía đặt tiệc rn
    isShownMenu = false;
    return true;
}
var getIdFood = (id) => {
    idFood = id;
}
var deleteFood = () => {
    console.log(idFood);
}
var editFood = (id) => {
    console.log(id);
}
// var addFood = () => {
//     let food = document.getElementById('newFood').getElementsByTagName('input');
//     let newFood = {
//         idFood: 'MA' + (menu.length + 1),
//         nameFood: food[0].value,
//         costFood: parseInt(food[2].value),
//         note: food[1].value,
//         statusFood: 1
//     }
//     // Need to update lobbies in DB
//     menu.push(newFood);
//     //food[0].value = food[1].value = food[2].value = '';
//     showFoodUpdated();
//     return true;
// }
// var updateFood = (food, id) => {
//     let newFood = menu.find(x => x.idFood === id);
//     let info = food.getElementsByTagName('td');
//     newFood.nameFood = info[0].innerHTML;
//     newFood.note = info[1].innerHTML;
//     newFood.costFood = parseInt(info[2].innerHTML);
//     console.log(menu);
// }
// var deleteFood = (food, id) => {
//     // Cancel edit food
//     if (food.getElementsByTagName('button')[0].innerHTML === "Cancel") {
//         food.getElementsByTagName('button')[0].innerHTML = "Delete";
//         food.getElementsByTagName('button')[1].innerHTML = "Edit";
//         showFoodUpdated();
//     }
//     else { // delete food
//         // cant call confirm???
//         let msg = confirm("Are you sure?");
//         if (msg == true) {
//             for (let i = 0; i < menu.length; i++)
//                 if (menu[i].idFood === id)
//                     menu[i].statusFood = 0;
//             showFoodUpdated();
//         } else {
//             food.getElementsByTagName('button')[0].innerHTML = "Delete";
//             food.getElementsByTagName('button')[1].innerHTML = "Edit";
//         }
//         console.log(menu);
//     }
// }
/* Service */
var servicesMenu = [
    {
        idService: 'DV1',
        nameService: 'Dịch vụ 1',
        costService: 100000,
        statusService: 1
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
var showServiceUpdated = () => {
    var newService = servicesMenu.map((service) => {
        if (service.statusService === 1)
            return `<tr id='${service.idService}update'><td>${service.nameService}</td><td>${service.costService}</td><td><button type="button" class="btn btn-danger btn-sm" onclick="getIdService('${service.idService}')" data-toggle="modal" data-target="#deleteServiceModal">Delete</button> <button type="button" class="btn btn-warning btn-sm" onclick="showForm(0) && editFood('${service.idService}')">Edit</button></td></tr>`;
    });
    document.getElementById('updateService').getElementsByTagName('tbody')[0].innerHTML = newService.join('');
    //update service trong phieu dat tiec rn
    isShownServices = false;
    return true;
}

var getIdService = (id) => {
    idService = id;
}
var deleteService = () => {
    console.log(idService);
}
var editService = (id) => {
    console.log(id);
}
// var addService = () => {
//     let service = document.getElementById('newService').getElementsByTagName('input');
//     let newService = {
//         idService: 'DV' + (servicesMenu.length + 1),
//         nameService: service[0].value,
//         costService: parseInt(service[1].value),
//         statusService: 1
//     }
//     // Need to update lobbies in DB
//     servicesMenu.push(newService);
//     //food[0].value = food[1].value = food[2].value = '';
//     showServiceUpdated();
//     return true;
// }

// var updateService = (service, id) => {
//     let newService = servicesMenu.find(x => x.idService === id);
//     let info = service.getElementsByTagName('td');
//     newService.nameService = info[0].innerHTML;
//     newService.costService = parseInt(info[1].innerHTML);
//     console.log(servicesMenu);
// }

// var deleteService = (service, id) => {
//     // Cancel edit service
//     if (service.getElementsByTagName('button')[0].innerHTML === "Cancel") {
//         service.getElementsByTagName('button')[0].innerHTML = "Delete";
//         service.getElementsByTagName('button')[1].innerHTML = "Edit";
//         showServiceUpdated();
//     }
//     else { // delete service
//         // cant call confirm???
//         let msg = confirm("Are you sure?");
//         if (msg == true) {
//             for (let i = 0; i < servicesMenu.length; i++)
//                 if (servicesMenu[i].idService === id)
//                     servicesMenu[i].statusService = 0;
//             showServiceUpdated();
//         } else {
//             service.getElementsByTagName('button')[0].innerHTML = "Delete";
//             service.getElementsByTagName('button')[1].innerHTML = "Edit";
//         }
//         console.log(servicesMenu);
//     }
// }