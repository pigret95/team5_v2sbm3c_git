<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
  <meta charset="UTF-8"> 
  <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
  <title>Book Word</title>
   
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
   
  <script type="text/JavaScript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
</head> 
 
<body>
  <jsp:include page="../menu/top.jsp" flush='false' />
    <div class="title_line">
          
    </div>
    
    <DIV class='title_line'>
      <A href="/faq/service_home.do" class='title_link'>고객 센터 ></A> 
      <A href="" class='title_link'>1:1 문의 ></A>
      <A href=""  class='title_link'>문의 등록</A>
    </DIV> 
  
   
    <div class='menu_line'></div>
    
    <DIV style='width: 100%;'>
      <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
               enctype="multipart/form-data">
        <input type="hidden" name="memberno" value="${order_itemVO.memberno }">        
        <input type="hidden" name="order_itemno" value="${order_itemVO.order_itemno }">
        
        <div class="form-group">   
          <div class="col-md-12">
            <input type='text' class="form-control" name='title' value='' placeholder="제목을 입력하세요" required="required" style='width: 80%;'>
          </div>
        </div>   
        
        <div class="form-group">   
          <div class="col-md-12">
            <textarea class="form-control
            " name='content' id='content' rows='10' placeholder="문의하실 내용을 입력하세요" ></textarea>
          </div>
        </div>
        
        <div class="form-group">   
          <div class="col-md-12">
            <%-- 실제 컬럼명: file1, Spring File 객체 대응: file1MF --%>
            <input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택">
          </div>
        </div>
        
        <DIV class='content_bottom_menu'>
          <button type="submit" class="btn btn-info">등록</button>
          <button type="button" 
                      onclick="history.back()" 
                      class="btn btn-info">취소[목록]</button>
        </DIV>
         
      </FORM>
    </DIV>
  
    
  <jsp:include page="../menu/bottom.jsp" flush='false' />
  </body>
 
</html>