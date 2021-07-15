<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>book</title>
<!-- /static 기준 -->
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
  
  <DIV class="main_contents" style='text-align: center;'>
    메인컨텐츠자리
    <br>
    <br>
    개발url
    <ul>
      <li><a href="/bookgrp/list.do"> 도서 카테고리 생성,수정,삭제</a></li>
    </ul>
    
  </DIV>
    <DIV class="sub_contents" style='text-align: center;'>
    이벤트자리
  </DIV>
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>


