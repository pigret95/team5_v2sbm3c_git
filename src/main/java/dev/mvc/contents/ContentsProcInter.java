package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ContentsProcInter {
  /**
   * 등록
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);
 


  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param list_file 목록 파일명 
   * @param bookno 종류번호
   * @param search_count 검색 갯수
   * @param now_page 현재 페이지, now_page는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String list_file, int bookno, int search_count, int now_page, String word);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<ContentsVO> list_by_bookno_search_paging(HashMap<String, Object> map);
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
}










