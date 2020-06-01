 let buy = document.getElementById('buy');
 let closeBtn = document.querySelector(".popup__close");
 let popup = document.querySelector(".popup");
 // get buy element and check buy element is exist
 if (typeof(buy) !='undefined' && buy != null){
     // if exist add listenser for buy element
    buy.addEventListener('click',()=>{
        popup.classList.add("active");     
        setTimeout(()=>{popup.classList.remove("active");},1000);
        //active popup
        //-----------
        // ajax
        let uid = Number(document.getElementById('uid').value);
        let pid = Number(document.getElementById('pid').value);
        let quality = Number(document.getElementById('quality').value);
        // add product to cart
        xmlHTTPrequest = new XMLHttpRequest();
        xmlHTTPrequest.open('GET','./DB/addCart.php?uid='+uid+'&pid='+pid+'&quality='+quality);
        xmlHTTPrequest.send();
    });
 }
 // the same to buy element
 var like = document.getElementById('like');
 if (typeof(like) !='undefined' && like !=null){
    like.addEventListener('click',()=>{
        let uid = Number(document.getElementById('uid').value);
        let pid = Number(document.getElementById('pid').value);
        //add product to like list
        xmlHTTPrequest = new XMLHttpRequest();
        xmlHTTPrequest.open('GET','./DB/likeProduct.php?uid='+uid+'&pid='+pid);
        xmlHTTPrequest.send();
    });
 }


  
