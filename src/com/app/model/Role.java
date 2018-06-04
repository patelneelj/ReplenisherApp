package com.app.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Role {

	private Integer roleId;
	private String name;
	private String description;
	
	private Set<User> users=new HashSet<>();
	//private Set<Empmanagerattr> empmanagerattr=new HashSet<>();
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	@Column
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@OneToMany(mappedBy="role")
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	/*@OneToMany(mappedBy="role")
	public Set<Empmanagerattr> getEmpmanagerattr() {
		return empmanagerattr;
	}
	public void setEmpmanagerattr(Set<Empmanagerattr> empmanagerattr) {
		this.empmanagerattr = empmanagerattr;
	}*/
	
	
	
	
	
	
}
