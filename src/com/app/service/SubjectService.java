package com.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.RefMasterMaintainDAOImpl;
import com.app.model.Subject;
import com.app.util.ApplicationConstantsUtil;
import com.app.util.SearchParameter;

@Service
public class SubjectService {
	
	@SuppressWarnings("rawtypes")
	@Autowired
	private RefMasterMaintainDAOImpl refMasterMaintainDAOImpl;

	@SuppressWarnings("unchecked")
	public List<Subject> subjectList()
	{
		List<SearchParameter> searchParameters = new ArrayList<SearchParameter>();
		searchParameters.add(new SearchParameter(ApplicationConstantsUtil.MC_EQUAL, "isActive", "Y"));
		List<Subject> subList = refMasterMaintainDAOImpl.findEntityList(Subject.class,searchParameters, null);
		return subList;
	}
}
