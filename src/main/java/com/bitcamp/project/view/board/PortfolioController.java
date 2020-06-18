package com.bitcamp.project.view.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class PortfolioController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	
	List<String> uploadedFileName =BoardController.uploadedFileName;
	
	
	@GetMapping(value= {"/board/portfolio", "/board/portfolio/popularity"})
	public String portfolioBoard(BoardVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
							@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword,
							@ModelAttribute("orderby") String orderby /*new = 최신순 best = 인기순*/ ) {
		int bno = 2;
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		if(searchStyle.equals("")) {
			keyword = "";
		}
		if(orderby.equals("")) {
			orderby = "new";
		}
        String FilePath = request.getSession().getServletContext().getRealPath("/");
        vo.setThumbnailName(FilePath+"THUMB_"+vo.getThumbnailName());
        
		Map<String, Object> boardList = boardService.boardList(vo, Integer.parseInt(nowPage), searchStyle, keyword, orderby, bno);
		model.addAttribute("portfolioList", (List<BoardVO>)boardList.get("portfolioList"));
		model.addAttribute("boardPage", (PagingVO)boardList.get("boardPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		model.addAttribute("path", FilePath);
		
		if(orderby.equals("new")) {
			return "portfolio-board";
		}
		else {
			return "portfolio-board";
		}
	}
	
	
	
	
	@GetMapping("/board/portfolio/write")
	public String portfolioWriteForm() {
		return "portfolio-writeForm";
	}
	
	
	@PostMapping("/board/portfolio/write")
	public String portfolioWrite(BoardVO vo) {
		
		List<String> uploadThumbnail = new ArrayList<String>();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
		vo.setBno(2); // 자유게시판
		
		
		String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");

		
		for (int i = 1; i < img.length; i++) {
			
			int start = img[i].indexOf("Photo");
			int end = img[i].indexOf("\" title=\"");
			img[i] = img[i].substring(start, end);
		}
		

		String thumbnail = null;
		
		try {
			for (int i = 0; i < uploadedFileName.size(); i++) {
				int a = 0;
				for (int j = 1; j < img.length; j++) {
					if(uploadedFileName.get(i).equals(img[j])) {
						uploadThumbnail.add(uploadedFileName.get(i));
						a++;
					}
				}
				// 파일이 존재하지 않을 경우 삭제
				if(a != 1) {
					String origin = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+uploadedFileName.get(i);
					File originDelete = new File(origin);
					thumbnail = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/THUMB_" + uploadedFileName.get(i);
					File thumbnailDelete = new File(thumbnail);
					
					// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
					if(originDelete.exists()) {
					    // 파일을 삭제합니다.
						originDelete.delete();
						thumbnailDelete.delete();
					}
					    
				}
			}
			
//			List<String> upload = multiplePhotoUpload(request, response);
			
			
			for (int i = 1; i < uploadThumbnail.size(); i++) {
				thumbnail = request.getSession().getServletContext().getRealPath("/")+"/resources/se2/upload/THUMB_" + uploadThumbnail.get(i);
				File thumbnailDelete = new File(thumbnail);
				if(thumbnailDelete.exists()) {
					thumbnailDelete.delete(); 
				}
			}
			
			
			
					
	//		for (int i = 0; i < uploadedFileName.size(); i++) {
	//			vo.setUploadedFileName(uploadedFileName.get(i));
	//			vo.setUploadedFileUrl(uploadedFileUrl.get(i));
	//		}
			vo.setThumbnailName("/resources/se2/upload/"+uploadThumbnail.get(0));
			uploadedFileName.clear();
		}catch(Exception e) {
			e.printStackTrace();
		}
		// vo에 저장 후 리셋
		
		
		finally {
			System.out.println("BV " + vo);
			boardService.writeFreeBoard(vo);
		}
		
		return "redirect:/board/portfolio";
	}
	
	
	


	
}

