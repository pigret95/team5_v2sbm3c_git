package dev.mvc.contents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.book.BookProcInter;
import dev.mvc.book.BookVO;
import dev.mvc.bookgrp.BookgrpProcInter;
import dev.mvc.bookgrp.BookgrpVO;
//import dev.mvc.member.MemberProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ContentsCont {
  @Autowired
  @Qualifier("dev.mvc.bookgrp.BookgrpProc")
  private BookgrpProcInter bookgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.book.BookProc")
  private BookProcInter bookProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;
  
  public ContentsCont() {
    System.out.println("-> ContentsCont created.");
  }

  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/contents/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 등록폼
   * 사전 준비된 레코드: 관리자 1번, cateno 1번, categrpno 1번을 사용하는 경우 테스트 URL
   * http://localhost:9091/contents/create.do?bookno=2
   * 
   * @return
   */
  @RequestMapping(value = "/contents/create.do", method = RequestMethod.GET)
  public ModelAndView create(int bookno) {
    ModelAndView mav = new ModelAndView();
    
    BookVO bookVO = this.bookProc.read(bookno);
    BookgrpVO bookgrpVO = this.bookgrpProc.read(bookVO.getBookgrpno());
    
    mav.addObject("bookVO", bookVO);
    mav.addObject("bookgrpVO", bookgrpVO);
    
    mav.setViewName("/contents/create"); // /webapp/WEB-INF/views/contents/create.jsp
    // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
    // mav.addObject("content", content);

    return mav; // forward
  }
  
  /**
   * 등록 처리 http://localhost:9091/contents/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/contents/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = "";          // 원본 파일명 image
    String file1saved = "";  // 저장된 파일명, image
    String thumb1 = "";     // preview image

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir");
    // System.out.println("-> User dir: " + user_dir);
    //  --> User dir: F:\ai8\ws_frame\resort_v1sbm3a
    
    // 파일 접근임으로 절대 경로 지정, static 지정
    // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage
    String upDir =  user_dir + "/src/main/resources/static/contents/storage/"; // 절대 경로
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택">
    MultipartFile mf = contentsVO.getFile1MF();
    
    file1 = mf.getOriginalFilename(); // 원본 파일명
    long size1 = mf.getSize();  // 파일 크기
    
    if (size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1saved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
        thumb1 = Tool.preview(upDir, file1saved, 250, 200); 
      }
      
    }    
    
    contentsVO.setFile1(file1);
    contentsVO.setFile1saved(file1saved);
    contentsVO.setThumb1(thumb1);
    contentsVO.setSize1(size1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.contentsProc.create(contentsVO); 
    
    // -------------------------------------------------------------------
    // PK의 return 
    // -------------------------------------------------------------------
    // System.out.println("--> contentsno: " + contentsVO.getContentsno());
    // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
    // -------------------------------------------------------------------
    

    mav.addObject("cnt", cnt); 


    mav.addObject("bookno", contentsVO.getBookno()); // redirect parameter 적용
    mav.addObject("url", "/contents/create_msg"); // create_msg.jsp, redirect parameter 적용

    // 연속 입력 지원용 변수, Call By Reference에 기반하여 contentsno를 전달 받음
    mav.addObject("contentsno", contentsVO.getContentsno());
    
    mav.setViewName("redirect:/contents/msg.do"); 
    
    return mav; // forward
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9091/contents/list_by_bookno_search_paging.do?bookno=2&word=&now_page=1
   * 
   * @param bookno
   * @param word
   * @param now_page
   * @return
   */
  @RequestMapping(value = "/contents/list_by_bookno_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_by_bookno_search_paging(@RequestParam(value = "bookno", defaultValue = "1") int bookno,
      @RequestParam(value = "word", defaultValue = "") String word,
      @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
    System.out.println("--> now_page: " + now_page);

    ModelAndView mav = new ModelAndView();

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("bookno", bookno); // #{bookno}
    map.put("word", word); // #{word}
    map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

    // 검색 목록
    List<ContentsVO> list = contentsProc.list_by_bookno_search_paging(map);
    mav.addObject("list", list);

    // 검색된 레코드 갯수
    int search_count = contentsProc.search_count(map);
    mav.addObject("search_count", search_count);

    BookVO  bookVO = bookProc.read(bookno);
    mav.addObject("bookVO", bookVO);

    BookgrpVO bookgrpVO = bookgrpProc.read(bookVO.getBookgrpno());
    mav.addObject("bookgrpVO", bookgrpVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * 
     * @param list_file 목록 파일명
     * 
     * @param bookno 카테고리번호
     * 
     * @param search_count 검색(전체) 레코드수
     * 
     * @param now_page 현재 페이지
     * 
     * @param word 검색어
     * 
     * @return 페이징 생성 문자열
     */
    String paging = contentsProc.pagingBox("list_by_bookno_search_paging.do", bookno, search_count, now_page, word);
    mav.addObject("paging", paging);

    mav.addObject("now_page", now_page);

    // /contents/list_by_bookno_table_img1_search_paging.jsp
    mav.setViewName("/contents/list_by_bookno_search_paging");

    return mav;
  }
  
  // http://localhost:9091/contents/read.do
  /**
   * 조회
   * @return
   */
  @RequestMapping(value="/contents/read.do", method=RequestMethod.GET )
  public ModelAndView read(int contentsno,
      @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
    ModelAndView mav = new ModelAndView();

    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    mav.addObject("contentsVO", contentsVO); // request.setAttribute("contentsVO", contentsVO);

    BookVO bookVO = this.bookProc.read(contentsVO.getBookno());
    mav.addObject("bookVO", bookVO); 

    BookgrpVO bookgrpVO = this.bookgrpProc.read(bookVO.getBookgrpno());
    mav.addObject("bookgrpVO", bookgrpVO); 
    mav.addObject("now_page", now_page);
    mav.setViewName("/contents/read"); // /WEB-INF/views/contents/read.jsp
        
    return mav;
  }
}
