package com.example.demo.service;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.bean.UserVO;

@Mapper
public interface UserMapper {

	UserVO login(UserVO user);
	
}
