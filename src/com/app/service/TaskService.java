package com.app.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.RefMasterMaintainDAOImpl;
import com.app.dto.TaskDto;
import com.app.model.Task;
import com.app.model.TaskDistribution;
import com.app.model.User;
import com.app.util.ApplicationConstantsUtil;
import com.app.util.Helper;
import com.app.util.SearchParameter;

@Service
public class TaskService {

	@SuppressWarnings("rawtypes")
	@Autowired
	private RefMasterMaintainDAOImpl refMasterMaintainDAOImpl;
	
	@Autowired
	private Userservice userservice;
	
	@SuppressWarnings({ "unchecked" })
	public List<TaskDistribution> getMyTaskList(String status,User user)
	{
		List<SearchParameter> searchparameterList = new ArrayList<SearchParameter>();
		searchparameterList.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "taskId.status",status ));
		searchparameterList.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "assignedTo.userId",user.getUserId()));
		List<TaskDistribution> taskList = refMasterMaintainDAOImpl.findEntityList(TaskDistribution.class, searchparameterList, null);
		return taskList;
		
	}
	
	@SuppressWarnings("unchecked")
	public String saveTaskList(TaskDto tdto)
	{
		String username = Helper.getUsername();
		User user = userservice.findByusername(username);
		String status = "fail";
		if(tdto.getUserIds()!=null && tdto.getUserIds().size()>0)
		{
			Task t = new Task();
			
			t.setCreationDate(new Date());
			t.setName(tdto.getTaskName());
			t.setPriority(tdto.getPriority());
			t.setStatus("OPEN");
			t.setSubject(tdto.getSubject());
			t.setCreatedBy(user);
			if(tdto.getPriority().equals("High"))
			{
				t.setEstimatedDate(Helper.getFutureDate(3));
			}
			else if(tdto.getPriority().equals("Low"))
			{
				t.setEstimatedDate(Helper.getFutureDate(7));
			}
			else
			{
				t.setEstimatedDate(Helper.getFutureDate(5));
			}
			if(tdto.getRecurring()!=null)
			{
				t.setIsRecurring("Y");
				
			}
			else
			{
				t.setIsRecurring("N");
			}
			
			Integer id= (Integer) refMasterMaintainDAOImpl.saveEntity(t);
			t.setId(id);
			List<Integer> userIds = tdto.getUserIds();
			for(Integer i : userIds)
			{
				TaskDistribution td = new TaskDistribution();
				User user1 = new User();
				user1.setUserId(i);
				td.setAssignedTo(user1);
				td.setTaskId(t);
				refMasterMaintainDAOImpl.saveEntity(td);
			}
			
			status="success";
			
		}
		return status;
	}

	public TaskDistribution taskDetails(Integer distributionId) {
		List<SearchParameter> searchparameterList = new ArrayList<SearchParameter>();
		searchparameterList.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "id",distributionId ));
		List<TaskDistribution> taskList = refMasterMaintainDAOImpl.findEntityList(TaskDistribution.class, searchparameterList, null);
		if(taskList!=null && taskList.size()>0)
		{
			return taskList.get(0);
		}
		else
		{
			return new TaskDistribution();
		}
		
	}

	public String updateTaskDetails(TaskDto taskDto) {
		String status = "fail";
		if(taskDto.getComments()!=null)
		{
			TaskDistribution td = this.taskDetails(taskDto.getTaskdistibutionId());
			td.setComments(taskDto.getComments());
			
			refMasterMaintainDAOImpl.saveOrUpdateEntity(td);
			
			if(taskDto.getStatus()!=null && taskDto.getStatus().equals("CLOSE"))
			{
				Task t = td.getTaskId();
				t.setActualEndDate(new Date());
				t.setStatus("CLOSE");
				refMasterMaintainDAOImpl.saveOrUpdateEntity(t);
			}
			
			status = "success";
		}
		
		return status;
	}

	public List<TaskDistribution> getDistibutionListByTaskId(
			Integer distributionId) {
		List<SearchParameter> searchparameterList = new ArrayList<SearchParameter>();
		searchparameterList.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "taskId.id",distributionId ));
		List<TaskDistribution> taskList = refMasterMaintainDAOImpl.findEntityList(TaskDistribution.class, searchparameterList, null);
		return taskList;
	}

	public List<TaskDistribution> getAllTaskList(String status, User user) {
		List<SearchParameter> searchparameterList = new ArrayList<SearchParameter>();
		searchparameterList.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "taskId.status",status ));
		searchparameterList.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "taskId.createdBy.userId.",user.getUserId()));
		List<TaskDistribution> taskList = refMasterMaintainDAOImpl.findEntityList(TaskDistribution.class, searchparameterList, null);
		return taskList;
	}
}
