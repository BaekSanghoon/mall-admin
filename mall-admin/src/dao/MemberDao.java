package dao;
import java.util.*;

import commons.DBUtil;
import vo.*;
import java.sql.*;

public class MemberDao {
	
	//맴버회원 전체출력 리스트
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email, member_pw, member_name, member_date from member order by member_email";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) 
		{
			Member m = new Member();
			m.setMemberEmail(rs.getString("member_email"));
			m.setMemberPw(rs.getString("member_pw"));
			m.setMemberName(rs.getString("member_name"));
			m.setMemberDate(rs.getString("member_date"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	//맴버회원 탈퇴 
	public void deleteMember(Member member) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="delete from member where member_email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.executeLargeUpdate();
		conn.close();
	}
}
