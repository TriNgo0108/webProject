<?php

function computePagination($totalProduct, $productPPage){
    $totalPage = ceil($totalProduct / $productPPage) - 1;
    if (isset($_REQUEST['p'])){
        $p =  $_REQUEST['p'] > $totalPage ? 0 : $_REQUEST['p'];
    }
    else $p = 0;
    $p_start = $p * $productPPage;
    $p_next = $p + 1 > $totalPage ? 0 : $p + 1;
    $p_pre = $p - 1 < 0 ? 0 : $p -1;
    return array('pageNo'=>$p,'pagePre'=>$p_pre,'pageNext'=>$p_next,'pageStart'=>$p_start);
}
?>
