package com.app.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.criteria.CriteriaBuilder.Case;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class App {

	public static void main(String args[]) throws ParseException
	{
		//SessionFactory sf = new Configuration().configure().buildSessionFactory();
		/*String strdate = "03/30/2018";
		Date date=new SimpleDateFormat("MM/dd/yyyy").parse(strdate);
		System.out.println(date);*/
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, 7);
		Date myDate = cal.getTime();
		
		System.out.println("mydate"+myDate);	
		
	}
}
