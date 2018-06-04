package com.app.service;

import java.util.Comparator;

import com.app.model.TaskDistribution;
import com.app.util.Helper;

public class TaskDistributionComparator implements Comparator<TaskDistribution> {

	@Override
	public int compare(TaskDistribution t1, TaskDistribution t2) {
		// TODO Auto-generated method stub
		Integer t1pr = Helper.getMapValue(t1.getTaskId().getPriority());
		Integer t2pr = Helper.getMapValue(t2.getTaskId().getPriority());
		int result = t1pr.compareTo(t2pr);
		if(result!=0)
		{
			return result;
		}
		
		int dateResult = t1.getTaskId().getCreationDate().compareTo(t2.getTaskId().getCreationDate());
		return dateResult;
	}
	
	

}
