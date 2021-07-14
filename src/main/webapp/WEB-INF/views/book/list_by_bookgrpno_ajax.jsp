<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Book world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
$(function() {
  $('#btn_update_cancel').on('click', cancel);
  $('#btn_delete_cancle').on('click',cancel);
});

function cancel() {
  $('#panel_create').css("display","");  
  $('#panel_update').css("display","none");
  $('#panel_delete').css("display","none");  
}

// 수정폼
function read_update_ajax(bookno) {
  $('#panel_create').css("display","none"); // hide, 태그를 숨김 
  $('#panel_update').css("display",""); // show, 숨겨진 태그 출력 
  
  //console.log( 'bookno=' + bookno);
  var params = "";
  // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  params = 'bookno=' + bookno; // 공백이 값으로 있으면 안됨.

  $.ajax(
    {
      url: '/book/read_ajax.do',
      type: 'get',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
        // {"categrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
        var bookno = rdata.bookno;
        var bookgrpno=rdata.bookgrpno;
        var bookname=rdata.bookname;
        var rdate = rdata.rdate;

        var frm_update = $('#frm_update');
        $('#bookno', frm_update).val(bookno);
        $('#bookgrpno', frm_update).val(bookgrpno);
        $('#bookname', frm_update).val(bookname);
        $('#rdate', frm_update).val(rdate);
        

      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    }
  );  //  $.ajax END

} 
<%-- bookgrpno가 같은 모든 레코드 삭제 --%>
function delete_by_bookgrpno(bookgrpno) {
  var f = $('#frm_delete_by_bookgrpno');
  f.attr('action', './delete_by_bookgrpno.do');
  $('#bookgrpno', f).val(bookgrpno)
  f.submit();
} 

// 다수의 chno를 전달하여 contents 레코드 삭제
function delete_contents_by_all_bookno() {
  
  var f = $('#frm_delete_by_bookgrpno');
  f.attr('action', '../contents/delete_contents_by_all_bookno.do');
  var booknos = $('#booknos', f).val();
  
  booknos = booknos.substr(0, booknos.length-1);
  console.log('-> booknos: ' + booknos);
  console.log('-> action: ' + f.attr('action'));

  $('#booknos').val(booknos);

  f.submit();
}
//삭제폼
function read_delete_ajax(bookno) {
  $('#panel_update').css("display","none"); 
  $('#panel_create').css("display","none");  //hide,태그를 숨김
  $('#panel_delete').css("display",""); //show,숨겨진 태크 출력
  // console.log('-> categrpno:' + categrpno);
  var params = "";
  // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  params = 'bookno=' + bookno; // 공백이 값으로 있으면 안됨.
  $.ajax(
    {
      url: '/book/read_ajax.do',
      type: 'get',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열

        var bookno = rdata.bookno;
        var  bookgrpno=rdata.bookgrpno;
        var bookname=rdata.bookname;
        var rdate = rdata.rdate;
        var count_by_bookno=parseInt(rdata.count_by_bookno);
        console.log('count_by_bookno:'+count_by_bookno);
        var frm_delete = $('#frm_delete');
        $('#bookno', frm_delete).val(bookno);
        $('#bookgrpno', frm_delete).val(bookgrpno);
        $('#frm_delete_bookname').html(bookname);
    


        if (count_by_bookno > 0 ) { // 자식 레코드가 있다면
          $('#frm_delete_count_by_bookno').show(); // 자식레코드 보여줌
          $('#frm_delete_count_by_bookno_panel').html('관련자료 : ' + count_by_bookno +'건'); 
          $('#a_list_by_bookno').attr('href', '../contents/list_by_bookno_search_paging.do?chno=' + bookno);
        } else { // 자식 레코드가 없는 경우
          $('#frm_delete_count_by_bookno').hide();  // 자식레코드 숨김
        } //else end
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    }
  );  //  $.ajax END
} 
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../bookgrp/list.do" class='title_link'>도서 그룹</A> > ${bookgrpVO.grpname }
</DIV>
<ASIDE class="aside_right">
    <form name='frm_delete_by_bookgrpno' id='frm_delete_by_bookgrpno' action='' method='post'>
      <input type='hidden' name='bookgrpno' id='bookgrpno' value=''>
      <input type='hidden' name='booknos' id='booknos' value=''>
      <A href="javascript: delete_contents_by_all_bookno()">모든 카테고리의 관련 자료 삭제</A>
      <span class='menu_divide' >│</span>
      <A href="javascript: delete_by_bookgrpno(${param.bookgrpno})">모든 카테고리 삭제</A>
    </form>
 </ASIDE> 
