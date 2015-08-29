package com.schoolmanage.util;

import java.io.UnsupportedEncodingException;

public class StringHelp {
	public static String getString(String msg) {
		try {
			if (msg != null) {
				msg = new String(msg.getBytes("iso-8859-1"), "GBK");
				
				msg.replaceAll("'","" );
				return msg;
			} else {
				return "-1";
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "-1";
	}

}
