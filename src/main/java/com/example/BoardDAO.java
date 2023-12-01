package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public int insertBoard(BoardVO vo){
        String sql = "insert into TEAM_BOARD (title,writer,content,category) values ("
                + "'" +vo.getTitle() + "',"
                + "'" +vo.getWriter() + "',"
                + "'" +vo.getContent() + "',"
                + "'" +vo.getCategory() + "')";
        return jdbcTemplate.update(sql);
    }

    public int deleteBoard(int seq){
        String sql = "delete from TEAM_BOARD where seq = " + seq;
        return jdbcTemplate.update(sql);
    }

    public int updateBoard(BoardVO vo){
        String sql = "update TEAM_BOARD set title='" + vo.getTitle() + "',"
                + " title='" +vo.getTitle() + "',"
                + " writer='" +vo.getWriter() + "',"
                + " content='" +vo.getContent() + "',"
                + " category='" +vo.getCategory() + "' where seq=" + vo.getSeq();
        return jdbcTemplate.update(sql);
    }


    static class BoardRowMapper implements RowMapper<BoardVO> {
        @Override
        public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            BoardVO vo = new BoardVO();
            vo.setSeq(rs.getInt("seq"));
            vo.setTitle(rs.getString("title"));
            vo.setContent(rs.getString("content"));
            vo.setWriter(rs.getString("writer"));
            vo.setCategory(rs.getString("category"));
            vo.setRegDate(rs.getDate("regdate"));
            vo.setUpdateDate(rs.getDate("updateDate"));
            return vo;
        }
    }

    public BoardVO getBoard(int seq){
        String sql = "select * from TEAM_BOARD where seq=" + seq;
        return jdbcTemplate.queryForObject(sql, new BoardRowMapper());
    }

    public List<BoardVO> getBoardList(){
        String sql = "select * from TEAM_BOARD order by regdate desc";
        return jdbcTemplate.query(sql, new BoardRowMapper());
    }


}
