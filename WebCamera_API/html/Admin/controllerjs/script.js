function LogOut() {
    localStorage.setItem('user', null);
    window.location.href = "auth-login.html";
}
