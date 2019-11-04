package com.example.demo.bean;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
/*
create table files(
fno NUMBER(3) PRIMARY KEY,
postno NUMBER(5),
filename VARCHAR2(200),
fileOriName VARCHAR2(300),
fileurl VARCHAR2(500)
);
*/

@Data
@Alias("FileVO")
public class FileVO {
	
	private int fno;
	private int postNo;
	private String fileName;    // => 저장할 파일
	private String fileOriName; // => 실제 파일
	private String fileUrl;
	
	private List<MultipartFile> files;
}
