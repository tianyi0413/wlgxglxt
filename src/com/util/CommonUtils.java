package com.util;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class CommonUtils {
	
	private static String DEFAULT_SEPERATOR =",";
	
	public static String[] getArraySplit(String s){
		return getArraySplit(s,DEFAULT_SEPERATOR);
	}
	
	public static String[] getArraySplit(String s,String seperator){
		String[] array = s.split(seperator);
		return array;
	}
	
	public static String accuracy(int n,int count){
		if(n!=0&&count!=0){
			double num = n;
			double total = count;
			
			return accuracy(num, total, 1);
		}else{
			return "0";
		}
		
	}
	
	

	public static String accuracy(double num, double total, int scale){
		DecimalFormat df = (DecimalFormat)NumberFormat.getInstance();
		//可以设置精确几位小数
		df.setMaximumFractionDigits(scale);
		//模式 例如四舍五入
		df.setRoundingMode(RoundingMode.HALF_UP);
		double accuracy_num = num / total * 100;
		return df.format(accuracy_num);
	}


}
