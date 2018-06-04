package com.app.dto;

import java.util.ArrayList;

public class TaskDto {

	private ArrayList<Integer> userIds=new ArrayList<>();
	private String subject;
	private String priority;
	private String taskName;
	private String recurring;
	private String comments;
	private String status;
	private Integer taskdistibutionId;
	
	
	
	public Integer getTaskdistibutionId() {
		return taskdistibutionId;
	}
	public void setTaskdistibutionId(Integer taskdistibutionId) {
		this.taskdistibutionId = taskdistibutionId;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public ArrayList<Integer> getUserIds() {
		return userIds;
	}
	public void setUserIds(ArrayList<Integer> userIds) {
		this.userIds = userIds;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getRecurring() {
		return recurring;
	}
	public void setRecurring(String recurring) {
		this.recurring = recurring;
	}
	
	
}
