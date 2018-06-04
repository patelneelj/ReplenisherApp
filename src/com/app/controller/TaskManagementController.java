package com.app.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.app.dto.TaskDto;
import com.app.model.Subject;
import com.app.model.TaskDistribution;
import com.app.model.User;
import com.app.service.SubjectService;
import com.app.service.TaskDistributionComparator;
import com.app.service.TaskService;
import com.app.service.Userservice;
import com.app.util.Helper;

@Controller
public class TaskManagementController {
	
	@Autowired
	private TaskService taskservice;
	
	@Autowired
	private Userservice userservice;
	
	@Autowired
	private SubjectService subservice;

	@RequestMapping(value="mytasklist.html",method=RequestMethod.GET)
	public ModelAndView loadMyTaskList(HttpServletRequest request)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String role = auth.getAuthorities().toString();
		if(role.contains("ROLE_MANAGER"))
		{
			ModelAndView view = new ModelAndView("mytasklistmgr");
			String username= Helper.getUsername();
			User user = userservice.findByusername(username);
			List<TaskDistribution> distributionList = taskservice.getAllTaskList("OPEN", user);
			view.addObject("tasklist", distributionList);
			return view;
		}
		else
		{
			ModelAndView view = new ModelAndView("mytasklist");
			String username= Helper.getUsername();
			User user = userservice.findByusername(username);
			List<TaskDistribution> distributionList = taskservice.getMyTaskList("OPEN", user);
			view.addObject("tasklist", distributionList);
			return view;
		}

		
	}
	
	@RequestMapping(value="myclosetasklist.html",method=RequestMethod.GET)
	public ModelAndView loadMyCloseTaskList(HttpServletRequest request)
	{
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String role = auth.getAuthorities().toString();
		String username= Helper.getUsername();
		User user = userservice.findByusername(username);
		if(role.contains("ROLE_MANAGER"))
		{
			ModelAndView view = new ModelAndView("myclosetasklistmgr");
			List<TaskDistribution> distributionList = taskservice.getAllTaskList("CLOSE", user);
			view.addObject("tasklist", distributionList);
			return view;
		}
		else
		{
			ModelAndView view = new ModelAndView("myclosetasklist");
			List<TaskDistribution> distributionList = taskservice.getMyTaskList("CLOSE", user);
			view.addObject("tasklist", distributionList);
			return view;
		}
		
		
	}
	
	@RequestMapping(value="sortmylistbyrank.html",method=RequestMethod.GET)
	public ModelAndView sortMyTaskList(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView("mytasklistrank");
		String username= Helper.getUsername();
		User user = userservice.findByusername(username);
		List<TaskDistribution> distributionList = taskservice.getMyTaskList("OPEN", user);
		Collections.sort(distributionList, new TaskDistributionComparator() );
		view.addObject("tasklist", distributionList);
		return view;
	}
	
	
	@RequestMapping(value="viewtaskdetails.html",method=RequestMethod.POST)
	public ModelAndView loadTaskDetails(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView("taskdetails");
		String did = request.getParameter("tid");
		Integer distributionId = Integer.parseInt(did);
		List<TaskDistribution> taskdistributionList = taskservice.getDistibutionListByTaskId(distributionId);
		TaskDistribution distributionList = taskdistributionList.get(0);
		TaskDto d = new TaskDto();
		d.setTaskdistibutionId(distributionList.getId());
		view.addObject("tasklist", taskdistributionList);
		view.addObject("taskdto", d);
		return view;
	}
	
	@RequestMapping(value="updatetask.html",method=RequestMethod.POST)
	public ModelAndView updateTaskDetails(@ModelAttribute("taskdto") TaskDto taskDto)
	{
		ModelAndView view = new ModelAndView("response");
		
		String status = taskservice.updateTaskDetails(taskDto);
		if(status!=null && status.equals("fail"))
		{
			view.addObject("message", "Task could not be updated!!");
		}
		else
		{
			view.addObject("message", "Task Updated successfully!!");
		}
				
		return view;

	}
	
	
	@RequestMapping(value="createtask.html",method=RequestMethod.GET)
	public ModelAndView createTask(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView("addtask");
		TaskDto taskdto = new TaskDto();
		view.addObject("taskdto", taskdto);
		List<Subject> subjectseries = subservice.subjectList();
		List<User> userList = new ArrayList<User>();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String role = auth.getAuthorities().toString();
		if(role.contains("ROLE_MANAGER"))
		{
			userList = userservice.getAllEmployee();
		}
		else
		{
			String username = Helper.getUsername();
			User user = userservice.findByusername(username);
			userList.add(user);
		}
		
		view.addObject("subjectlist", subjectseries);
		view.addObject("userlist", userList);
		return view;
	}
	
	@RequestMapping(value="submittask.html",method=RequestMethod.POST)
	public ModelAndView submitTask(HttpServletRequest request,@ModelAttribute("taskdto") TaskDto taskDto)
	{
		ModelAndView view = new ModelAndView("response");
		
		String status = taskservice.saveTaskList(taskDto);
		if(status!=null && status.equals("fail"))
		{
			view.addObject("message", "Task could not be created!!");
		}
		else
		{
			view.addObject("message", "Task created successfully!!");
		}
				
		return view;
	}
	
	
}
