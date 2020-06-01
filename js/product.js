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
 imageZoom("image", "result");
function imageZoom(imgID, resultID) {
    var img, result, cx, cy;
    img = document.getElementById(imgID);
    result = document.getElementById(resultID);
    let lens = document.getElementById('lens');
    /*insert lens:*/
    img.parentElement.insertBefore(lens, img);
    /*calculate the ratio between result DIV and lens:*/
    cx = result.offsetWidth / lens.offsetWidth;
    cy = result.offsetHeight / lens.offsetHeight;
    /*set background properties for the result DIV:*/
    result.style.backgroundImage = "url('" + img.src + "')";
    result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
    /*execute a function when someone moves the cursor over the image, or the lens:*/
    lens.addEventListener("mousemove", moveLens);
    img.addEventListener("mousemove", moveLens);
    /*and also for touch screens:*/
    lens.addEventListener("touchmove", moveLens);
    img.addEventListener("touchmove", moveLens);
    function moveLens(e) {
      var pos, x, y;
      /*prevent any other actions that may occur when moving over the image:*/
      e.preventDefault();
      /*get the cursor's x and y positions:*/
      pos = getCursorPos(e);
      /*calculate the position of the lens:*/
      x = pos.x - (lens.offsetWidth / 2);
      y = pos.y - (lens.offsetHeight / 2);
      /*prevent the lens from being positioned outside the image:*/
      if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
      if (x < 0) {x = 0;}
      if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
      if (y < 0) {y = 0;}
      /*set the position of the lens:*/
      lens.style.left = x + "px";
      lens.style.top = y + "px";
      /*display what the lens "sees":*/
      result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
    }
    function getCursorPos(e) {
      var a, x = 0, y = 0;
      e = e || window.event;
      /*get the x and y positions of the image:*/
      a = img.getBoundingClientRect();
      /*calculate the cursor's x and y coordinates, relative to the image:*/
      x = e.pageX - a.left;
      y = e.pageY - a.top;
      /*consider any page scrolling:*/
      x = x - window.pageXOffset;
      y = y - window.pageYOffset;
      return {x : x, y : y};
    }
  }