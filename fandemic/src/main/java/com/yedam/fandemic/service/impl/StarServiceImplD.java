package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.StarMapperD;
import com.yedam.fandemic.service.StarServiceD;
import com.yedam.fandemic.vo.Art;
import com.yedam.fandemic.vo.Fan;
import com.yedam.fandemic.vo.Schedule;
import com.yedam.fandemic.vo.Star;

@Service
public class StarServiceImplD implements StarServiceD{

	@Autowired StarMapperD starDAO;
	
	@Override
	public List<Star> getStarMemberList(Star star) {
		return starDAO.getStarMemberList(star);
	}

	@Override
	public int getStarIdCheck(Star star) {
		return starDAO.getStarIdCheck(star);
	}

	@Override
	public int InsertStar(Star star) {
		return starDAO.InsertStar(star);
	}

	@Override
	public Star getStarDetail(Star star) {
		return starDAO.getStarDetail(star);
	}

	@Override
	public int updateStarMember(Star star) {
		return starDAO.updateStarMember(star);
	}

	@Override
	public int deleteStarMember(Star star) {
		return starDAO.deleteStarMember(star);
	}

	@Override
	public int insertStarSchedule(Schedule schedule) {
		return starDAO.insertStarSchedule(schedule);
	}

	@Override
	public List<Schedule> getStartList(Schedule schedule) {
		return starDAO.getStartList(schedule);
	}

	@Override
	public int updateStarSchedule(Schedule schedule) {
		return starDAO.updateStarSchedule(schedule);
	}

	@Override
	public int deleteStarSchedule(Schedule schedule) {
		return starDAO.deleteStarSchedule(schedule);
	}

	@Override
	public List<Art> getStarWorkList(Art art) {
		return starDAO.getStarWorkList(art);
	}

	@Override
	public int insertStarWork(Art art) {
		return starDAO.insertStarWork(art);
	}

	@Override
	public int deleteStarWork(Art art) {
		return starDAO.deleteStarWork(art);
	}

	@Override
	public Art starWorkDetail(Art art) {
		return starDAO.starWorkDetail(art);
	}

	@Override
	public int updateStarWork(Art art) {
		return starDAO.updateStarWork(art);
	}

	@Override
	public List<Fan> getStarFanList(Fan fan) {
		return starDAO.getStarFanList(fan);
	}

	@Override
	public int starFanBlack(Fan fan) {
		return starDAO.starFanBlack(fan);
	}

	
	
}
