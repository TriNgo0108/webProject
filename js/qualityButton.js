
document.getElementById("increase").addEventListener("click",function (){
    document.getElementById("quality").value=Number(document.getElementById("quality").value)+1;
});
document.getElementById("decrease").addEventListener("click",function (){
    if (document.getElementById("quality").value>1){
        document.getElementById("quality").value=document.getElementById("quality").value-1;
    }
});
