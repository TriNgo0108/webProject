var product = document.getElementsByClassName('product').length;
// get length of like list
const uid = Number (document.getElementById('uid').value);
for (let i=0;i<product;i++){
    // add listener all button in product class
    const button = document.getElementById(i*3+1).addEventListener('click',()=>{
         pid = Number(document.getElementById(i*3+2).value);
      var   xmlhttpRequest = new XMLHttpRequest();
        xmlhttpRequest.onreadystatechange = function(){
            if (xmlhttpRequest.readyState===4 && xmlhttpRequest.status===200){
                        refreshLike(document.getElementById(i*3));
            }
        }
        // update database
        xmlhttpRequest.open('GET','./DB/deleteLike.php?uid='+uid+'&pid='+pid,true);
        xmlhttpRequest.send();

    });
 
}
// remove product from like list
function refreshLike(productDOM){
    productDOM.remove();
}