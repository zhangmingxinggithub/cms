package controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin/common/")
public class commonController extends BaseController {

	
	@RequestMapping(value = "/selectDept.html")
	public String selectDept() {
		return "/admin/commonJsp/selectDept";
	}

}
