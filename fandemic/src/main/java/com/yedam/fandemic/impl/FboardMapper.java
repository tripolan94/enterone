package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Fboard;

public interface FboardMapper {
	public int insertFboard(Fboard fboard);
	public List<Fboard> getFboardList(Fboard fboard);
	public Fboard getFboardInfo(Fboard fboard);
	public List<Fboard> getFboardHashtagList(Fboard fboard);
	public List<Fboard> getFboardSubjectList(Fboard fboard);
	public int getFboardCount(Fboard fboard);
	public int updateFboard(Fboard fboard);
	public int updateFboardViews(Fboard fboard);
	public int deleteFboard(Fboard fboard);
}
