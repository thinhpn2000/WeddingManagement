var idWedding;

var getIdWedding = (id) => {
	document.getElementById('getWedding').querySelector('input[name="weddingID"]').value = id;
}
var deleteWedding = (id) => {
	document.getElementById('deleteWedding').querySelector('input[name="weddingID"]').value = id;
}
var showInvoice = (id) => {
    idWedding = id
    console.log(idWedding);
    
}
var pay = () => {
    console.log(idWedding);
    //var invoice = document.getElementById("modalInvoice");
    // var today = new Date();
    // var date = today.getDate()+'/'+(today.getMonth()+1)+'/'+today.getFullYear();
    // document.getElementById('payDate').getElementsByTagName("span")[0].innerHTML = date;
    // document.getElementById('balance').getElementsByTagName("span")[0].innerHTML = 0;
    document.getElementById('btnPay').style.display = "none";

}


