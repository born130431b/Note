package database;

import java.util.Date;

// DTO (Data Transfer Object) : 데이터베이스와 데이터를 주고 받기위한 클래스
// ㄴ> beans 클래스처럼 생성하면 된다
public class TESTDTO {
	private String userid, userpw, name;
	private int age;
	private double height;
	private Date joinDate;   // java.util 에서 가져온다!!!
	
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
	
}
