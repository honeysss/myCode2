package com.chinasofti.meeting.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.chinasofti.meeting.vo.Employee;
import com.chinasofti.meeting.vo.MeetingRoom;

public class MeetingRoomDao extends Conn {

//	查询所有会议
	public ArrayList<MeetingRoom> selectAllMr() throws SQLException {
		ArrayList<MeetingRoom> mrList = new ArrayList<MeetingRoom>();
		String sql = "select * from meetingRoom";
		PreparedStatement ps = (PreparedStatement) getConnection().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			MeetingRoom mr = new MeetingRoom();
			mr.setMrId(rs.getInt("mrId"));
			mr.setMrNum(rs.getInt("mrNum"));
			mr.setMrName(rs.getString("mrName"));
			mr.setMrCapacity(rs.getInt("mrCapacity"));
			mr.setMrStatus(rs.getInt("mrStatus"));
			mr.setMrRemark(rs.getString("mrRemark"));
			mrList.add(mr);
		}
		getConnection().close();
		rs.close();
		
		return mrList;
	}
	
//	通过id查询会议室
	public String selectMrById(int mrId) throws SQLException {
		String sql = "select * from meetingRoom where mrId = ?";
		PreparedStatement ps = (PreparedStatement) getConnection().prepareStatement(sql);
		ps.setInt(1, mrId);
		ResultSet rs = ps.executeQuery();
		String mrName = null;
		while(rs.next()) {
			mrName = rs.getString("mrName");
		}
		getConnection().close();
		rs.close();
		
		return mrName;
	}
	
//	增加会议室
	public void addMeetingRoom(int mrNum, String mrName, int mrCapacity, int mrStatus, String mrRemark) throws SQLException {
		String sql = "INSERT INTO meetingRoom VALUES (null, ?, ?, ?, ?, ?)";
		PreparedStatement ps = (PreparedStatement) getConnection().prepareStatement(sql);
		ps.setInt(1, mrNum);
		ps.setString(2, mrName);
		ps.setInt(3, mrCapacity);
		ps.setInt(4, mrStatus);
		ps.setString(5, mrRemark);
		ps.executeUpdate();
		getConnection().close();
	}
	
//	删除会议室
	public void deleteMr(int mrId) throws SQLException {
		String sql = "delete from meetingRoom where mrId = ?";
		PreparedStatement ps = (PreparedStatement) getConnection().prepareStatement(sql);
		ps.setInt(1, mrId);
		ps.executeUpdate();
		getConnection().close();
	}
	
//	修改会议室
	public void updateMr(int mrId, int mrNum, String mrName, int mrCapacity, int mrStatus, String mrRemark) throws SQLException {
		String sql = "update meetingRoom set mrNum = ?, mrName = ?, mrCapacity=?, mrStatus=?, mrRemark=? where mrId = ?";
		PreparedStatement ps = (PreparedStatement) getConnection().prepareStatement(sql);
		ps.setInt(1, mrNum);
		ps.setString(2, mrName);
		ps.setInt(3, mrCapacity);
		ps.setInt(4, mrStatus);
		ps.setString(5, mrRemark);
		ps.setInt(6, mrId);
		ps.executeUpdate();
		getConnection().close();
	}
	
	

}
