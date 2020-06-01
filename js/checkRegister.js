let registerButton = document.getElementById("register");
let samePassword = false;
let isPhone = false;
let isEmai = false;
registerButton.disable=true;
document.getElementById("repassword").addEventListener('input',()=>{
    let repassword = document.getElementById("repassword");
    let password = document.getElementById("password");
    if (repassword.value!=password.value){ 
        console.log("wrong");
        document.getElementById("error-repassword").textContent="Sai mật khẩu";
        
    }
    else{
        console.log("OK");
        document.getElementById("error-repassword").textContent="";
        document.getElementById("error-password").textContent="";
        samePassword=true;
        activeButton();
        
    }
});
document.getElementById("password").addEventListener('input',()=>{
    let repassword = document.getElementById("repassword");
    let password = document.getElementById("password");
    if (repassword.value==""){
        console.log("waiting repassword");
        return;
        
    }
    else{
        if (repassword.value!=password.value){ 
            console.log("wrong");
            document.getElementById("error-password").textContent="Sai mật khẩu";
        
        }
        else{
            console.log("OK");
            document.getElementById("error-password").textContent="";
            document.getElementById("error-repassword").textContent="";
            samePassword=true;
            activeButton();
        
        }
    }
});
document.getElementById("phone").addEventListener('input',()=>{
    let phone = document.getElementById("phone").value;
    const pattern = /[0-9]{10}/;
    isPhone = pattern.test(phone);
    if (!isPhone){
        document.getElementById("error-phone").textContent="Số điện thoại không hợp lệ";
        
    }
    else{
        document.getElementById("error-phone").textContent="";
        activeButton();
        
    }
});
document.getElementById("email").addEventListener('input',()=>{
    let email = document.getElementById("email").value;
    if (!email.includes('@') || !email.includes(".")){
        document.getElementById("error-email").textContent="Email không hợp lệ";
    }
    else{
        document.getElementById("error-email").textContent="";
        isEmai=true;
        activeButton();
    }
});
function activeButton(){
    if (isEmai && isPhone && samePassword){
        registerButton.disable=false;
    }
}