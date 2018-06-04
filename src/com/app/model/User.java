package com.app.model;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.ManyToAny;


@Entity
@Table
public class User {
private Integer userId;
private String contactNo;
private Date creationDate;
private Date updatetionDate;
private String emailId;
private String firstName;
private String lastName;
private String isAvailable;
private String isEnable;
private String password;
private String userName;
private Role role;

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}

@Column
public String getContactNo() {
	return contactNo;
}
public void setContactNo(String contactNo) {
	this.contactNo = contactNo;
}

@Column
public Date getCreationDate() {
	return creationDate;
}
public void setCreationDate(Date creationDate) {
	this.creationDate = creationDate;
}

@Column
public Date getUpdatetionDate() {
	return updatetionDate;
}
public void setUpdatetionDate(Date updatetionDate) {
	this.updatetionDate = updatetionDate;
}

@Column
public String getEmailId() {
	return emailId;
}
public void setEmailId(String emailId) {
	this.emailId = emailId;
}

@Column
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}

@Column
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}

@Column
public String getIsAvailable() {
	return isAvailable;
}
public void setIsAvailable(String isAvailable) {
	this.isAvailable = isAvailable;
}

@Column
public String getIsEnable() {
	return isEnable;
}
public void setIsEnable(String isEnable) {
	this.isEnable = isEnable;
}

@Column
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

@Column
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}



@ManyToOne
@JoinColumn(name="roleId",nullable=false)
public Role getRole() {
	return role;
}
public void setRole(Role role) {
	this.role = role;
}


}
