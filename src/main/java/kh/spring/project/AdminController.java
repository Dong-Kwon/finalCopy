package kh.spring.project;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.AdminDAO;
import kh.spring.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO dao; 
	@Autowired
	private AdminService sv;
	@Autowired
	private TradeController tc;

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}

	@RequestMapping("/userManage")
	public String userManage() {
		return "userManage";
	}

	@RequestMapping("boardWriteDelete")
	public String boardWriteDelete(HttpServletRequest request) {
		String[] value =  request.getParameterValues("checkDelete");
		if(value!=null) {
			sv.boardDelete(value);
		}
		return tc.index(request);

	}

}


