package com.app.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class Helper {

	static Map<String, Integer> priorityMap = new HashMap<String, Integer>();
	
	static 
	{
		priorityMap.put("High", 3);
		priorityMap.put("Medium", 5);
		priorityMap.put("Low", 7);
	}
	
	public static Date getFutureDate(int days)
	{
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, days);
		Date newDate = cal.getTime();
		return newDate;
	}
	
	public static Integer getMapValue(String key)
	{
		return priorityMap.get(key);
	}
	
	public static String getUsername()
	{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("in helper authentication: "+authentication);
		if ((authentication == null)
				|| authentication.getPrincipal().equals("anonymousUser"))
		{
			return null;
		}
		else
		{
			
			return authentication.getName();
		}
	}
	
	public static Date formatDate(String dateString) throws ParseException {
		
		Date date=new SimpleDateFormat("MM/dd/yyyy").parse(dateString);
		return date;
		
	}
	
	public static Date formatDate2(String dateString) throws ParseException {
		
		Date date=new SimpleDateFormat("MM/dd/yyyy").parse(dateString);
		return date;
		
	}
	
}
