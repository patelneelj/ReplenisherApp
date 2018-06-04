package com.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.RefMasterMaintainDAOImpl;
import com.app.model.User;
import com.app.util.ApplicationConstantsUtil;
import com.app.util.SearchParameter;

@Service
public class Userservice {

	@Autowired
	private RefMasterMaintainDAOImpl refMasterMaintainDAOImpl;
	
	public List<User> getAllEmployee()
	{
		List<SearchParameter> searchParameters = new ArrayList<SearchParameter>();
		searchParameters.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "role.name", "ROLE_EMPLOYEE"));
		List<User> userList = refMasterMaintainDAOImpl.findEntityList(User.class, searchParameters, null);
		return userList;
	}
	
	@SuppressWarnings("unchecked")
	public User findByusername(String userName)
	{
		List<SearchParameter> searchParameters = new ArrayList<SearchParameter>();
		searchParameters.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "userName", userName));
		
		List<User> userlist = refMasterMaintainDAOImpl.findEntityList(User.class, searchParameters, null);
		return userlist.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public User findByUserId(int userid)
	{
		List<SearchParameter> searchParameters = new ArrayList<SearchParameter>();
		searchParameters.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "userId", userid));
		
		List<User> userlist = refMasterMaintainDAOImpl.findEntityList(User.class, searchParameters, null);
		return userlist.get(0);
	}
	
}
