<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <c:set var="contentsno" value="${contentsVO.contentsno }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book Word</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="title" value="${contentsVO.title }" />
<c:set var="price" value="${contentsVO.price }" />
<c:set var="dc" value="${contentsVO.dc }" />
<c:set var="saleprice" value="${contentsVO.saleprice }" />
<c:set var="point" value="${contentsVO.point }" />
<c:set var="recom" value="${contentsVO.recom }" />   
<script type="text/javascript">
 $(function() {
   CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값 
 });
 $(function(){
   $('#btn_recom').on("click", function() { update_recom_ajax(${contentsno}); });
   $('#btn_login').on('click', login_ajax);
   $('#btn_loadDefault').on('click', loadDefault);
 });
 function update_recom_ajax(contentsno) {
   // console.log('-> contentsno:' + contentsno);
   var params = "";
   // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
   params = 'contentsno=' + contentsno; // 공백이 값으로 있으면 안됨.
   // csrf 파라미터 추가
   // <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
   //params += '&${ _csrf.parameterName }=${ _csrf.token }';
   
   $.ajax(
     {
       url: '/contents/update_recom_ajax.do',
       type: 'post',  // get, post
       cache: false, // 응답 결과 임시 저장 취소
       async: true,  // true: 비동기 통신
       dataType: 'json', // 응답 형식: json, html, xml...
       data: params,      // 데이터
       success: function(rdata) { // 응답이 온경우
         // console.log('-> rdata: '+ rdata);
         var str = '';
         if (rdata.cnt == 1) {
           // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
           // console.log('-> btn_recom: ' + $('#btn_recom').html());
           $('#btn_recom').html('♥('+rdata.recom+')');
           $('#span_animation').hide();
         } else {
           $('#span_animation').html("지금은 추천을 할 수 없습니다.");
         }
       },
       // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
       error: function(request, status, error) { // callback 함수
         console.log(error);
       }
     }
   );  //  $.ajax END
   // $('#span_animation').css('text-align', 'center');
   $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
   $('#span_animation').show(); // 숨겨진 태그의 출력
 }
 <%-- 로그인 --%>
 function login_ajax() {
   var params = "";
   // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
   params = $('#frm_login').serialize(); 
   
   $.ajax(
     {
       url: '/member/login_ajax.do',
       type: 'post',  // get, post
       cache: false, // 응답 결과 임시 저장 취소
       async: true,  // true: 비동기 통신
       dataType: 'json', // 응답 형식: json, html, xml...
       data: params,      // 데이터
       success: function(rdata) { // 응답이 온경우
         var str = '';
         console.log('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
         
         if (rdata.cnt == 1) {  // 로그인 성공
           $('#div_login').hide();
           
           // 쇼핑카트에 insert 처리 Ajax 호출
           cart_ajax_post();            
           
         } else {
           alert('로그인에 실패했습니다. \n아이디/비밀번호를 확인해 주세요.');
         }
       },
       // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
       error: function(request, status, error) { // callback 함수
         console.log(error);
       }
     });  
 }
 function loadDefault() {
   $('#id').val('admin1');
   $('#passwd').val('1234');
 } 
 
 <%--장바구니에 상품 추가 --%>
 function cart_ajax(contentsno) {
   var f = $('#frm_login');
   $('#contentsno', f).val(contentsno);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
   
   console.log('-> contentsno: ' + $('#contentsno', f).val()); 
   
   // console.log('-> id:' + '${sessionScope.id}');
   if ('${sessionScope.id}' == '') {  // 로그인이 안되어 있다면
     $('#div_login').show();    // 로그인폼 출력  
     
   } else {  // 로그인 한 경우
     cart_ajax_post();   // 쇼핑카트에 insert 처리 Ajax 호출 
   }
 }
 <%-- 장바구니에 상품 등록 --%>
 function cart_ajax_post() {
   var f = $('#frm_login');
   var contentsno = $('#contentsno', f).val();  // 쇼핑카트 등록시 사용할 상품 번호.
   
   var params = "";
   params += 'contentsno=' + contentsno;
   console.log('-> cart_ajax_post: ' + params);
   // return;
   
   $.ajax(
     {
       url: '/cart/create.do',
       type: 'post',  // get, post
       cache: false, // 응답 결과 임시 저장 취소
       async: true,  // true: 비동기 통신
       dataType: 'json', // 응답 형식: json, html, xml...
       data: params,      // 데이터
       success: function(rdata) { // 응답이 온경우
         var str = '';
         console.log('-> cart_ajax_post cnt: ' + rdata.cnt);  // 1: 쇼핑카트 등록 성공
         
         if (rdata.cnt == 1) {
           var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?');
           if (sw == true) {
             // 쇼핑카트로 이동
            location.href='/cart/list_by_memberno.do';
           }else{
             location.reload(); 
           }             
         } else {
           alert('선택한 상품을 장바구니에 담지못했습니다.\n잠시후 다시 시도해주세요.');
         }
       },
       // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
       error: function(request, status, error) { // callback 함수
         console.log(error);
       }
     });
 }
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 <DIV class='content_body'>
  <DIV class='title_line'>
    <A href="../bookgrp/list.do" class='title_link'>도서 그룹</A> > <A
      href="../book/list_by_bookgrpno.do?bookgrpno=${bookgrpVO.bookgrpno }"
      class='title_link'>${bookgrpVO.grpname }</A> > <A
      href="./list_by_bookno_search_paging.do?bookno=${bookVO.bookno }" class='title_link'>${bookVO.bookname }</A>
      >${contentsVO.title } 
  
    <ASIDE class="aside_right">
    <c:choose> 
     <c:when test="${grade <= 10 }">
      <A href="./create.do?bookno=${bookVO.bookno }&bookgrpno=${bookVO.bookgrpno }">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page }">수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?contentsno=${contentsno}&now_page=${param.now_page }">파일 수정</A>
      <span class='menu_divide'>│</span> 
     </c:when>
    </c:choose>  
    <A href="javascript:location.reload();">새로고침</A> 
  </ASIDE> 
  </DIV><!-- title_line -->



    <DIV style="text-align: right; clear: both;">
      <form name='frm' id='frm' method='get'
        action='./list_by_bookno_search_paging.do'>
        <input type='hidden' name='bookno' value='${bookVO.bookno }'>
        <c:choose>
          <c:when test="${param.word != '' }">
            <%-- 검색하는 경우 --%>
            <input type='text' name='word' id='word'
              value='${param.word }' style='width: 20%;'>
          </c:when>
          <c:otherwise>
            <%-- 검색하지 않는 경우 --%>
            <input type='text' name='word' id='word' value=''
              style='width: 20%;'>
          </c:otherwise>
        </c:choose>
        <button type='submit'>검색</button>
        <c:if test="${param.word.length() > 0 }">
          <button type='button'
            onclick="location.href='./list_by_bookno_search_paging.do?bookno=${bookVO.bookno}&now_page=${param.now_page }&word='">검색
            취소</button>
        </c:if>
      </form>
    </DIV>
    
    <DIV class="menu_line" style="border-bottom:1px solid #d3d3d3;"></DIV>
  
    <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
    <DIV id='div_login' style='width: 80%; margin: 0px auto; display: none;'>
    <FORM name='frm_login' id='frm_login' method='POST' action='/member/login.do' class="form-horizontal">
    <input type="hidden" name="contentsno" id="contentsno" value="contentsno">
      
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
        <div class="col-md-8">
          <input type='text' class="form-control" name='id' id='id' 
                     value='${ck_id }' required="required" 
                     style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>                   
        </div>
      </div>   
   
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
        <div class="col-md-8">
          <input type='password' class="form-control" name='passwd' id='passwd' 
                    value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
          <Label>
            <input type='checkbox' name='passwd_save' value='Y' 
                      ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>
        </div>
      </div>   
   
      <div class="form-group">
        <div class="col-md-offset-4 col-md-8">
          <button type="button" id='btn_login' class="btn btn-primary btn-md">로그인</button>
          <button type='button' onclick="location.href='/member/create.do'" class="btn btn-primary btn-md">회원가입</button>
          <button type='button' id='btn_loadDefault' class="btn btn-primary btn-md">테스트 계정</button>
          <button type='button' id='btn_cancel' class="btn btn-primary btn-md"
                      onclick="$('#div_login').hide();">취소</button>
        </div>
      </div>   
      
    </FORM>
    </DIV>
    <%-- ******************** Ajax 기반 로그인 폼 종료 ******************** --%>
  

  
   <fieldset class="fieldset_basic" style="border:1px solid red;">
   
    <ul>
   
      <li class="li_none">
 
        <c:set var="file1saved" value="${contentsVO.file1saved.toLowerCase() }" />
        <c:set var="title" value="${contentsVO.title }" />
        <c:if test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}">
        
          <DIV style=" width:30%; float: left;  margin-left: 20%; margin-top:30px;  margin-bottom:30px;border:1px solid blue; ">
            <IMG src="/contents/storage/${contentsVO.file1saved }" style="width: 100%;">
          </DIV>
          
         </c:if>   
         
          <DIV style="width: 45%; height: 200px; float: left; margin-top:10%; margin-left:30px; border:1px solid green;">
            <span style="font-size: 1.5em; font-weight: bold;">${title }</span><br>
            <span style="color: #FF0000; font-size: 2.0em;">${dc} %</span>
            <span style="font-size: 1.5em; font-weight: bold;"><fmt:formatNumber value="${saleprice}" pattern="#,###" /> 원</span>
            <del><fmt:formatNumber value="${price}" pattern="#,###" /> 원</del><br>
            <span style="font-size: 1.2em;">포인트: <fmt:formatNumber value="${point}" pattern="#,###" /> 원</span><br>
             <span style="font-size: 1.0em;">수량</span><br>
            <form>
              <input type='number' name='ordercnt' value='1' required="required" 
                       min="1" max="99999" step="1" class="form-control" style='width: 30%;'><br>
            <button type='button' id='btn_cart' onclick="cart_ajax(${contentsno })" class="btn btn-info">장바 구니</button>           
            <button type='button' onclick="" class="btn btn-info">바로 구매</button>
            <button type='button' onclick="" class="btn btn-info">관심 상품</button>
            <button type='button' id="btn_recom" class="btn btn-info">♥(${recom })</button>
            <span id="span_animation"></span>
     
            </form>
          </DIV> 
  
  <DIV style="float:left; width:100%; border-bottom:2px solid #d3d3d3; margin-bottom:30px; margin-left:30px; margin-right:30px;"></DIV>
    
         

        <DIV style="border:3px solid blue; float:left; width:100%; height:100%; margin-left:20px;" >${contentsVO.content }</DIV>
              
      </li>
      <li class="li_none">
        <DIV style='text-decoration: none; border:3px solid black; float:left; margin-top:10px; margin-left:20px;'>
          검색어(키워드): ${contentsVO.word }
        </DIV>
      </li>
      <li class="li_none">
        <DIV style="margin:5px solid green;">
          <c:if test="${contentsVO.file1.trim().length() > 0 }">
             첨부 파일: <A href='/download?dir=/contents/storage&filename=${contentsVO.file1saved}&downname=${contentsVO.file1}'>${contentsVO.file1}
             </A> (${contentsVO.size1_label})  </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>
 
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>