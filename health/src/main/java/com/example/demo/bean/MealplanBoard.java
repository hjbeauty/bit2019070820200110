package com.example.demo.bean;

import org.apache.ibatis.type.Alias;

@Alias("MealplanBoard")
public class MealplanBoard {
	private String dayorder;
	private int foodid;
	private String foodname;
	private String image;
	private String image_menu;
	private String day;
	private int week;
	private String foodtype;
	
	public MealplanBoard() {}

	public MealplanBoard(String dayorder, int foodid, String foodname, String image, String image_menu, String day,
			int week, String foodtype) {
		super();
		this.dayorder = dayorder;
		this.foodid = foodid;
		this.foodname = foodname;
		this.image = image;
		this.image_menu = image_menu;
		this.day = day;
		this.week = week;
		this.foodtype = foodtype;
	}

	public String getDayorder() {
		return dayorder;
	}

	public void setDayorder(String dayorder) {
		this.dayorder = dayorder;
	}

	public int getFoodid() {
		return foodid;
	}

	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}

	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage_menu() {
		return image_menu;
	}

	public void setImage_menu(String image_menu) {
		this.image_menu = image_menu;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	public String getFoodtype() {
		return foodtype;
	}

	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		result = prime * result + ((dayorder == null) ? 0 : dayorder.hashCode());
		result = prime * result + foodid;
		result = prime * result + ((foodname == null) ? 0 : foodname.hashCode());
		result = prime * result + ((foodtype == null) ? 0 : foodtype.hashCode());
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + ((image_menu == null) ? 0 : image_menu.hashCode());
		result = prime * result + week;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MealplanBoard other = (MealplanBoard) obj;
		if (day == null) {
			if (other.day != null)
				return false;
		} else if (!day.equals(other.day))
			return false;
		if (dayorder == null) {
			if (other.dayorder != null)
				return false;
		} else if (!dayorder.equals(other.dayorder))
			return false;
		if (foodid != other.foodid)
			return false;
		if (foodname == null) {
			if (other.foodname != null)
				return false;
		} else if (!foodname.equals(other.foodname))
			return false;
		if (foodtype == null) {
			if (other.foodtype != null)
				return false;
		} else if (!foodtype.equals(other.foodtype))
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (image_menu == null) {
			if (other.image_menu != null)
				return false;
		} else if (!image_menu.equals(other.image_menu))
			return false;
		if (week != other.week)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MealplanBoard [dayorder=" + dayorder + ", foodid=" + foodid + ", foodname=" + foodname + ", image="
				+ image + ", image_menu=" + image_menu + ", day=" + day + ", week=" + week + ", foodtype=" + foodtype
				+ "]";
	}
	
	

	
	

	
}
