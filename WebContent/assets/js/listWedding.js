var idWedding;
var weddings = [
    {
        idWedding: "WD1",
        bride: "Nguyễn Văn A",
        groom: "Nguyễn Văn B",
        lobby: "Sảnh A",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    },
    {
        idWedding: "WD2",
        bride: "Nguyễn Văn C",
        groom: "Nguyễn Văn D",
        lobby: "Sảnh B",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    },
    {
        idWedding: "WD3",
        bride: "Nguyễn Văn E",
        groom: "Nguyễn Văn F",
        lobby: "Sảnh C",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    },
    {
        idWedding: "WD4",
        bride: "Nguyễn Văn G",
        groom: "Nguyễn Văn H",
        lobby: "Sảnh D",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    },
    {
        idWedding: "WD5",
        bride: "Nguyễn Văn I",
        groom: "Nguyễn Văn J",
        lobby: "Sảnh E",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    },
    {
        idWedding: "WD6",
        bride: "Nguyễn Văn K",
        groom: "Nguyễn Văn L",
        lobby: "Sảnh C",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    },
    {
        idWedding: "WD7",
        bride: "Nguyễn Văn M",
        groom: "Nguyễn Văn N",
        lobby: "Sảnh D",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    },
    {
        idWedding: "WD8",
        bride: "Nguyễn Văn P",
        groom: "Nguyễn Văn Q",
        lobby: "Sảnh E",
        date: "18/2/2020",
        shift: "Trưa",
        tableQuantity: 40,
    }
]
var invoices = [
    {
        idInvoice: 'HD1',
        idWedding: "WD1",
        groom: 'Nguyễn Văn A',
        bride: 'Nguyễn Thị B',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            },
            {
                idService: 'DV3',
                nameService: 'Dịch vụ 3',
                costService: 300000,
                quantity: 3
            },
            {
                idService: 'DV4',
                nameService: 'Dịch vụ 4',
                costService: 400000,
                quantity: 1
            }
        ]
    },
    {
        idInvoice: 'HD2',
        idWedding: "WD2",
        groom: 'Nguyễn Văn C',
        bride: 'Nguyễn Văn D',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            }
        ]
    },
    {
        idInvoice: 'HD3',
        idWedding: "WD3",
        groom: 'Nguyễn Văn E',
        bride: 'Nguyễn Thị F',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            },
            {
                idService: 'DV3',
                nameService: 'Dịch vụ 3',
                costService: 300000,
                quantity: 3
            },
            {
                idService: 'DV4',
                nameService: 'Dịch vụ 4',
                costService: 400000,
                quantity: 1
            }
        ]
    },
    {
        idInvoice: 'HD4',
        idWedding: "WD4",
        groom: 'Nguyễn Văn G',
        bride: 'Nguyễn Thị H',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            },
            {
                idService: 'DV3',
                nameService: 'Dịch vụ 3',
                costService: 300000,
                quantity: 3
            },
            {
                idService: 'DV4',
                nameService: 'Dịch vụ 4',
                costService: 400000,
                quantity: 1
            }
        ]
    },
    {
        idInvoice: 'HD5',
        idWedding: "WD5",
        groom: 'Nguyễn Văn I',
        bride: 'Nguyễn Thị J',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            },
            {
                idService: 'DV3',
                nameService: 'Dịch vụ 3',
                costService: 300000,
                quantity: 3
            },
            {
                idService: 'DV4',
                nameService: 'Dịch vụ 4',
                costService: 400000,
                quantity: 1
            }
        ]
    },
    {
        idInvoice: 'HD6',
        idWedding: "WD6",
        groom: 'Nguyễn Văn K',
        bride: 'Nguyễn Thị L',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            },
            {
                idService: 'DV3',
                nameService: 'Dịch vụ 3',
                costService: 300000,
                quantity: 3
            },
            {
                idService: 'DV4',
                nameService: 'Dịch vụ 4',
                costService: 400000,
                quantity: 1
            }
        ]
    },
    {
        idInvoice: 'HD7',
        idWedding: "WD7",
        groom: 'Nguyễn Văn M',
        bride: 'Nguyễn Thị N',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            },
            {
                idService: 'DV3',
                nameService: 'Dịch vụ 3',
                costService: 300000,
                quantity: 3
            },
            {
                idService: 'DV4',
                nameService: 'Dịch vụ 4',
                costService: 400000,
                quantity: 1
            }
        ]
    },
    {
        idInvoice: 'HD8',
        idWedding: "WD8",
        groom: 'Nguyễn Văn O',
        bride: 'Nguyễn Thị P',
        date: '18/2/2020',
        tableQuantity: 40,
        unitPrice: 1000000,
        totalFood: 10000000,
        totalService: 2,
        total: 60000000,
        deposit: 30000000,
        balance: 1000000,
        reserveServices: [
        
            {
                idService: 'DV1',
                nameService: 'Dịch vụ 1',
                costService: 100000,
                quantity: 1
            },
            {
                idService: 'DV2',
                nameService: 'Dịch vụ 2',
                costService: 200000,
                quantity: 2
            },
            {
                idService: 'DV3',
                nameService: 'Dịch vụ 3',
                costService: 300000,
                quantity: 3
            },
            {
                idService: 'DV4',
                nameService: 'Dịch vụ 4',
                costService: 400000,
                quantity: 1
            }
        ]
    }
]
var searchWedding = () => {
    let i = 0;
    var listWedding = weddings.map(wedding => {
        i++;
        return `<tr id='${wedding.idWedding}'><td>${i}</td><td>${wedding.bride}</td><td>${wedding.groom}</td><td>${wedding.lobby}</td><td>${wedding.date}</td><td>${wedding.shift}</td><td>${wedding.tableQuantity}</td><td><button type="button" class="btn btn-success btn-sm" onclick="showInvoice('${wedding.idWedding}')" data-toggle="modal" data-target="#invoiceModal">View</button> <button type="button" class="btn btn-warning btn-sm" onclick="getIdWedding('${wedding.idWedding}')"><a href="/employee-html/reservation.html">Edit</a></button></td></tr>`;

    })
    document.getElementById('listWedding').getElementsByTagName('tbody')[0].innerHTML = listWedding.join('');
    return true;
}
var getIdWedding = (id) => {
    idWedding = id
    console.log(idWedding);
}
var showInvoice = (id) => {
    idWedding = id
    console.log(idWedding);
    // var invoice = document.getElementById("invoice");
    // infoModal = invoice.getElementsByTagName('span');
    // var infoWedding = invoices.find(invoice => {
    //     return invoice.idWedding === idWedding;
    // })
    // // arr key of object
    // //console.log(Object.keys(infoWedding));
    // for(let i=0; i<infoModal.length; i++){
    //     // get from 2nd key cuz 2 key đầu là idHD và idWD
    //     infoModal[i].innerHTML = infoWedding[[Object.keys(infoWedding)[i+2]]];
    // }
    // let j = 0;
    // let services = infoWedding.reserveServices.map((service) => {
    //     j++;
    //     return '<tr><td>'+ j +'</td><td>'+ service.nameService +'</td><td>'+ service.costService +'</td><td>' + service.quantity +'</td><td>'+ service.costService * service.quantity +'</td></tr>';
    // });
    // invoice.getElementsByTagName('tbody')[0].innerHTML = services.join('');
    document.getElementById('btnPay').style.display = "block";


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