<DIV class='content_body'>


<!-- 신규 등록 -->
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label> 그룹 번호</label>
      <input type='hidden' name='bookgrpno' value='${param.bookgrpno }'  required="required" style='width: 3%;' >
      ${param.bookgrpno }
      <label>종류</label>
      <input type='text' name='bookname'  id='bookname'  value='' required="required" style='width: 10%;'
                 autofocus="autofocus">
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  <%--수정--%> 
<DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center ;display:none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='bookno' id='bookno' value='${bookVO.bookno }'>
          <label> 번호</label>
      <input type='number' name='bookgrpno'   id='bookgrpno' required="required" style='width: 3%;'
           min='1'  autofocus="autofocus">
                 <label>종류</label>
      <input type='text' name='bookname' id='bookname'  required="required" style='width: 40%;'
                 >
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  <%-- 삭제 --%>
    <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;display:none;'>
  <div class="msg_warning">카테고리를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='bookno' id='bookno' value='${bookVO.bookno }'>
      <input type='hidden' name='bookgrpno' id='bookgrpno' value='${param.bookgrpno }'>
          <label>종류 </label>: <span id='frm_delete_bookname'></span> 
         
          
                 <%-- 자식 레코드 갯수 출력 --%>
      <div id='frm_delete_count_by_bookno' style='margin:10px auto;
               color:#FF0000; font-weight: bold; display: none;'>
        
        <%--건수 누적되는 문제 SPAN id 값 주기  --%>       
       <span id='frm_delete_count_by_bookno_panel'></span>
       
       <%-- id를 부여하여 chgrpno를 전달 --%>
       『<A id='a_list_by_bookno' href="../ch/list_by_bookno.do?bookno=${bookgrpno }">관련 자료 삭제하기</A>』
      </div>
      <button type="submit" id='submit'>삭제</button>
      <button type="button" id='btn_delete_cancle'>취소</button>
    </FORM>
  </DIV>
  
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 5%;'/>
    <col style='width: 5%;'/>
      <col style='width: 20%;'/>
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
    <TH class="th_bs">번호</TH>
     <TH class="th_bs">그룹<br>번호</TH>
      <TH class="th_bs">종류</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="bookVO" items="${list}">
 <c:set var="bookno" value="${bookVO.bookno }" />
      <c:set var="bookgrpno" value="${bookVO.bookgrpno }" />
      
      <script type="text/javascript">
        var booknos = $('#booknos').val();
        booknos = booknos + "${booknos},";  // 1,2,3,5
        $('#booknos').val(booknos); // EL -> jquery -> HTML
      </script>
      <TR>
      <TD class="td_bs_left">${bookVO.bookno }</TD>
      <TD class="td_bs_left">${bookVO.bookgrpno }</TD>
         <TD class="td_bs_left"><A href="../contents/list_by_bookno_search_paging.do?bookno=${bookVO.bookno }&now_page=1 ">${bookVO.bookname }</A></TD>
        <TD class="td_bs">${bookVO.rdate.substring(0, 10) }</TD>
        
        
        <TD class="td_bs">
          <A href="javascript:read_update_ajax(${bookno })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="javascript:read_delete_ajax(${bookno })"  title="삭제"><span class="glyphicon glyphicon-trash"></span></A> 
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

