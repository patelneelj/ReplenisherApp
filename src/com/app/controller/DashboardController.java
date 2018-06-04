package com.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class DashboardController {

	@RequestMapping(value="/dashboard.html",method=RequestMethod.GET)
	public ModelAndView authenticationHandler(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView(new RedirectView("userdashboard.html",
				true));
		return view;
	}
	
	@RequestMapping(value="/userdashboard.html",method=RequestMethod.GET)
	public String loadDashboard()
	{
		return "userdashboard";
	}
	
	@RequestMapping(value="/login.html",method=RequestMethod.GET)
	public String loginpage()
	{
		return "login";
	}
	
}
