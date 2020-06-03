var titleTab = document.getElementsByClassName('title');
var activeTab = 0;
var isShownForm = false;
var idLobby;
var idFood;
var idService;

var showForm = (id) => {
    if (!isShownForm) {
        document.getElementsByClassName('formAdd')[id].className += (" active");
        isShownForm = true;
        document.getElementsByClassName('scroll')[0].className = document.getElementsByClassName('scroll')[0].className.replace("scroll", "scroll-shrink");
        return true;
    }
}
var edit = (info) => {
    let inputs = Array.from(document.getElementsByClassName('formAdd')[0].getElementsByTagName('input'));
    for(let i = 0; i < inputs.length; i++) {
    	if(info[i])
    		inputs[i].value = info[i];
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
var selectType = (action) => {
	let selectInput;
	let form;
	if(action === 'add') {
		selectInput = 'addLobby';
		form = 'newLobby';
	} else {
		selectInput = 'editLobby';
		form = 'updatedLobby';
	}
	
	let option = document.getElementById(selectInput).querySelector('option:checked');
	let price = option.value;
	let id = option.id;
    document.getElementById(form).querySelector('input[name="minPrice"]').value = price;
    document.getElementById(form).querySelector('input[name="lobbyTypeID"]').value = id;
    
}
var selection = (action) => {
	let input = document.getElementById("lobbyTypeName");	
	let selection = document.getElementById("editLobby");	
	if(action === 'show') {
		selection.style.display = "block";
		input.style.display = "none";
		selectType('edit');
	} else {
		selection.style.display = "none";
		input.style.display = "block";
	}
	return true;
}


