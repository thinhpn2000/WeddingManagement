var changeForm = (formName) => {
    console.log("hi");
    var arrForm = document.getElementsByClassName("loginForm");
    for (const form of Array.from(arrForm)) {
        form.classList.replace("active","disable");
      }
    var form = document.getElementById(formName);
    form.classList.replace("disable","active");
}