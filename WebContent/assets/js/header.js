
var currentActiveIcon = document.getElementsByClassName("nav")[0].getElementsByTagName('a')[0];

const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];
const dayNames = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",
  "Sunday"];
function showDate() {
    var today = new Date();
    document.getElementById('date').innerHTML = today.getDate();
    document.getElementById('year').innerHTML = monthNames[today.getMonth()]+ ' ' + today.getFullYear();
    document.getElementById('day').innerHTML = dayNames[today.getDay()];
    return true;
}
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('time').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
    return true;
}
  function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}