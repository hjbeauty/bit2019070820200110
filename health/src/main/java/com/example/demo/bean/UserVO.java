package com.example.demo.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
/*
CREATE TABLE users(

   id VARCHAR2(50) PRIMARY KEY,
   password VARCHAR(1000),
   name VARCHAR(50),
   role VARCHAR(20) DEFAULT 'user' check(role in ('user', 'admin'))
);
*/

@Data
@Alias("UserVO")
public class UserVO {

	private String id;
	private String password;
	private String name;
	private String role;
	
}
