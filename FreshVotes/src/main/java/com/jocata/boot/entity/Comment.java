package com.jocata.boot.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "comment_tbl")
public class Comment {
	
	@EmbeddedId
	private CommentId cmId;
	@Column(length = 5000)
	private String text;
	
	public CommentId getCmId() {
		return cmId;
	}
	public void setCmId(CommentId cmId) {
		this.cmId = cmId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}
