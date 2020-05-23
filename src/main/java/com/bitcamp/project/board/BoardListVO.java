package com.bitcamp.project.board;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.bitcamp.project.vo.BoardVO;



@XmlRootElement(name="boardList")
@XmlAccessorType(XmlAccessType.FIELD)
public class BoardListVO {
	
	@XmlElement(name="board")
	private List<BoardVO> boardList;
	
	private List<BoardVO> getBoardList() {
		return boardList;
	}
	
	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}
	
}
