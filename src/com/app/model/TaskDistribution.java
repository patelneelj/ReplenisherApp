package com.app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class TaskDistribution {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="taskId")
	private Task taskId;
	
	@ManyToOne
	@JoinColumn(name="assignedTo")
	private User assignedTo;
	
	@Column
	private String comments;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Task getTaskId() {
		return taskId;
	}
	public void setTaskId(Task taskId) {
		this.taskId = taskId;
	}
	public User getAssignedTo() {
		return assignedTo;
	}
	public void setAssignedTo(User assignedTo) {
		this.assignedTo = assignedTo;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}
