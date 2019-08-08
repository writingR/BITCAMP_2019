package com.bitcamp.guest.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bitcamp.guest.domain.Message;

public class MessageRowMapper implements RowMapper<Message> {

	@Override
	public Message mapRow(ResultSet rs, int rowNum) throws SQLException {
		Message msg = new Message();
		msg.setId(rs.getInt(1));
		msg.setGuestName(rs.getString(2));
		msg.setPassword(rs.getString(3));
		msg.setMessage(rs.getString(4));
		return msg;
	}

}