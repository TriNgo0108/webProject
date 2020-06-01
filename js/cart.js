let product = document.getElementsByClassName('product').length;
//get length of product class
const uid = Number (document.getElementById('uid').value);
for (let i=0;i<product;i++){
    // add listener all button in product class
    const button = document.getElementById(i*3+1).addEventListener('click',()=>{
         pid = Number(document.getElementById(i*3+2).value);
      var   xmlhttpRequest = new XMLHttpRequest();
        xmlhttpRequest.onreadystatechange = function(){
            if (xmlhttpRequest.readyState===4 && xmlhttpRequest.status===200){
                        refreshCart(document.getElementById(i*3),xmlhttpRequest.responseText);
            }
        }
        // update database
        xmlhttpRequest.open('GET','./DB/deleteCart.php?uid='+uid+'&pid='+pid,true);
        xmlhttpRequest.send();
        product = document.getElementsByClassName('product').length;
    });
 
}
// get popup element 
let popup = document.querySelector('.popup');
//add eventListener for pay id 
document.getElementById('pay').addEventListener('click',()=>{
    console.log(product);
     if (product > 0){
        popup.classList.add('active');
        setTimeout(()=>{
            popup.classList.remove('active')
        },8000);
     }
});
// exit the popup
document.getElementById('exit').addEventListener('click',()=>{
    popup.classList.remove('active');
})
// remove product from cart
function refreshCart(productDOM,data){
    productDOM.remove();
    let newCart = data.split('&&');
    document.getElementById('amount').textContent='( Có '+newCart[0] +' sản phẩm )';
    document.getElementById('total').textContent=newCart[1]+' đ';
}