package common;

import java.util.HashMap;

public class a {
	public static void main(String[] args) {
//		String str1="a";
//		String str2="a";
//		String str3=new String("a");
//		String str4=new String("a");
//		
//		if(str1==str2)System.out.println(1);
//		else System.out.println(2);
//		
//		if(str1==str3)System.out.println(1);
//		else System.out.println(2);
//		if(str1==str4)System.out.println(1);
//		else System.out.println(2);
//		if(str2==str3)System.out.println(1);
//		else System.out.println(2);
//		if(str2==str4)System.out.println(1);
//		else System.out.println(2);
//		if(str3==str4)System.out.println(1);
//		else System.out.println(2);
		
		HashMap<Integer,String> map = new HashMap<>();
		map.put(1, "���");
		map.put(2, "�ٳ���");
		map.put(3, "����");

		HashMap<Integer,String> map2 = map;

		System.out.println("map="+map);
		System.out.println("map2="+map2);
		
		map2.put(1, "���ξ���");

		System.out.println("map="+map);
		System.out.println("map2="+map2);
	}
}
