package TST_teamproject.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import TST_teamproject.main.service.MainService;

@Controller
@EnableAutoConfiguration
public class MainController {
	
	@RequestMapping(value = "/")
	public String blank() {
		return "blank.test";
	}
	
	
}
