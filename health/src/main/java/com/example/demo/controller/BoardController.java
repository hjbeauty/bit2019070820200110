package com.example.demo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.bean.FileVO;
import com.example.demo.bean.HealthBoard;
import com.example.demo.bean.UserVO;
import com.example.demo.service.BoardMapper;
import com.example.demo.service.UserMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private UserMapper userMapper;

	// main 창 이동
	@RequestMapping("/main")
	public void main(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));

	}

	// login 창 이동
	@RequestMapping("/login")
	public void login(@ModelAttribute("user") UserVO user) {

	}

	// logout.do => 세션 끊기
	@RequestMapping("/logout.do")
	public String doLogout(@ModelAttribute("user") UserVO user, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();

		if (session != null) {
			session.invalidate();
		}
		return "main";
	}

	// login.do
	@RequestMapping("/login.do")
	public String doLogin(@ModelAttribute("user") UserVO user, HttpServletRequest request, Model model)
			throws Exception {

		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String role = request.getParameter("role");

		user.setId(id);
		user.setPassword(password);
		user.setName(name);
		user.setRole(role);

		UserVO result = null;

		result = userMapper.login(user);

		if (id == null || password == null || id.length() == 0) {

			model.addAttribute("msg", "비밀번호를 다시 입력하세요");
			model.addAttribute("id", id);

			return "login";
		}

		if (result != null) {

			session.setAttribute("login", result.getName());
			session.setAttribute("id", result.getId());
			session.setAttribute("role", result.getRole());

		} else {

			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("id", id);

			return "login";
		}

		return "redirect:main";
	}

	// bmi check
	@RequestMapping("/bmi")
	public String bmi(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));

		return "bmi";
	}

	// paging final !!!!
	@RequestMapping(value = { "boardList/{pagenum}" })
	public String boardList(@PathVariable int pagenum, @ModelAttribute("healthBoard") HealthBoard healthBoard,
			Model model, HttpServletRequest request, Pageable pageable) {

		List<HealthBoard> list = boardMapper.getBoardList();
		List<HealthBoard> onePage = new ArrayList<HealthBoard>();

		int listSize = list.size() / 10 + 1;

		if (pagenum == 0) {
			pagenum = 1;
		} else {
			pagenum = pagenum * 10 - 10;
		}
		System.out.println(pagenum);

		for (int i = pagenum; i < pagenum + 10; i++) {

			if (i == list.size()) {
				break;
			}
			onePage.add(list.get(i));
		}

		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		
		model.addAttribute("count", boardMapper.totalCnt());
		model.addAttribute("boardList", onePage);
		model.addAttribute("listSize", listSize);

		return "boardList";
	}

	// 상세페이지 Data 보여주기
	@GetMapping("/boardData/{postNo}")
	public String boardData(HttpServletRequest request, @PathVariable("postNo") int postNo,
			@ModelAttribute("healthBoard") HealthBoard healthBoard, Model model) {
		HttpSession session = request.getSession();

		boardMapper.viewCount(postNo);

		//files (images) 출력
		if (boardMapper.fileView(postNo) != null) {

			model.addAttribute("postNo", postNo);
			model.addAttribute("boardData", boardMapper.boardView(postNo));
			model.addAttribute("login", session.getAttribute("login"));

			  
			List<String> fileList = new ArrayList<String>();
			List<Integer> fnos = new ArrayList<Integer>();
			
			List<FileVO> files  = boardMapper.fileView(postNo);
			
			
			  Iterator<FileVO> iterator = files.iterator();
			  
		        while (iterator.hasNext()) {
		           
		            String fileName = (String) iterator.next().getFileName(); 
		            System.out.println(fileName);
		            fileList.add(fileUrl + fileName);
		        }

		        
		       iterator = files.iterator();
		       while(iterator.hasNext()) {
		    	   int fno = iterator.next().getFno();
		           System.out.println(fno);
		           fnos.add(fno);
		       }
		        
		     System.out.println(fileList);
			model.addAttribute("fileData", fileList);
			model.addAttribute("fnos", fnos);

		} else {

			model.addAttribute("login", session.getAttribute("login"));
			model.addAttribute("postNo", postNo);
			model.addAttribute("boardData", boardMapper.boardView(postNo));
		}
		return "boardData";
	}

	
	//file download
	@RequestMapping("/fileDown/{fno}")
	public String fileDown (@PathVariable int fno,
						  HttpServletRequest request,
						  HttpServletResponse response,
						  @ModelAttribute("healthBoard") HealthBoard healthBoard){
		try {	
		request.setCharacterEncoding("UTF-8");
		
		FileVO fileVO = boardMapper.fileDownView(fno);
		
		String fileUrl = fileVO.getFileUrl();
		String fileName = fileVO.getFileName();
		
		String oriFileName = fileVO.getFileOriName();
		
		InputStream in = null;
		OutputStream os = null;
		File file = null;
		boolean skip = false;
		String client = "";
		
		try {
			file = new File(fileUrl, fileName);
			in = new FileInputStream(file);
		} catch (Exception e) {
			skip = true;
		}
		
		client = request.getHeader("User-Agent");
		
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("content-Description", "JSP Generated Data");
	
		 if (!skip) {
             // IE
             if (client.indexOf("MSIE") != -1) {
                 response.setHeader("Content-Disposition", "attachment; filename=\""
                         + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                 // IE 11 이상.
             } else if (client.indexOf("Trident") != -1) {
                 response.setHeader("Content-Disposition", "attachment; filename=\""
                         + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
             } else {
                 // 한글 파일명 처리
                 response.setHeader("Content-Disposition",
                         "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                 response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
             }
             response.setHeader("Content-Length", "" + file.length());
             os = response.getOutputStream();
             byte b[] = new byte[(int) file.length()];
             int leng = 0;
             while ((leng = in.read(b)) > 0) {
                 os.write(b, 0, leng);
             }
         } else {
             response.setContentType("text/html;charset=UTF-8");
             System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
         }
         in.close();
         os.close();
     } catch (Exception e) {
         System.out.println("ERROR : " + e.getMessage());
     }

			
		return "/boardData";
	}
	
	
	// Search
	// ( by writer or title ) => list에서 검색
	@GetMapping("/search")
	public String search(@ModelAttribute("healthBoard") HealthBoard healthBoard,
			@RequestParam(value = "condition", required = true) String condition,
			@RequestParam(value = "keyword", required = true) String keyword, Model model) {

		List<HealthBoard> list = boardMapper.searchView(condition, keyword);

		System.out.println(condition);
		System.out.println(keyword);

		System.out.println(list);

		model.addAttribute("boardList", list);

		return "boardList";
	}
	 
	
	// 글 쓰기 창 이동
	@GetMapping("/boardInsert")
	public void boardInsert(@ModelAttribute("healthBoard") HealthBoard healthBoard, Model model) {
	        
	}

	// 글쓰기 (이미지 업로드 1개만 )
//	@PostMapping("/insert")
//	public String insert(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
//		
//		FileVO file = new FileVO();
//		HealthBoard board = new HealthBoard();
//
//    	HttpSession session = request.getSession();
//		
//		if (session != null) {
//			
//			System.out.println("session.getattribute => " + session.getAttribute("login"));
//			System.out.println("session.get attribute => " +session.getAttribute("id"));
//		}
//		
//		
//		long size = files.getSize();
//		System.out.println("file size => "+ size);
//		
//		board.setWriter((String) session.getAttribute("id"));
//		board.setTitle(request.getParameter("title"));
//		board.setContent(request.getParameter("content"));
//		
//		if(files.isEmpty()) boardMapper.insertBoard(board);
//		
//		
//		String fileName = files.getOriginalFilename();
//		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
//		File destinationFile;
//		String destinationFileName;
//		String fileUrl = "/uploadFiles/";
//				
//		do {
//			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
//			destinationFile = new File(request.getServletContext().getRealPath(fileUrl) + destinationFileName);
//			
//			System.out.println(destinationFile);
//			
//		} while (destinationFile.exists());
//		
//		destinationFile.getParentFile().mkdirs();
//		files.transferTo(destinationFile);
//		
//				
//		boardMapper.insertBoard(board);
//		
//		
//		file.setPostNo(board.getPostNo());
//		file.setFileName(destinationFileName);
//		file.setFileOriName(fileName);
//		file.setFileUrl(fileUrl);
//	
//		boardMapper.insertFile(file);
//		
//		
//		return "redirect:boardList/1";
//	}

	
	//  MultipartHttpServletRequest multi  
	// List<MultipartFile> multi
	
	
	
	// Multifile Upload 백만 스물 한번째 도전...성공..엉엉...
	public static final String fileUrl = "/uploadFiles/";
	
	@PostMapping("/insert")
	public String insert(HttpServletRequest request, MultipartHttpServletRequest multi ) throws Exception {
		
		HealthBoard board = new HealthBoard();

		// Session
		HttpSession session = request.getSession();
		if (session != null) {

			System.out.println("session.getattribute => " + session.getAttribute("login"));
			System.out.println("session.get attribute => " + session.getAttribute("id"));
		}
		
		board.setWriter((String) session.getAttribute("id"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		
		boardMapper.insertBoard(board);
		
		
		List<MultipartFile> fileList = multi.getFiles("files");
		
		for(MultipartFile mf : fileList) {
			String fileName = mf.getOriginalFilename();
			long size = mf.getSize();
			System.out.println("file size => " + size);
			
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(request.getServletContext().getRealPath(fileUrl) + destinationFileName);

				System.out.println(destinationFile);

			} while (destinationFile.exists());

			
			destinationFile.getParentFile().mkdirs();
			mf.transferTo(destinationFile);
			
			FileVO file = new FileVO();
		
			file.setPostNo(board.getPostNo());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(fileUrl);

			
			boardMapper.insertFile(file);
		 }

		return "redirect:boardList/1";
	}

	

	// 파일 여러개 업로드하기 (실패 한 것)
//	@PostMapping("/insert")
//	public String insert(HttpServletRequest request, MultipartHttpServletRequest multi ) throws Exception {
//		
//		HealthBoard board = new HealthBoard();
//		// Session
//		HttpSession session = request.getSession();
//		if (session != null) {
//
//			System.out.println("session.getattribute => " + session.getAttribute("login"));
//			System.out.println("session.get attribute => " + session.getAttribute("id"));
//		}
//		String fileName;
//		
//		Iterator<String> files = multi.getFileNames();
//		
//		
//		while(files.hasNext())
//			
//		 {
//			
//			String uploadFile = files.next();
//			System.out.println( "================> " +uploadFile);
//			MultipartFile mFile = multi.getFile(uploadFile);
//			fileName = mFile.getOriginalFilename();
//			long size = mFile.getSize();
//			System.out.println("file size => " + size);
//
//			if (mFile.isEmpty())
//				boardMapper.insertBoard(board);
//			
//			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
//			File destinationFile;
//			String destinationFileName;
//		
//
//			do {
//				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
//				destinationFile = new File(request.getServletContext().getRealPath(fileUrl) + destinationFileName);
//
//				System.out.println(destinationFile);
//
//			} while (destinationFile.exists());
//
//			
//			destinationFile.getParentFile().mkdirs();
//			mFile.transferTo(destinationFile);
//			
//			
//			board.setWriter((String) session.getAttribute("id"));
//			board.setTitle(request.getParameter("title"));
//			board.setContent(request.getParameter("content"));
//			
//			
//			boardMapper.insertBoard(board);
//			
//			FileVO file = new FileVO();
//	
//			
//			file.setPostNo(board.getPostNo());
//			file.setFileName(destinationFileName);
//			file.setFileOriName(fileName);
//			file.setFileUrl(fileUrl);
//
//			
//			boardMapper.insertFile(file);
//		 }
//
//		return "redirect:boardList/1";
//	}	
	
	
	
	// 글 delete

	@GetMapping("/delete")
	public String delete(int postNo, int groupNo, int groupOrder,
			@ModelAttribute("healthBoard") HealthBoard healthBoard) {

		if (boardMapper.replyCheck(groupNo, groupOrder) != null) {
			System.out.println("답변 있다!!");
			boardMapper.replyRemain(postNo);

		} else {
			System.out.println("답변 없다!");
			boardMapper.deleteBoard(postNo);
		}

		return "redirect:/boardList/1";
	}

	// boardUpdate 창 이동
	@GetMapping("boardUpdate/{postNo}")
	public String boardUpdate(@PathVariable("postNo") int postNo,
			@ModelAttribute("healthBoard") HealthBoard healthBoard, Model model) {

		model.addAttribute("boardData", boardMapper.boardView(postNo));

		return "boardUpdate";
	}

	// 글 Update
	@GetMapping("update/{postNo}")
	public String update(@PathVariable("postNo") int postNo, @ModelAttribute("healthBoard") HealthBoard healthBoard,
			Model model) {

		boardMapper.updateBoard(healthBoard);
		model.addAttribute("boardData", boardMapper.boardView(postNo));

		return "redirect:/boardData/{postNo}";
	}

	// 답글 쓰기 창 이동
	@GetMapping("reply/{groupNo}")
	public String reply(@PathVariable("groupNo") int groupNo, @ModelAttribute("healthBoard") HealthBoard healthBoard,
			Model model) {

		model.addAttribute("groupNo", groupNo);

		return "replyInsert";
	}

	// 답글 insert
	@GetMapping("reply/replyInsert")
	public String replyInsert(@ModelAttribute("healthBoard") HealthBoard healthBoard, Model model) {

		boardMapper.replyUpdate(healthBoard);
		boardMapper.insertReply(healthBoard);

		return "redirect:/boardList/1";
	}

}
