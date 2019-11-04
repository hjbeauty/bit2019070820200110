package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.bean.FreeBoard;

@Mapper
public interface FreeBoardMapper {
	
	@Insert("Insert into freeboard(boardnum,title,boardtime,txt,writer) values(seq_board.nextval,#{title},#{boardtime},#{txt},#{writer})")
	public void insert(FreeBoard board);

	@Select("select * from freeboard")
	public List<FreeBoard> showList();
	
	@Select("select * from freeboard where boardnum=#{boardnum}")
	public FreeBoard detail(int boardnum);
	
	@Delete("delete from freeboard where boardnum=#{boardnum}")
	public void delete(int boardnum);
	
	@Update("update freeboard set title=#{title},txt=#{txt} where boardnum=#{boardnum}")
	public void update(int boardnum,String title, String txt);
	
	
	}
