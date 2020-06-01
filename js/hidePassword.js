document.getElementById("hide").addEventListener("click",function (){
    let password = document.getElementById("password");
    if (password.type=="password"){
        password.type="text";
    }
    else{
    
        password.type="password";
   }
});

