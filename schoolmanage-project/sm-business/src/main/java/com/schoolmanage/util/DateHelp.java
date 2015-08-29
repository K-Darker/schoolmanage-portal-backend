package com.schoolmanage.util;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateHelp {
	public static java.util.Date getDate(String msg) {
		Date d = null;
		if (msg != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				d = sdf.parse(msg);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return d;
		} else {
			return null;
		}

	}

	public static java.sql.Date getDateFromUtil(java.util.Date d){
		java.sql.Date temp = null;
		if(d!=null){
			temp = new java.sql.Date(d.getTime());
		}
		return temp;
	}
	
	public static java.util.Date getDateFromSQL(java.sql.Date d){
		java.util.Date temp = null;
		if(d!=null){
			temp = new java.util.Date(d.getTime());
		}
		return temp;
	}
}
