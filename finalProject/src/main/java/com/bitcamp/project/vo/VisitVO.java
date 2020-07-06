package com.bitcamp.project.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class VisitVO {
    private int vno; // 방문자 번호 

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private Date vdateTime; // 방문시간

	public int getVno() {
		return vno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public Date getVdateTime() {
		return vdateTime;
	}

	public void setVdateTime(Date vdateTime) {
		this.vdateTime = vdateTime;
	}

	@Override
	public String toString() {
		return "VisitVO [vno=" + vno + ", vdateTime=" + vdateTime + "]";
	}
    
    
	
}
