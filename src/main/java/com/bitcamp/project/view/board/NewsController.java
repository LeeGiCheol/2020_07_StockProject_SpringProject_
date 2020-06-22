package com.bitcamp.project.view.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.vo.Info;

import stockCode.News;

@Controller
public class NewsController {
	
	@GetMapping("/news")
	public String newsBoard() {
		return "newsboard";
	}
	
	@GetMapping("/newsAjax")
	@ResponseBody
	public Map<String, Object> newsBoard(Model model) {
		News newsBoard = new News();
		Info news_ = newsBoard.news();
//		String news = news_.getNews().replace("`", "'");
//		String news2 = news_.getNews2().replace("`", "'");
//		String news3 = news_.getNews3().replace("`", "'");
//		System.out.println(news);
//		String[] newsLink_ = news_.getNews().split("<a href=\"");
//		String[] newsLink = new String[newsLink_.length-1];
//		int cnt = 0;
//		int a = 0;
//		for (int i = 0; i < newsLink_.length; i++) {
//				if(newsLink_[i].indexOf("\"><img") != -1) {
//					newsLink[cnt] = newsLink_[i].replace("amp;","");
//					a = newsLink[cnt].indexOf("\"><img");
//					if(newsLink_[i].indexOf("\" title=\"") != -1) {
//						a = newsLink[cnt].indexOf("\" title=\"");
//					}
//				}
//				else if(newsLink_[i].indexOf("\" title=\"") != -1){
//					newsLink[cnt] = newsLink_[i].replace("amp;","");
//					a = newsLink[cnt].indexOf("\" title=\"");
//				}
//				else continue;
//				newsLink[cnt] = newsLink[cnt].substring(0,a);
//				newsLink[cnt] = "https://finance.naver.com"+newsLink[cnt];
//				cnt++;
//		}
		Map<String, Object> map = new HashMap<String, Object>();
//		model.addAttribute("news1_title", news_.getTitle());
//		model.addAttribute("news1_content", news_.getContent());
//		model.addAttribute("news1_writer", news_.getWriter());
//		model.addAttribute("news1_time", news_.getTime());
//		System.out.println(news_.getNews1());
//		System.out.println("1    "+news_.getNews1());
//		model.addAttribute("news1_title", news_.getTitle());
//		model.addAttribute("news1_content", news_.getContent());
//		model.addAttribute("news1_writer", news_.getWriter());
//		model.addAttribute("news1_time", news_.getTime());
//		model.addAttribute("news1", news_.getNews1());
		System.out.println("news2 " + news_.getNews2());
//		System.out.println(news_);
//		model.addAttribute("news2", news2);
//		model.addAttribute("news3", news3);
//		model.addAttribute("newsLink", newsLink);
//		System.out.println(Arrays.toString(newsLink));
		map.put("news1", news_.getNews1());
		map.put("news2", news_.getNews2());
		map.put("news3", news_.getNews3());
		return map;
	}
	@GetMapping("/test")
	public String test() {
		return "free-board-update";
	}
}
