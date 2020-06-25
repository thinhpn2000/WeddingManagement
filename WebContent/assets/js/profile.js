var changePassword = () => {
    let profile = document.getElementsByClassName('profile-info')[0];
    let formPswd = document.getElementsByClassName('profile-password')[0];
    if(!profile.classList.contains('disable')) {
        profile.classList.add('disable');
        formPswd.classList.add('active');
        document.getElementsByClassName('profile-title')[0].innerHTML = 'Change password';
    } else {
        profile.classList.remove('disable');
        formPswd.classList.remove('active');
        document.getElementById("profile-password").reset();
        document.getElementsByClassName('profile-title')[0].innerHTML = 'Formal profile';
    }
}
var checkMatching = () => {
    let repswd = document.getElementById('confirmPassword').value;
    let pswd = document.querySelector('input[name="password"').value;
    if(repswd !== pswd && repswd !== '') {
        document.getElementsByClassName('alert')[0].style.display = 'block';
        document.getElementById('btnAccept').disabled = true;
    } else {
        document.getElementsByClassName('alert')[0].style.display = 'none';
        document.getElementById('btnAccept').disabled = false;
    }
}