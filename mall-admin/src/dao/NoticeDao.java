package dao;
import vo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import commons.DBUtil;

	//공지 리스트 출력
	public class NoticeDao {

	//공지 상세보기
		public Notice selectNoticeOne(int noticeId) throws Exception{
			Notice notice = null;
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql="select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticeId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				notice = new Notice();
				notice.setNoticeId(noticeId);
				notice.setNoticeTitle(rs.getString("notice_title")); 
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setNoticeDate(rs.getString("notice_date"));
				
			}
			conn.close();
			return notice;
		}
		//전체리스트 출력
		public ArrayList<Notice> selectNoticeListAll() throws Exception {
			ArrayList<Notice> list = new ArrayList<Notice>();
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "select notice_id, notice_title, notice_content, notice_date from notice order by notice_id desc limit 0, 10";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Notice n =new Notice();
				n.setNoticeId(rs.getInt("notice_id"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeContent( rs.getString("notice_content"));
				n.setNoticeDate(rs.getString("notice_date"));
				list.add(n);
			}
			conn.close();
			return list;
		}
		//공지사항 작성
		public void insertNotice(Notice notice) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql = "insert into notice(notice_title, notice_content, notice_date)values (?,?,now())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			stmt.executeLargeUpdate();
			
			conn.close();			
		}
		//공지사항 삭제
		public void deleteNotice(Notice notice) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql ="delete from notice where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, notice.getNoticeId());
			stmt.executeLargeUpdate();
			conn.close();
		}
		//공지사항 수정 리스트 출력
		public Notice selectNotice(Notice notice) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "select notice_id, notice_title, notice_content, notice_date from notice";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			//Product product = null;
			while(rs.next()) {
				notice = new Notice();
				notice.setNoticeId (rs.getInt("notice_id"));
				notice.setNoticeTitle (rs.getString("notice_title"));
				notice.setNoticeContent (rs.getString("notice_content"));
				notice.setNoticeDate (rs.getString("notice_date"));
			}
			conn.close();
			return notice;
		}
		//공지사항 수정
		public void updateNotice(Notice notice) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "update notice set notice_title = ?, notice_content = ?, notice_date = now() where notice_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getNoticeTitle());
			stmt.setString(2, notice.getNoticeContent());
			stmt.setInt(3, notice.getNoticeId());
			stmt.executeLargeUpdate();
			conn.close();
		}
}
