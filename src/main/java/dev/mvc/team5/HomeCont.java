package dev.mvc.team5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.event.EventProcInter;

@Controller
public class HomeCont {
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }

  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;
  
  // http://localhost:9091
  /*
   * @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
   * public ModelAndView home() { ModelAndView mav = new ModelAndView();
   * 
   * 
   * 
   * mav.setViewName("/index"); // /WEB-INF/views/index.jsp
   * 
   * return mav; }
   */

  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public ModelAndView home() {
    ModelAndView mav = new ModelAndView();
    
    
    
    mav.setViewName("/index");  // /WEB-INF/views/index.jsp
    
    return mav;
  }
  
  
  
}


