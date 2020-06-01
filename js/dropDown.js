document.getElementById("city").addEventListener('change',()=>{
    let cid = document.getElementById("city").value;
    console.log(cid);
    xmlHttpRequest = new XMLHttpRequest();
    xmlHttpRequest.onreadystatechange = function(){
        if (xmlHttpRequest.readyState===4 && xmlHttpRequest.status===200){
            refreshDistrict(document.getElementById("district"),xmlHttpRequest.responseText);
        }
    }
    xmlHttpRequest.open("GET","./DB/getDistrict.php?cid="+cid,true);
    xmlHttpRequest.send();
    console.log(xmlHttpRequest);
});
function refreshDistrict(DistrictDOM,data){
    let length= DistrictDOM.options.length;
    for (i=0;i<length;i++){
        DistrictDOM.remove(0);
    }
    data = data.split(";;");
    for (i=0;i<data.length-1;i++){
        let district = document.createElement("option");
        let itemData = data[i].split("&&");
        district.value=itemData[0];
        district.text=itemData[1];
        DistrictDOM.add(district);
    }
}